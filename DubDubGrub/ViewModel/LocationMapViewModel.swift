//
//  LocationMapViewModel.swift
//  DubDubGrub
//
//  Created by Cody Goeken on 11/23/21.
//

import MapKit

final class LocationMapViewModel: NSObject, ObservableObject {
    enum MapDetails {
        static let startingLocation = CLLocationCoordinate2D(latitude: 37.335480, longitude: -121.893028)
        static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.01)
    }
    
    @Published var isShowingOnboardingView = false
    @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    
    @Published var alertItem: AlertItem?
    
    @Published var locations: [DDGLocation] = []
    
    let kHasSeenOnboardView = "hasSeenOnboardView"
    
    var deviceLocationManager: CLLocationManager?
    
    var hasSeenOnboardView: Bool {
        return UserDefaults.standard.bool(forKey: kHasSeenOnboardView)
    }
    
    func runStartupChecks() {
        if !hasSeenOnboardView {
            isShowingOnboardingView = true
            UserDefaults.standard.set(true, forKey: kHasSeenOnboardView)
        } else {
            checkIfLocationServicesIsEnabled()
        }
    }
    
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            deviceLocationManager = CLLocationManager()
            deviceLocationManager!.delegate = self
        } else {
            alertItem = AlertContext.locationDisabled
        }
    }
    
    func checkLocationAuthorization() {
        guard let deviceLocationManager = deviceLocationManager else {
            return
        }
        
        switch deviceLocationManager.authorizationStatus {
            case .notDetermined:
                deviceLocationManager.requestWhenInUseAuthorization()
            case .restricted:
            alertItem = AlertContext.locationRestricted
            case .denied:
            alertItem = AlertContext.locationDenied
            case .authorizedAlways, .authorizedWhenInUse:
                break
            @unknown default:
                break
        }
    }
    
    func getLocations(for locationManager: LocationManager) {
        CloudKitManager.getLocations { [self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let locations):
                     locationManager.locations = locations
                case .failure(_):
                    alertItem = AlertContext.unableToGetLocations
                }
            }
        }
    }
    
}


extension LocationMapViewModel: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}

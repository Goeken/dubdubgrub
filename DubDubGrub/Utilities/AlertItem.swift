//
//  AlertItem.swift
//  DubDubGrub
//
//  Created by Cody Goeken on 11/23/21.
//

import SwiftUI


struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}


struct AlertContext {
    // Mark: - mapview errors
    
    static let unableToGetLocations = AlertItem(title: Text("Locations Error"),
                                            message: Text("Unable to retrieve locations at this time. \nPlease try again."),
                                            dismissButton: .default(Text("Ok")))
    
    static let locationRestricted = AlertItem(title: Text("Locations Restricted"),
                                            message: Text("This may be due to parental controls."),
                                            dismissButton: .default(Text("Ok")))
    
    static let locationDenied = AlertItem(title: Text("Locations Denied"),
                                            message: Text("App does not have permission to acccess your location. To change that go to your phone's Settings > App name > Location"),
                                            dismissButton: .default(Text("Ok")))
    
    static let locationDisabled = AlertItem(title: Text("Locations Denied"),
                                            message: Text("Your phone's location services are disabled. To change that go to your phone's Settings > Privacy > Location Services"),
                                            dismissButton: .default(Text("Ok")))
    // Mark: - profile view
    static let invalidProfile = AlertItem(title: Text("Invalid Profile"),
                                            message: Text("All fields are required as well as a profile photo. Bio must be less than 100 characters. Please try again"),
                                            dismissButton: .default(Text("Ok")))
}

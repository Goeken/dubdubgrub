//
//  LocationListView.swift
//  DubDubGrub
//
//  Created by Cody Goeken on 11/21/21.
//

import SwiftUI

struct LocationListView: View {
    @EnvironmentObject private var locationManager: LocationManager
    
    var body: some View {
        NavigationView {
            List {
                ForEach(locationManager.locations) { location in
                    NavigationLink {
                        LocationDetailView(location: location)
                    } label: {
                        LocationCell(location: location)
                    }
                }
            }
            .navigationTitle("Grub Spots")
        }
    }
}

struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView()
    }
}

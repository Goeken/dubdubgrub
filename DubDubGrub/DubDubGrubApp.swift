//
//  DubDubGrubApp.swift
//  DubDubGrub
//
//  Created by Cody Goeken on 11/21/21.
//

import SwiftUI

@main
struct DubDubGrubApp: App {
    
    let locationManager = LocationManager()
    
    var body: some Scene {
        WindowGroup {
            AppTabView()
                .environmentObject(locationManager)
        }
    }
}

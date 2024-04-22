//
//  MapAppApp.swift
//  MapApp
//
//  Created by Swayam Rustagi on 20/04/24.
//

import SwiftUI

@main
struct MapAppApp: App {
    @StateObject var viewModel = LocationsViewModel()

    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(viewModel)
        }
    }
}

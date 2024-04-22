//
//  LocationsViewModel.swift
//  MapApp
//
//  Created by Swayam Rustagi on 20/04/24.
//

import Foundation
import MapKit

class LocationsViewModel: ObservableObject{
    
    //all loaded locations
    @Published var locations : [Location]
    
    //current location on the map
    @Published var mapLocation: Location{
        didSet{
            updateMapRegion(location: mapLocation) //updates the map region with thr current location on the map
        }
    }
    
    //Show location detail via sheet
    @Published var sheetLocation: Location? = nil
    
    @Published var showLocationsList: Bool = false
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(
        latitudeDelta: 0.1,
        longitudeDelta: 0.1)
    
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location){
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
    }
    
    func toggleLocationsList(){
        showLocationsList.toggle()
    }
    
    func showNextLocation(location: Location){
        mapLocation = location
        showLocationsList = false
    }
    
    func nextButtonPressed(){
        //Current Index
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation}) else {return}
        
        //Check if nextIndex is valid
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            let firstLocation = locations.first!
            showNextLocation(location: firstLocation)
            return
        } //will check all the indexes in the locations array, and currentIndex is the last array and user presses next, it will go to the first index and so on.
        
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
}

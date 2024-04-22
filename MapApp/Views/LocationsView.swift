//
//  LocationsView.swift
//  MapApp
//
//  Created by Swayam Rustagi on 20/04/24.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var viewModel: LocationsViewModel
    
    var body: some View {
        ZStack {
          Map(
            position: .constant(MapCameraPosition.region(viewModel.mapRegion)),
            bounds: nil,
            interactionModes: .all
          )
            
            VStack(spacing: 0){
                
                header
                    .padding()
                
                Spacer()
                
                ZStack{
                    ForEach(viewModel.locations){location in
                        
                        if viewModel.mapLocation == location{
                            LocationPreviewView(location: location)
                                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.3), radius: 6)
                                .transition(.asymmetric(
                                    insertion: .move(edge: .trailing), removal: .move(edge: .leading))
                                )
                        }
                    }
                }
            }
        }
        .sheet(item: $viewModel.sheetLocation){location in
            LocationDetailView(location: location)
        }

    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}

extension LocationsView{
    private var header: some View{
        VStack {
            Button{
                viewModel.toggleLocationsList()
            }label: {
                Text(viewModel.mapLocation.name + ", " + viewModel.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(.black)
                    .frame(height: 55)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .overlay(alignment: .leading){
                    Image(systemName: "arrow.down")
                        .font(.headline)
                        .foregroundStyle(Color.primary)
                        .padding()
                        .rotationEffect(Angle(degrees: viewModel.showLocationsList ? 190 : 0))
                }
            }
            
            if viewModel.showLocationsList{
                LocationsListView()
            }
            
        }
        .background(.thickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
}

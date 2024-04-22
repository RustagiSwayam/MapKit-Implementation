//
//  LocationDetailView.swift
//  MapApp
//
//  Created by Swayam Rustagi on 22/04/24.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    
    let location: Location
    
    var body: some View {
        ScrollView{
            VStack{
                imageSection
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.3), radius: 15, x: 0, y: 10)
                
                VStack(alignment: .leading, spacing: 15){
                    titleSection
                    Divider()
                    descriptionSection
                    
                    if let url = URL(string: location.link){
                        Link("Read More on WikiPedia", destination: url)
                            .font(.subheadline)
                            .foregroundStyle(Color.blue)
                    }
                    
                    Divider()
                    

                }
                .padding()
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LocationDetailView(location: LocationsDataService.locations.first!)
}

extension LocationDetailView{
    private var imageSection: some View{
        TabView{
            ForEach(location.imageNames, id: \.self){imageName in
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    private var titleSection: some View{
        VStack(alignment: .leading, spacing: 8){
            Text(location.name)
                .font(.largeTitle)
                .bold()
            Text(location.cityName)
                .font(.title3)
                .foregroundStyle(.primary)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
    }
    
    private var descriptionSection: some View{
        VStack(alignment: .leading, spacing: 8){
            Text(location.description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
}

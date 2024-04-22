//
//  LocationsListView.swift
//  MapApp
//
//  Created by Swayam Rustagi on 20/04/24.
//

import SwiftUI

struct LocationsListView: View {
    
    @EnvironmentObject private var viewModel: LocationsViewModel
    
    var body: some View {
        List{
            ForEach(viewModel.locations){ location in
                Button{
                    viewModel.showNextLocation(location: location)
                }label: {
                    HStack{
                        if let imageName = location.imageNames.first{
                            Image(imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 45, height: 45)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                        }
                        
                        VStack(alignment: .leading){
                            Text(location.name)
                                .font(.headline)
                            Text(location.cityName)
                                .font(.caption)
                                .foregroundStyle(.primary)
                        }
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    }
                    .padding(.vertical, 4)
                    .listRowBackground(Color.clear)
                }
            }
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    LocationsListView()
        .environmentObject(LocationsViewModel())
}

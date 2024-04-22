//
//  LocationPreviewView.swift
//  MapApp
//
//  Created by Swayam Rustagi on 22/04/24.
//

import SwiftUI

struct LocationPreviewView: View {
    @EnvironmentObject private var viewModel : LocationsViewModel
    let location: Location
    
    var body: some View {
        
        HStack(alignment: .bottom, spacing: 0){
            VStack(alignment: .leading, spacing: 16){
                imageSection
                textSection
            }
            
            VStack{
                learnMoreButton
                nextButton
            }
        }
        .padding()
        .background(
        RoundedRectangle(cornerRadius: 10)
            .fill(.ultraThinMaterial)
            .offset(y: 65)
        )
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding()
    }
}

#Preview {
    LocationPreviewView(location: LocationsDataService.locations.first!)
        .environmentObject(LocationsViewModel())
}

extension LocationPreviewView{
    private var imageSection: some View{
        ZStack{
            if let imageName = location.imageNames.first{
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .padding(6)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    private var textSection: some View{
        VStack(alignment: .leading, spacing: 4){
            Text(location.name)
                .font(.title2)
                .bold()
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
    }
    
    private var learnMoreButton: some View{
        Button{
            viewModel.sheetLocation = location
        }label: {
            Text("Learn More")
                .foregroundStyle(Color.white)
                .padding()
                .frame(width: 125, height: 50)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 5))
        }
    }
    
    private var nextButton: some View{
        Button{
            viewModel.nextButtonPressed()
        }label: {
            Text("Next")
                .padding()
                .frame(width: 125, height: 50)
                .background(.black.opacity(0.1))
                .foregroundStyle(Color.red)
                .clipShape(RoundedRectangle(cornerRadius: 5))
        }
    }
}

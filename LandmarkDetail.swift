//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by fasih zaidi on 08/07/2024.
//

import SwiftUI

struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData
    var landmark: Landmark
    var landmarkIndex: Int
    {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
  var body: some View {
    
      VStack{
          @Bindable var modelData = modelData
          ScrollView {
            MapView(coordinate : landmark.locationCoordinate)
                .frame(height: 300)
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading){
                HStack{
                    Text(landmark.name)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    favoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                HStack {
                    Text(landmark.park)
                    
                    Spacer()
                    
                    Text(landmark.state)
                }
                
                .font(.subheadline)
                .foregroundColor(.secondary)
                Divider()
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmarks.description)
            }
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
      .padding(10)
    }
       
}

#Preview {
    let modelData = ModelData()
    return LandmarkDetail(landmark: modelData.landmarks[1])
        .environment(modelData)
}

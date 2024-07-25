//
//  CategoryHome.swift
//  Landmarks
//
//  Created by fasih zaidi on 10/07/2024.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    @State private var showingProfile = false
    var body: some View {
        NavigationSplitView {
            List {
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0)})
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self)
                {
                    key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                
                Button {
                    showingProfile.toggle()
                    
                }
            label: {
                Label("User profile", systemImage:  "person.crop.circle")
            }
            }
            .sheet(isPresented: $showingProfile)
            {
                ProfileHost()
                    .environment(modelData)
            }
        }
        
    detail: {
        Text("Select the landmark")
    }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}

//
//  favoriteButton.swift
//  Landmarks
//
//  Created by fasih zaidi on 08/07/2024.
//

import SwiftUI

struct favoriteButton: View {
    @Binding var isSet: Bool
    var body: some View {
        Button {
            isSet.toggle()
        }
    label: {
        Label("Toggle favorite",systemImage: isSet ? "star.fill" : "star")
            .labelStyle(.iconOnly)
            .foregroundStyle(isSet ? .yellow : .gray)
        }
    }
}
#Preview {
    favoriteButton(isSet: .constant(true))
}

/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The plant view.
*/

import SwiftUI
import BackyardBirdsData
import LayeredArtworkLibrary

public struct PlantView: View {
    let plant: Plant
    let index: Int
    
    public init(plant: Plant, index: Int) {
        self.plant = plant
        self.index = index
    }
    
    public var body: some View {
        ComposedPlant(plant: plant)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .colorMultiply(.init(white: 1.0 - (0.1 * Double(2 - index))))
    }
}

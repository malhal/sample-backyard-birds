/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The plant search results.
*/

import SwiftUI
import SwiftData
import BackyardBirdsData

struct PlantsSearchResults: View {
    let searchText: String
    @Query(sort: \Plant.creationDate) private var plants: [Plant]
    
    var body: some View {
        if searchText.isEmpty {
            ForEach(plants) { plant in
                PlantSummaryRow(plant: plant)
            }
        } else {
            ForEach(plants.filter {
                $0.speciesName.contains(searchText)
            }, content: {
                PlantSummaryRow(plant: $0)
            })
        }
    }
}

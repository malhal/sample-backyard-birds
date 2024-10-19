/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The backyard search results.
*/

import SwiftUI
import SwiftData
import BackyardBirdsData

struct BackyardsSearchResults: View {
    @Query private var backyards: [Backyard]
    
    var body: some View {
        ForEach(backyards) { backyard in
            BackyardGridItem(backyard: backyard)
        }
    }
}

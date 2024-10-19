/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The bird search results.
*/

import SwiftUI
import SwiftData
import BackyardBirdsData

struct BirdsSearchResults<Content: View>: View {
    let searchText: String
    @Query(sort: \Bird.creationDate) private var birds: [Bird]
    var content: (Bird) -> Content
    
    var body: some View {
        if searchText.isEmpty {
            ForEach(birds, content: content)
        } else {
            ForEach(birds.filter {
                $0.speciesName.contains(searchText)
            }, content: content)
        }
    }
}

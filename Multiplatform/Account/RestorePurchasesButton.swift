/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The restore purchases button.
*/

import SwiftUI
import StoreKit

struct RestorePurchasesButton: View {
    @State private var isRestoring = false
    
    var body: some View {
        Button("Restore Purchases") {
            isRestoring = true
            Task {
                try await AppStore.sync()
                isRestoring = false
            }
        }
        .disabled(isRestoring)
    }
    
}

#Preview {
    RestorePurchasesButton()
}

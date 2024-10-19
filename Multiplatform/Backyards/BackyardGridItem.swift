/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The backyard grid item.
*/

import SwiftUI
import BackyardBirdsUI
import BackyardBirdsData

public struct BackyardGridItem: View {
    var backyard: Backyard
    
    public var body: some View {
        ZStack {
            NavigationLink(value: backyard.id) {
                BackyardViewport(backyard: backyard)
            }
            .buttonStyle(.plain)
                
            VStack {
                Header(backyard: backyard)
                Spacer()
                SupplyGauges(backyard: backyard)
            }
        }
        .contentShape(.containerRelative)
        .containerShape(.rect(cornerRadius: 20))
    }
    
    public struct Header: View {
        let backyard: Backyard
        
        public var body: some View {
            HStack {
                Text(backyard.name)
                    .font(.callout)
                    .padding(8)
                    .background()
                    .allowsHitTesting(false)
                
                Spacer()
                
                Button {
                    backyard.isFavorite.toggle()
                } label: {
                    Label("Favorite", systemImage: "star")
                        .symbolVariant(backyard.isFavorite ? .fill : .none)
                        .contentTransition(.symbolEffect(backyard.isFavorite ? .replace.upUp : .replace.downUp))
                        .padding(8)
                        .background(in: .circle)
                }
                .buttonStyle(.plain)
                .buttonBorderShape(.circle)
                .labelStyle(.iconOnly)
            }
            .foregroundStyle(Color.secondary)
            .backgroundStyle(.regularMaterial)
            .padding(8)
        }
    }
    
    public struct SupplyGauges: View {
        let backyard: Backyard
        
        public var body: some View {
            HStack {
                BackyardSupplyGauge(backyard: backyard, supplies: .food)
                    .scaleEffect(0.65)
                    .padding(8)
                    .frame(width: 44, height: 44)
                    .background(in: .circle)
                Spacer()
                BackyardSupplyGauge(backyard: backyard, supplies: .water)
                    .scaleEffect(0.65)
                    .padding(8)
                    .frame(width: 44, height: 44)
                    .background(in: .circle)
            }
            .padding(8)
            .backgroundStyle(.regularMaterial)
            .allowsHitTesting(false)
        }
    }
}

#Preview {
    ModelPreview { backyard in
        BackyardGridItem(backyard: backyard)
    }
}

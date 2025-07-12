//
//----------------------------------------------
// Original project: PickerPackageDemo
// by  Stewart Lynch on 2025-07-09
//
// Follow me on Mastodon: https://iosdev.space/@StewartLynch
// Follow me on Threads: https://www.threads.net/@stewartlynch
// Follow me on Bluesky: https://bsky.app/profile/stewartlynch.bsky.social
// Follow me on X: https://x.com/StewartLynch
// Follow me on LinkedIn: https://linkedin.com/in/StewartLynch
// Email: slynch@createchsol.com
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch
//----------------------------------------------
// Copyright © 2025 CreaTECH Solutions. All rights reserved.

import SwiftUI
import EmojiPicker
import SFSymbolPicker

struct SamplePickerView: View {
    @State private var myEmoji = "😀"
    @State private var pickEmoji = false
    @State private var symbol = "questionmark.circle.fill"
    @State private var pickSymbol = false
    private var loader = SymbolLoader()
    
    var body: some View {
        NavigationStack {
            VStack {
                Button {
                    pickEmoji.toggle()
                } label: {
                    Text(myEmoji)
                }
                Button {
                    pickSymbol.toggle()
                } label: {
                    Image(systemName: symbol)
                        .foregroundStyle(.red)
                }
            }
            .font(.system(size: 100))
            .padding()
            .navigationTitle("Sample Pickers")
            .sheet(isPresented: $pickEmoji) {
                EmojiPickerView(selectedEmoji: $myEmoji)
            }
            .sheet(isPresented: $pickSymbol) {
                SymbolView(
                    loader: loader,
                    selectedSymbol: $symbol,
                    limitedCategories: [.fitness, .communication]
                )
                .presentationDetents([.medium])
            }
        }
    }
}

#Preview {
    SamplePickerView()
}

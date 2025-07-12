//
//----------------------------------------------
// Original project: PickerPackageDemo
// by  Stewart Lynch on 2025-07-12
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
import SFSymbolPicker

struct FolderStyleView: View {
    var loader: SymbolLoader
    @Bindable var folder: Folder
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Image(systemName: folder.symbol)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                        .foregroundStyle(folder.color)
                    ColorPicker("Color", selection: $folder.color)
                }
                .frame(width: 150)
                SymbolView(
                    loader: loader,
                    selectedSymbol: $folder.symbol,
                    withDismiss: false
                )
            }
            .navigationTitle(folder.name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var folder = Folder.samples[0]
    FolderStyleView(loader: SymbolLoader(), folder: folder)
}

//
//----------------------------------------------
// Original project: PickerPackageDemo
// by  Stewart Lynch on 2025-07-10
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

@Observable
class Folder: Identifiable {
    var name: String
    var symbol: String
    var color: Color
    let id = UUID()
    init(name: String = "", symbol: String = "questionmark", color: Color = .yellow) {
        self.name = name
        self.symbol = symbol
        self.color = color
    }
    
    static var samples: [Folder] {
        [
            .init(name: "Work", symbol: "briefcase", color: .red),
            .init(name: "Personal", symbol: "figure", color: .green),
            .init(name: "Shopping", symbol: "cart", color: .blue)
        ]
    }
}


import SwiftUI
import SFSymbolPicker

struct MyFoldersView: View {
    @State private var myFolders = Folder.samples
    private let loader = SymbolLoader()
    @State private var selectedFolder: Folder?
    var body: some View {
            NavigationStack {
                List($myFolders, editActions: .delete) { $folder in
                    HStack {
                        ZStack {
                            Image(systemName: "folder.fill")
                                .fontWeight(.thin)
                                .font(.system(size: 60))
                                .foregroundStyle(folder.color)
                            Image(systemName: folder.symbol)
                                .fontWeight(.thin)
                                .foregroundStyle(.white)
                                .font(.system(size: 30))
                                .offset(y: 5)
                        }
                        .onTapGesture {
                            selectedFolder = folder
                        }
                        TextField("name", text: $folder.name)
                            .font(.largeTitle)
                    }
                }
                .sheet(item: $selectedFolder, content: { folder in
                    FolderStyleView(loader: loader, folder: folder)
                })
                .navigationTitle("My Folders")
                .scrollBounceBehavior(.basedOnSize)
                .toolbar {
                    Button {
                        myFolders.append(Folder())
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                }
            }
    }
}

#Preview {
    MyFoldersView()
}

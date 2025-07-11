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

// https://github.com/StewartLynch/SFSymbolPicker
// https://github.com/StewartLynch/EmojiPicker

import SwiftUI

struct StartTabView: View {
    var body: some View {
        TabView {
            Tab("Sample", systemImage: "scissors.circle.fill") {
                SamplePickerView()
            }
            Tab("Mood Tracker", systemImage: "face.smiling") {
                MoodTrackerView()
            }
            Tab("My Folders", systemImage: "folder") {
                MyFoldersView()
            }
        }
    }
}

#Preview {
    StartTabView()
}

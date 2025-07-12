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

struct Mood: Identifiable {
    var id = UUID()
    let date: Date = Date.now
    let emoji: String
    let mood: String
    
    init(emoji: String = "😀", mood: String) {
        self.emoji = emoji
        self.mood = mood
    }
}

import SwiftUI

struct MoodTrackerView: View {
    @State private var mood = ""
    let emoji = "😀"
    @State private var myMoods: [Mood] = []
    var body: some View {
        NavigationStack{
            HStack {
                    Text(emoji)
                        .font(.title)
                TextField("How do you feel?", text: $mood)
                    .textFieldStyle(.roundedBorder)
                Button("Record", systemImage: "plus.circle.fill") {
                    let currentMood = Mood(emoji: emoji, mood: mood)
                    myMoods.append(currentMood)
                    mood = ""
                }
                .disabled(mood.isEmpty)
            }
            .padding()
            List {
                ForEach(myMoods.sorted(using: KeyPathComparator(\.date, order: .reverse))) { status in
                    VStack(alignment: .leading) {
                        HStack {
                            Text(status.emoji)
                                .font(.largeTitle)
                            Text(status.mood)
                        }
                        Text(status.date, format: .dateTime)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .swipeActions {
                        Button(role:.destructive) {
                            if let index = myMoods.firstIndex(where: {$0.id == status.id}) {
                                myMoods.remove(at: index)
                            }
                        } label: {
                            Image(systemName: "trash")
                        }
                    }
                }
            }
            .listStyle(.plain)
            .scrollBounceBehavior(.basedOnSize)
            .navigationTitle("Mood Tracker")
        }
    }
}

#Preview {
    MoodTrackerView()
}

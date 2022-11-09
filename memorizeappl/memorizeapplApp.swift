//
//  memorizeapplApp.swift
//  memorizeappl
//
//  Created by Ryamsey Ryam on 4/11/2022.
//

import SwiftUI

@main
struct memorizeapplApp: App {
    var game = EmojiCardGame();
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game);
        }
    }
}

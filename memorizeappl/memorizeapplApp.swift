//
//  memorizeapplApp.swift
//  memorizeappl
//
//  Created by Ryamsey Ryam on 4/11/2022.
//

import SwiftUI

@main
struct memorizeapplApp: App {
    private let game = EmojiCardGame();
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game);
        }
    }
}

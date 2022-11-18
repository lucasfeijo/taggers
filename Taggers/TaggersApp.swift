//
//  TaggersApp.swift
//  Taggers
//
//  Created by Lucas C. Feijo on 18/11/22.
//

import SwiftUI

@main
struct TaggersApp: App {
  @StateObject var radio = Radio()

  var body: some Scene {
    WindowGroup {
      TagListView(tags: radio.tags)
        .environmentObject(radio)
    }
  }
}

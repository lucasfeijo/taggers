//
//  TagListView.swift
//  Taggers
//
//  Created by Lucas C. Feijo on 18/11/22.
//

import SwiftUI

struct TagListView: View {
  @EnvironmentObject var radio: Radio
  var tags: [Tag]

  var list: some View {
    List {
      ForEach(radio.tags) { tag in
        VStack {
          Text("\(tag.name)").font(.body)
          Text("\(tag.id)").font(.caption)
        }
      }
      if radio.tags.isEmpty {
        Text("No tags")
      }
    }
  }

  var body: some View {
    list
      .onAppear {
        radio.startReadingTags()
      }
      .onDisappear {
        radio.stopReadingTags()
      }
  }
}

struct TagListView_Previews: PreviewProvider {
  static var previews: some View {
    TagListView(tags: [
      Tag(id: UUID(), name: "Example 1"),
      Tag(id: UUID(), name: "Example 2")
    ])
  }
}

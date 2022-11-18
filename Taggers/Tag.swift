//
//  Tag.swift
//  Taggers
//
//  Created by Lucas C. Feijo on 18/11/22.
//

import Foundation

struct Tag: Identifiable {
  var id: UUID
  var name: String
  var content: Data?
}

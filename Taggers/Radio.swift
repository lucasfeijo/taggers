//
//  Radio.swift
//  Taggers
//
//  Created by Lucas C. Feijo on 18/11/22.
//

import Foundation

class BaseRadio: NSObject, ObservableObject {
  @Published var tags: [Tag] = []
  @Published var error: Error?

  func startReadingTags() {}
  func stopReadingTags() {}
}

#if canImport(CoreNFC)
import CoreNFC

class Radio: BaseRadio {
  var session: NFCNDEFReaderSession!

  override init() {
    super.init()
    self.session = .init(delegate: self, queue: .main, invalidateAfterFirstRead: true)
  }

  override func startReadingTags() {
    session.begin()
  }

  override func stopReadingTags() {
    // stop session
  }
}

extension Radio: NFCNDEFReaderSessionDelegate {
  func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
    self.error = error
  }

  func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
    for message in messages {
      for record in message.records {
        if let string = String(data: record.payload, encoding: .ascii) {
          print(string)
        }
      }
    }
  }
}
#endif

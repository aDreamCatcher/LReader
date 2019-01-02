//
//  ReaderPath.swift
//  LReader
//
//  Created by lgy on 2019/1/2.
//  Copyright © 2019 lgy. All rights reserved.
//

import Foundation

struct ReaderPath {
    static let shared = ReaderPath()

    // MAKR: - instance properties

    private let shelfDirectory = "/bookShelf"
    var shelfPath: String

    // MARK: - initialization

    init() {
        let basePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        shelfPath = basePath.appending(shelfDirectory)

        guard FileManager.default.fileExists(atPath: shelfPath) else {
            do {
                try FileManager.default.createDirectory(atPath: shelfPath, withIntermediateDirectories: true, attributes: nil)
            } catch let error as NSError {
                print("ReaderPath initialization error: " + error.domain)
            }

            return
        }
    }
}

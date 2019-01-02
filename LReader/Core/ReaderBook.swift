//
//  ReaderBook.swift
//  LReader
//
//  Created by lgy on 2018/12/21.
//  Copyright © 2018 lgy. All rights reserved.
//

import Foundation

/// This Class
class ReaderBook {
    static let shared = ReaderBook()

    /**
     this method read content of file by local path

     - parameter path: file's path
     - returns: content of file
     */
    func read(from path: String) -> String? {

        var bookContent = try? String.init(contentsOfFile: path)

        if bookContent == nil {
            bookContent = try? String.init(contentsOfFile: path, encoding: .init(rawValue: 0x80000631))
        }

        if bookContent == nil {
            bookContent = try? String.init(contentsOfFile: path, encoding: .init(rawValue: 0x80000632))
        }
        
        return bookContent
    }
}

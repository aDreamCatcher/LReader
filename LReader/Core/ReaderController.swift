//
//  ReaderController.swift
//  LReader
//
//  Created by lgy on 2019/1/2.
//  Copyright © 2019 lgy. All rights reserved.
//

import Foundation

/**
 */
class ReaderController {
    static let shared = ReaderController()

    // MARK: - instance properties

    // array of local books
    var books: Array<BookPathModel>? {
        let shelfPath = ReaderPath.shared.shelfPath

        do {
            let paths = try FileManager.default.contentsOfDirectory(atPath: shelfPath)
            let bookPaths: [BookPathModel] = paths.compactMap {
                BookPathModel.init(shelfPath, fileName: $0)
            }

            return bookPaths
        } catch let error as NSError {
            print("books error: " + error.domain)
        }

        return nil
    }

    // MARK: - initializations

    // MARK: - functions

    /**
     This method convert BookPathModel to BookModel

     - parameter pathModel: instance of BookPathModel
     - returns: an optional value of BookModel
     */
    func parserBook(_ pathModel: BookPathModel) -> BookModel? {
        guard let content = ReaderBook.shared.read(from: pathModel.path) else {
            return nil
        }

        guard let chapters = ReaderParser.shared.parserBook(content) else {
            return nil
        }
        
        let bookModel = BookModel.init(pathModel, chapters: chapters)

        return bookModel
    }
}

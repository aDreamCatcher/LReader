//
//  ParserBook.swift
//  LReader
//
//  Created by lgy on 2018/12/21.
//  Copyright © 2018 lgy. All rights reserved.
//

import Foundation

/**
 ## Feature Support

 This class does some awesome things. It supports:

 - Get instance of BookModel by parsering content of book.
 - Get collection of book's website information by parsering URL.

 ## Examples

 Here is an example:

     let bookParser = ParserBook()
     let bookModel = bookParser.parserBook(content)

 ## Warnings

 There are some things you should be careful of:

 1. Returen value is nil, if parser failed.

 */
class ReaderParser {
    static let shared = ReaderParser()

    func parserBook(_ content: String) -> [ChapterModel]? {
        let pattern = "第[ ]*[0-9一二三四五六七八九十百千万]*[ ]*[章回].*"
        do {
            let regularExp = try NSRegularExpression.init(pattern: pattern, options: .caseInsensitive)
            let checkingResults = regularExp.matches(in: content, options: .reportCompletion, range: NSMakeRange(0, content.count))

            var chapters: [ChapterModel] = []

            var lastRange = NSRange.init(location: 0, length: 0)
            for (index, value) in checkingResults.enumerated() {
                // chapter title
                let titleRange = lastRange

                // chapter content
                let length = value.range.location - lastRange.location
                let contentRange = NSRange.init(location: lastRange.location, length: length)

                // instance of ChapterModel
                let chapterModel = makeChapter(index,
                                               titleRange: titleRange,
                                               contentRange: contentRange,
                                               bookContent: content)
                // append
                chapters.append(chapterModel)

                // last Chapter
                if index == checkingResults.count - 1 {
                    // chapter title
                    let titleRange = value.range

                    // chapter content
                    let length = content.count - value.range.location
                    let contentRange = NSRange.init(location: value.range.location, length: length)

                    // make instance of ChapterModel
                    let chapterModel = makeChapter(index + 1,
                                                   titleRange: titleRange,
                                                   contentRange: contentRange,
                                                   bookContent: content)

                    // append
                    chapters.append(chapterModel)
                }

                lastRange = value.range
            }

            return chapters

        } catch let error as NSError {
            print("parserBook error: " + error.domain)
        }

        return nil
    }
    
}

// MARK: - private methods

extension ReaderParser {

    func makeChapter(_ index: Int,
                     titleRange: NSRange,
                     contentRange: NSRange,
                     bookContent: String) -> ChapterModel {
        // chapter title
        var title = ""
        if let titleRange = Range.init(titleRange, in: bookContent)  {
            title = String(bookContent[titleRange])
        }

        // chapter content
        guard let chapterRange = Range.init(contentRange, in: bookContent) else {
            let chapterModel = ChapterModel.init(index, title: title, content: "")
            return chapterModel
        }

        let chapterContent = String(bookContent[chapterRange])
        let chapterModel = ChapterModel.init(index, title: title, content: chapterContent)

        return chapterModel
    }
}

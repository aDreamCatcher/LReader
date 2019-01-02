//
//  BookModel.swift
//  LReader
//
//  Created by lgy on 2019/1/2.
//  Copyright © 2019 lgy. All rights reserved.
//

import Foundation

class BookModel {

    // MARK: - instance properties

    var name: String = ""
    var chapters: [ChapterModel]

    // MARK: - initialization

    init(_ pathModel: BookPathModel, chapters: [ChapterModel]) {
        name = pathModel.name
        self.chapters = chapters
    }
}

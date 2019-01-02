//
//  ChapterModel.swift
//  LReader
//
//  Created by lgy on 2019/1/2.
//  Copyright © 2019 lgy. All rights reserved.
//

import Foundation

class ChapterModel {

    // MAKR: - instance properties

    var chapterIndex = 0
    var chapterTitle = ""
    var chapterContent = ""

    // MAKR: - initialization

    init(_ index: Int, title: String, content: String) {
        chapterIndex = index
        chapterTitle = title
        chapterContent = content
    }
}

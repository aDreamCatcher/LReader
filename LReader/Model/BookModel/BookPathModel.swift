//
//  BookPathModel.swift
//  LReader
//
//  Created by lgy on 2019/1/2.
//  Copyright © 2019 lgy. All rights reserved.
//

import Foundation

struct BookPathModel {

    // MARK: - instance properties

    var path: String
    var name: String

    // MARK: - initialization
    init(_ basePath: String, fileName: String) {
        path = basePath.appending("/" + fileName)
        name = fileName
    }
}

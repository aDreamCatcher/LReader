//
//  CatalogItemLayout.swift
//  LReader
//
//  Created by lgy on 2019/1/8.
//  Copyright © 2019 lgy. All rights reserved.
//

import UIKit
import LayoutKit

class CatalogItemLayout: StackLayout<View> {
    public init(text: String = "no text") {
        super.init(axis: .horizontal,
                   sublayouts: [LabelLayout(text: text)])
    }
}

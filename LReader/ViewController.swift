//
//  ViewController.swift
//  LReader
//
//  Created by lgy on 2018/12/21.
//  Copyright © 2018 lgy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        print(ReaderController.shared.books ?? "no books")

        let books = ReaderController.shared.books
        if let books = books {
            let pathModel = books[0]
            ReaderController.shared.parserBook(pathModel)
        }


        
    }


}


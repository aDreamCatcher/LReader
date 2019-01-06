//
//  ReaderViewController.swift
//  LReader
//
//  Created by lgy on 2019/1/3.
//  Copyright © 2019 lgy. All rights reserved.
//

import UIKit

class ReaderViewController: UIViewController {
    // MARK: - instance properties

    private var bookModel: BookModel?

    private var activityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)

    private var topToolBar = UIToolbar(frame: .zero)
    private var bottomToolBar = UIToolbar(frame: .zero)

    // MARK: - initialization

    public init(book pathModel: BookPathModel) {
        activityIndicatorView.startAnimating()
        bookModel = ReaderController.shared.parserBook(pathModel)
        activityIndicatorView.stopAnimating()

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let bookModel = bookModel else {
            return
        }

        for chapter in bookModel.chapters {
            print(chapter.chapterTitle)
        }

        setupUI()
    }

    // MARK: - ui

    func setupUI() {
        // topToolBar items
    }

}

// topToolBar & bottomToolBar logic
extension ReaderViewController {

    func setupTopToolBar() {
        let backItem = UIBarButtonItem(image: UIImage(named: "toolBar_back"),
                                       style: UIBarButtonItem.Style.plain,
                                       target: self,
                                       action: #selector(back))

        let catalogItem = UIBarButtonItem(title: "Catalog",
                                          style: UIBarButtonItem.Style.plain,
                                          target: self,
                                          action: #selector(showCatalog))

        topToolBar.setItems([backItem, catalogItem], animated: false)
    }

    @objc func back() {
    }

    @objc func showCatalog() {
    }
}

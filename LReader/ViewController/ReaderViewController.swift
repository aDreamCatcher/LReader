//
//  ReaderViewController.swift
//  LReader
//
//  Created by lgy on 2019/1/3.
//  Copyright © 2019 lgy. All rights reserved.
//

import UIKit
import LayoutKit

class ReaderViewController: UIViewController {
    // MARK: - instance properties

    private var bookModel: BookModel?

    private var activityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)

    private var topToolBar = UIToolbar(frame: .zero)
    private var bottomToolBar = UIToolbar(frame: .zero)

    private let topBarHeight = {
        // TODO: return different value by device
        return CGFloat(64.0)
    }()

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

        setupTopToolBar()
        setupBottomToolBar()
    }

}

// topToolBar & bottomToolBar logic
extension ReaderViewController {

    // MARK: - top/bottom bar ui
    func setupTopToolBar() {
        let backItem = UIBarButtonItem(image: UIImage(named: "toolBar_back"),
                                       style: UIBarButtonItem.Style.plain,
                                       target: self,
                                       action: #selector(backAction))

        topToolBar.setItems([backItem], animated: false)

        view.addSubview(topToolBar)

        topToolBar.addConstraints([
            NSLayoutConstraint(item: topToolBar,
                               attribute: .bottom,
                               relatedBy: .equal,
                               toItem: view,
                               attribute: .top,
                               multiplier: 1.0,
                               constant: 0.0)
            ])
    }

    func setupBottomToolBar() {
        // TODO: items[catalogItem, FontItem, dayNightItem ...]
        let catalogItem = UIBarButtonItem(title: "catalog",
                                          style: .plain,
                                          target: self,
                                          action: #selector(catalogAction))

        bottomToolBar.setItems([catalogItem], animated: false)
    }


    // MARK: - actions

    @objc private func backAction() {
    }

    @objc private func catalogAction() {
    }

}

//
//  MainViewController.swift
//  LReader
//
//  Created by lgy on 2019/1/3.
//  Copyright © 2019 lgy. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    // MARK: - Constants

    let reuseIdentifier = "mainCollectionViewCellIdentifier"

    // MARK: - instance properties

    private let mainCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.minimumLineSpacing = 1.0
        flowLayout.minimumInteritemSpacing = 1.0

        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0),
                                              collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.clear

        return collectionView
    }()

    private var books = ReaderController.shared.books

    // MARK: - initialization

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // setup ui
        setupUI()
    }

    // MARK: - ui

    private func setupUI() {

        mainCollectionView.register(MainCollectionViewCell.self,
                                forCellWithReuseIdentifier: reuseIdentifier)
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
        view.addSubview(mainCollectionView)

        setupConstraint()
    }

    private func setupConstraint() {
        mainCollectionView.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = NSLayoutConstraint(item: mainCollectionView,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: view,
                                               attribute: .top,
                                               multiplier: 1.0,
                                               constant: 0.0)

        let leftConstraint = NSLayoutConstraint(item: mainCollectionView,
                                                attribute: .left,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: .left,
                                                multiplier: 1.0,
                                                constant: 20.0)

        let bottomConstraint = NSLayoutConstraint(item: mainCollectionView,
                                                  attribute: .bottom,
                                                  relatedBy: .equal,
                                                  toItem: view,
                                                  attribute: .bottom,
                                                  multiplier: 1.0,
                                                  constant: 0.0)

        let rightConstraint = NSLayoutConstraint(item: mainCollectionView,
                                                 attribute: .right,
                                                 relatedBy: .equal,
                                                 toItem: view,
                                                 attribute: .right,
                                                 multiplier: 1.0,
                                                 constant: -20.0)

        view.addConstraints([topConstraint,
                             leftConstraint,
                             bottomConstraint,
                             rightConstraint])
    }

    // MARK: - private methods

    private func assign(value bookPathModel: BookPathModel, to cell: MainCollectionViewCell) {
        cell.contentLabel.text = bookPathModel.name
    }

    func startReading(book pathModel: BookPathModel) {
        let readerViewController = ReaderViewController(book: pathModel)
        
        self.present(readerViewController,
                     animated: true,
                     completion: nil)
    }

}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    // MARK: - collectionView datasource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MainCollectionViewCell

        if let bookPathModel = books?[indexPath.row] {
            assign(value: bookPathModel, to: cell)
        }

        return cell
    }


    // MARK: - collectionView delegate

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let book = books?[0] else {
            // invalid value
            return
        }

        startReading(book: book)
    }

    // MARK: - collectionViewDelegateFlowlayout

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.width, height: 55.0)
    }

}

extension UIView {

    open var width: CGFloat {
        get {
            return self.frame.size.width
        }
    }
}

//
//  MainCollectionViewCell.swift
//  LReader
//
//  Created by lgy on 2019/1/3.
//  Copyright © 2019 lgy. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {

    // MARK: - instance properties

    let contentLabel: UILabel

    override init(frame: CGRect) {

        contentLabel = UILabel()
        contentLabel.backgroundColor = UIColor.clear

        super.init(frame: frame)

        contentView.addSubview(contentLabel)
        
        initConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - private methods

    private func initConstraints() {
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = NSLayoutConstraint(item: contentLabel,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: contentView,
                                               attribute: .top,
                                               multiplier: 1.0,
                                               constant: 0)

        let leftConstraint = NSLayoutConstraint(item: contentLabel,
                                                attribute: .left,
                                                relatedBy: .equal,
                                                toItem: contentView,
                                                attribute: .left,
                                                multiplier: 1.0,
                                                constant: 0.0)

        let bottomConstraint = NSLayoutConstraint(item: contentLabel,
                                                  attribute: .bottom,
                                                  relatedBy: .equal,
                                                  toItem: contentView,
                                                  attribute: .bottom,
                                                  multiplier: 1.0,
                                                  constant: 0.0)

        let rightConstraint = NSLayoutConstraint(item: contentLabel,
                                                 attribute: .right,
                                                 relatedBy: .equal,
                                                 toItem: contentView,
                                                 attribute: .right,
                                                 multiplier: 1.0,
                                                 constant: 0.0)

        contentView.addConstraints([topConstraint,
                        leftConstraint,
                        bottomConstraint,
                        rightConstraint])
    }

}


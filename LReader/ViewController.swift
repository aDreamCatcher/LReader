//
//  ViewController.swift
//  LReader
//
//  Created by lgy on 2018/12/21.
//  Copyright © 2018 lgy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - instance properties

    let mainTabBarController = UITabBarController()

    let mainViewController = MainViewController()

    let searchViewController = UIViewController()

    // MARK: - instance initialization

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        setupUI()
    }

    // MARK: - setup ui

    private func setupUI() {
        mainViewController.title = "SHELF"
        searchViewController.title = "SEARCH"

        let mainNavigationController = UINavigationController(rootViewController: mainViewController)
        let searchNavigationController = UINavigationController(rootViewController: searchViewController)

        mainTabBarController.setViewControllers([mainNavigationController, searchNavigationController],
                                                animated: true)

        addChild(mainTabBarController)
        view.addSubview(mainTabBarController.view)
        mainTabBarController.didMove(toParent: self)
    }

}


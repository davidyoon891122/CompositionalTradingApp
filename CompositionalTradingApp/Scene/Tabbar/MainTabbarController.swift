//
//  MainTabbarController.swift
//  CompositionalTradingApp
//
//  Created by jiwon Yoon on 2023/07/21.
//

import UIKit

final class MainTabbarController: UITabBarController {
    weak var coordinator: MainCoordinator?
    
    private lazy var tabbarViewControllers: [UIViewController] = TabbarItem.allCases.map {
        let viewController = $0.viewController
        viewController.tabBarItem = UITabBarItem(title: $0.title, image: $0.tabbarIcon.default, selectedImage: $0.tabbarIcon.selected)
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabbar()
    }
}

private extension MainTabbarController {
    func configureTabbar() {
        viewControllers = tabbarViewControllers
    }
}

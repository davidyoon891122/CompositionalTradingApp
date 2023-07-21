//
//  MainCoordinator.swift
//  CompositionalTradingApp
//
//  Created by jiwon Yoon on 2023/07/21.
//

import UIKit

final class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let mainTabbarController = MainTabbarController()
        
        navigationController.pushViewController(mainTabbarController, animated: false)
    }
    
    func stock() {
        let stockViewController = StockViewController()
        stockViewController.coordinator = self
        navigationController.pushViewController(stockViewController, animated: true)
    }
}

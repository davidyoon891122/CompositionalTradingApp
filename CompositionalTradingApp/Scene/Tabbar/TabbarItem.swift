//
//  TabbarItem.swift
//  CompositionalTradingApp
//
//  Created by jiwon Yoon on 2023/07/21.
//

import UIKit

enum TabbarItem: CaseIterable {
    case stock
    case info
    case order
    case settings
    
    
    var title: String {
        switch self {
        case .stock:
            return "종목"
        case .info:
            return "공모주 일정"
        case .order:
            return "주문내역"
        case .settings:
            return "내 정보"
        }
    }
    
    var tabbarIcon: (default: UIImage?, selected: UIImage?) {
        switch self {
        case .stock:
            return (
                UIImage(systemName: "house"),
                UIImage(systemName: "house")
            )
        case .info:
            return (
                UIImage(systemName: "house"),
                UIImage(systemName: "house")
            )
        case .order:
            return (
                UIImage(systemName: "house"),
                UIImage(systemName: "house")
            )
        case .settings:
            return (
                UIImage(systemName: "house"),
                UIImage(systemName: "house")
            )
        }
    }
    
    var viewController: UIViewController {
        switch self {
        case .stock:
            return StockViewController()
        case .info:
            return UIViewController()
        case .order:
            return UIViewController()
        case .settings:
            return UIViewController()
        }
    }
}

//
//  StockViewController.swift
//  CompositionalTradingApp
//
//  Created by jiwon Yoon on 2023/07/21.
//

import UIKit

final class StockViewController: UIViewController {    
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

private extension StockViewController {
    func setupViews() {
        view.backgroundColor = .systemCyan
    }
}

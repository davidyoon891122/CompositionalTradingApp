//
//  StockDisplayModel.swift
//  CompositionalTradingApp
//
//  Created by jiwon Yoon on 2023/07/21.
//

import Foundation

struct StockDisplayModel: Hashable {
    let stockInfoModel: [StockInfoModel]
}

struct StockInfoModel: Hashable {
    let name: String
    let imageName: String
    let price: Int
    let change: Double
}


extension StockDisplayModel {
    static let items = [
        StockDisplayModel(stockInfoModel: [
            StockInfoModel(name: "두나무", imageName: "temp", price: 85000, change: -5.8),
            StockInfoModel(name: "오톰", imageName: "temp", price: 3410, change: -4.49),
            StockInfoModel(name: "에이피알", imageName: "temp", price: 113000, change: 0.0),
            StockInfoModel(name: "야놀자", imageName: "temp", price: 43600, change: -1.13),
            StockInfoModel(name: "오아시스", imageName: "temp", price: 11100, change: -0.89),
        ])
    ]
}

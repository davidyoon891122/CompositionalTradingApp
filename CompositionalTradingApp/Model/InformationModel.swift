//
//  InformationModel.swift
//  CompositionalTradingApp
//
//  Created by jiwon Yoon on 2023/07/21.
//

import Foundation

struct InformationModel: Hashable {
    let id = UUID()
    let title: String
    let content: String
}

extension InformationModel {
    static let items = [
        InformationModel(title: "신규종목 상장 안내", content: "차주 신규상장 종목 리스트가 업데이트 되었어요.")
    ]
}

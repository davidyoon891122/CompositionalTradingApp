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
        InformationModel(title: "차주 신규상장 종목 리스트가 업데이트 되었어요.", content: "신규 상장 종목에 대한 리스트 ~~~"),
        InformationModel(title: "차주 신규상장 종목 리스트가 업데이트 되었어요.", content: "신규 상장 종목에 대한 리스트 ~~~"),
        InformationModel(title: "차주 신규상장 종목 리스트가 업데이트 되었어요.", content: "신규 상장 종목에 대한 리스트 ~~~"),
        InformationModel(title: "차주 신규상장 종목 리스트가 업데이트 되었어요.", content: "신규 상장 종목에 대한 리스트 ~~~"),
        InformationModel(title: "차주 신규상장 종목 리스트가 업데이트 되었어요.", content: "신규 상장 종목에 대한 리스트 ~~~"),
        InformationModel(title: "차주 신규상장 종목 리스트가 업데이트 되었어요.", content: "신규 상장 종목에 대한 리스트 ~~~")
    ]
}

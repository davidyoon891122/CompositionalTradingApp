//
//  InformationCell.swift
//  CompositionalTradingApp
//
//  Created by jiwon Yoon on 2023/07/21.
//

import UIKit
import SnapKit

final class InformationCell: UICollectionViewCell {
    static let identifier = "InformationCell"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "신규종목 상장 안내"
        label.textColor = .label
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .label
        return button
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 8.0
        
        [
            titleLabel,
            closeButton
        ]
            .forEach {
                view.addSubview($0)
            }
        
        let offset: CGFloat = 16.0
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(offset)
            $0.trailing.equalTo(closeButton.snp.leading).offset(-offset)
            $0.bottom.equalToSuperview()
        }
        
        closeButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalToSuperview().offset(-offset)
            $0.width.height.equalTo(14)
        }
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension InformationCell {
    func setupViews() {
        [
            containerView
        ]
            .forEach {
                contentView.addSubview($0)
            }
        
        containerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(16.0)
            $0.trailing.equalToSuperview().offset(-16.0)
            $0.bottom.equalToSuperview()
        }
    }
}



//
//  LogoInfoCell.swift
//  CompositionalTradingApp
//
//  Created by jiwon Yoon on 2023/07/21.
//

import UIKit
import SnapKit

final class LogoInfoCell: UICollectionViewCell {
    static let identifier = "LogoInfoCell"
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person")
        
        return imageView
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "88,000"
        label.textColor = .label
        
        return label
    }()
    
    private lazy var percentLabel: UILabel = {
        let label = UILabel()
        label.text = "5.00 %"
        label.textColor = .label
        
        return label
    }()
    
    private lazy var labelView: UIView = {
        let view = UIView()
        [
            priceLabel,
            percentLabel
        ]
            .forEach {
                view.addSubview($0)
            }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.trailing.equalTo(percentLabel.snp.leading).offset(-4)
        }
        
        percentLabel.snp.makeConstraints {
            $0.centerY.equalTo(priceLabel)
            $0.trailing.equalToSuperview()
        }
        
        return view
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        [
            imageView,
            labelView
        ]
            .forEach {
                view.addSubview($0)
            }
        
        let offset: CGFloat = 16.0
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(150)
        }
        
        labelView.snp.makeConstraints {
            $0.trailing.equalTo(imageView).offset(-offset)
            $0.bottom.equalTo(imageView).offset(-offset)
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
    
    func setupCell(stockInfoModel: StockInfoModel) {
        imageView.image = UIImage(named: stockInfoModel.imageName)
        priceLabel.text = "\(stockInfoModel.price)"
        percentLabel.text = "\(stockInfoModel.change) %"
    }
}

private extension LogoInfoCell {
    func setupViews() {
        [
            containerView
        ]
            .forEach {
                contentView.addSubview($0)
            }
        
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

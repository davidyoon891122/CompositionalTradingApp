//
//  StockDisplayCell.swift
//  CompositionalTradingApp
//
//  Created by jiwon Yoon on 2023/07/21.
//

import UIKit
import SnapKit

final class StockDisplayCell: UICollectionViewCell {
    static let identifier = "StockDisplayCell"
    private lazy var stockNameLabel: UILabel = {
        let label = UILabel()
        label.text = "두나무,"
        label.textColor = .label
        label.font = .systemFont(ofSize: 22.0)
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "여기서 살수 있어요!"
        label.textColor = .label
        label.font = .systemFont(ofSize: 22.0)
        
        return label
    }()
    
    private lazy var labelView: UIView = {
        let view = UIView()
        
        [
            stockNameLabel,
            descriptionLabel
        ]
            .forEach {
                view.addSubview($0)
            }
        
        let offset: CGFloat = 16.0
        stockNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(offset)
            $0.leading.equalToSuperview().offset(offset)
            $0.trailing.equalToSuperview().offset(-offset)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(stockNameLabel.snp.bottom).offset(offset)
            $0.leading.equalToSuperview().offset(offset)
            $0.trailing.equalToSuperview().offset(-offset)
            $0.bottom.equalToSuperview()
        }
        
        return view
    }()
    
    private lazy var logoCollectionView: UICollectionView = {
        let layout = createLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(LogoInfoCell.self, forCellWithReuseIdentifier: LogoInfoCell.identifier)
        
        return collectionView
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        [
            labelView,
            logoCollectionView,
        ]
            .forEach {
                view.addSubview($0)
            }
        
        labelView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        logoCollectionView.snp.makeConstraints {
            $0.top.equalTo(labelView.snp.bottom).offset(16.0)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        
        return view
    }()
    
    private var datasource: UICollectionViewDiffableDataSource<Int, AnyHashable>!
    
    private var data: [StockInfoModel] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        configureDatasource()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(stockDisplayModel: StockDisplayModel) {
        data = stockDisplayModel.stockInfoModel
        applySnapshot()
    }
}

private extension StockDisplayCell {
    func setupViews() {
        contentView.backgroundColor = .systemBackground
        
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
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, environmentLayout in
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(150.0)), subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            
            section.orthogonalScrollingBehavior = .paging
            
            return section
        })
        
        return layout
    }
    
    func configureDatasource() {
        datasource = UICollectionViewDiffableDataSource(collectionView: logoCollectionView, cellProvider: { collectionView, indexPath, item in
            if let stockInfoModel = item as? StockInfoModel {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LogoInfoCell.identifier, for: indexPath) as? LogoInfoCell else { return UICollectionViewCell() }
                
                cell.setupCell(stockInfoModel: stockInfoModel)
                
                return cell
            } else {
                return UICollectionViewCell()
            }
        })
        
        applySnapshot()
    }
    
    func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, AnyHashable>()
        snapshot.appendSections([0])
        snapshot.appendItems(data)
        
        datasource.apply(snapshot, animatingDifferences: true)
    }
}

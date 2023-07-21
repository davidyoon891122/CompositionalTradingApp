//
//  StockViewController.swift
//  CompositionalTradingApp
//
//  Created by jiwon Yoon on 2023/07/21.
//

import UIKit
import SnapKit

enum StockSectionType {
    case info
    case stockdisplay
}

final class StockViewController: UIViewController {
    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(InformationCell.self, forCellWithReuseIdentifier: InformationCell.identifier)
        
        collectionView.register(StockDisplayCell.self, forCellWithReuseIdentifier: StockDisplayCell.identifier)
        
        return collectionView
    }()
    
    weak var coordinator: MainCoordinator?
    
    private var datasource: UICollectionViewDiffableDataSource<StockSectionType, AnyHashable>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureDatasource()
    }
}

private extension StockViewController {
    func setupViews() {
        view.backgroundColor = .systemBackground
        [
            collectionView
        ]
            .forEach {
                view.addSubview($0)
            }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
            
    }
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, environmentLayout in
            if sectionIndex == 0 {
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50.0)))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50.0)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .paging
                
                return section
            } else {
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(300.0)))
                
                let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(300.0)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                
                return section
            }
        })
        
        return layout
    }
    
    func configureDatasource() {
        datasource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            if indexPath.section == 0 {
                if let infomationModel = item as? InformationModel {
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InformationCell.identifier, for: indexPath) as? InformationCell else { return UICollectionViewCell() }
                    
                    cell.setupCell(informationModel: infomationModel)
                    
                    return cell
                } else {
                    return UICollectionViewCell()
                }
            } else if indexPath.section == 1 {
                if let stockDisplayModel = item as? StockDisplayModel {
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StockDisplayCell.identifier, for: indexPath) as? StockDisplayCell else { return UICollectionViewCell() }
                    
                    cell.setupCell(stockDisplayModel: stockDisplayModel)
                    
                    return cell
                } else {
                    return UICollectionViewCell()
                }
            } else {
                return UICollectionViewCell()
            }
        })
        
        applySnapshot()
    }
    
    func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<StockSectionType, AnyHashable>()
        snapshot.appendSections([.info, .stockdisplay])
        snapshot.appendItems(InformationModel.items, toSection: .info)
        snapshot.appendItems(StockDisplayModel.items, toSection: .stockdisplay)
        
        datasource.apply(snapshot, animatingDifferences: true)
    }
}

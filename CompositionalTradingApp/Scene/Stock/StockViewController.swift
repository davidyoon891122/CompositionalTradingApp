//
//  StockViewController.swift
//  CompositionalTradingApp
//
//  Created by jiwon Yoon on 2023/07/21.
//

import UIKit
import SnapKit

final class StockViewController: UIViewController {
    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(InformationCell.self, forCellWithReuseIdentifier: InformationCell.identifier)
        
        return collectionView
    }()
    
    weak var coordinator: MainCoordinator?
    
    private var datasource: UICollectionViewDiffableDataSource<Int, AnyHashable>!
    
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
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50.0)))
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50.0)), subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .paging
            
            return section
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
            } else {
                return UICollectionViewCell()
            }
        })
        
        applySnapshot()
    }
    
    func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, AnyHashable>()
        snapshot.appendSections([0])
        snapshot.appendItems(InformationModel.items)
        
        datasource.apply(snapshot, animatingDifferences: true)
    }
}

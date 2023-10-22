//
//  ShopCollectionView.swift
//  rockPaperScissors
//
//  Created by Ivan Byndiu on 15/10/2023.
//

import UIKit

class ShopCollectionView: UICollectionView {
    
    private let idShopCell = "idShopCell"
    
    private let shopItem: [ShopModel] = [
        ShopModel(image: UIImage(named: "paperSkin")!),
        ShopModel(image: UIImage(named: "paperSkin1")!),
        ShopModel(image: UIImage(named: "handSccisorsSpecialBackground")!),
        ShopModel(image: UIImage(named: "paperSkin")!),
        ShopModel(image: UIImage(named: "paperSkin1")!),
        ShopModel(image: UIImage(named: "handSccisorsSpecialBackground")!),
        ShopModel(image: UIImage(named: "paperSkin")!),
        ShopModel(image: UIImage(named: "paperSkin1")!),
        ShopModel(image: UIImage(named: "paperSkin")!),
        ShopModel(image: UIImage(named: "paperSkin1")!),
        ShopModel(image: UIImage(named: "handSccisorsSpecialBackground")!),
        ShopModel(image: UIImage(named: "paperSkin")!),
        ShopModel(image: UIImage(named: "paperSkin1")!),
        ShopModel(image: UIImage(named: "handSccisorsSpecialBackground")!),
        ShopModel(image: UIImage(named: "paperSkin")!),
        ShopModel(image: UIImage(named: "paperSkin1")!),
    ]
    
    private let collectionLayout = UICollectionViewFlowLayout()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: collectionLayout)
        
        setupLayout()
        configure()
        setDelegates()
        register(ShopCollectionViewCell.self, forCellWithReuseIdentifier: idShopCell)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        collectionLayout.minimumInteritemSpacing = 10
    }
    
    private func configure() {
        backgroundColor = .none
        layer.cornerRadius = 10
        showsVerticalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setDelegates() {
        dataSource = self
        delegate = self
    }
}

//MARK: - UICollectionViewDataSource

extension ShopCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        shopItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idShopCell, for: indexPath) as? ShopCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let item = shopItem[indexPath.row]
        
        cell.setSkinImage(image: item.image)
        
        return cell
    }
}

//MARK: - UICollectionViewDelegate

extension ShopCollectionView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(shopItem[indexPath.row])
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension ShopCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow = 2
        let spacing = collectionLayout.minimumInteritemSpacing
        let totalSpacing = spacing * CGFloat(itemsPerRow - 1)
        let width = (collectionView.bounds.width - totalSpacing) / CGFloat(itemsPerRow)
        return CGSize(width: width, height: 115)
    }
}

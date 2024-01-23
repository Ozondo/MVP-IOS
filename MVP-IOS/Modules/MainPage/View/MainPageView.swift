//
//  MainPageView.swift
//  MVP-IOS
//
//  Created by Егор Иванов on 11.01.2024.
//

import UIKit

final class MainPageView: UIView {
    //MARK: - private properties
    
    private enum Const {
        static let rightConst: CGFloat = -30
        static let leftConst: CGFloat = 30
    }
    
    private var cities: [MainPageModel] = []
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collection
    }()
    
    var itemTapped: ((Int) -> Void)?
    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        setupCollection()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - setupView
    private func setupView() {
        addSubview(collectionView)
        backgroundColor = .white
    }
    //MARK: - setupCollection
    private func setupCollection() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MainPageCollectionViewCell.self, forCellWithReuseIdentifier: "id")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    //MARK: - layout
    override func layoutSubviews() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Const.leftConst),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Const.rightConst)
        ])
    }
}
    //MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension MainPageView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "id", for: indexPath) as? MainPageCollectionViewCell else { return MainPageCollectionViewCell()  }
        cell.clipsToBounds = true
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 200
        
        let citesForCell = cities[indexPath.item]
        
        cell.updateInfo(citesForCell)
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bounds.width, height: 100)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        itemTapped?(indexPath.item)
    }
    
    
}

extension MainPageView {
    func getCities(cityFromNetwork: [MainPageModel]) {
        self.cities = cityFromNetwork
        collectionView.reloadData()
    }
}

//
//  MainPageCollectionViewCell.swift
//  MVP-IOS
//
//  Created by Егор Иванов on 11.01.2024.
//

import UIKit

final class MainPageCollectionViewCell: UICollectionViewCell {
    
    //MARK: - private properties
    private var id: Int = 0
    
    private var cityID: Int = 0
    
    private let cityName: UILabel = {
        let label = UILabel()
        return label
    }()
    
    //MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(cityName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        cityName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cityName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            cityName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}

extension MainPageCollectionViewCell {
    func updateInfo(_ model: MainPageModel) {
        id = model.id
        cityName.text = model.name
        cityID = model.stateId
    }
}

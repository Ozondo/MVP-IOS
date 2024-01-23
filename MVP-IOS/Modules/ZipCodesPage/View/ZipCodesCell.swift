//
//  ZipCodesCell.swift
//  MVP-IOS
//
//  Created by Егор Иванов on 17.01.2024.
//

import UIKit

final class ZipCodesCell: UICollectionViewCell {
    
    //MARK: - private properties
    private let zipCode: UILabel = {
        let label = UILabel()
        return label
    }()
    
    //MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(zipCode)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        zipCode.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            zipCode.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            zipCode.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}

extension ZipCodesCell {
    func updateInfo(_ model: ZipCodesModel) {
        zipCode.text = model.postNumber
    }
}

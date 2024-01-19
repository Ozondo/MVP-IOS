//
//  ZipCodesBuilder.swift
//  MVP-IOS
//
//  Created by Егор Иванов on 11.01.2024.
//

import UIKit


struct ZipCodesBuilder {
    func build(cityName: String) -> UIViewController {
        
        let presenter = ZipCodesPresenter(city: cityName, service: ZipCodeServiceImpl())
        let view = ZipCodesPageViewController(presenter: presenter, city: cityName)
        
        presenter.view = view
        
        return view
    }
}

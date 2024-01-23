//
//  MainPageRouter.swift
//  MVP-IOS
//
//  Created by Егор Иванов on 17.01.2024.
//

import Foundation
import UIKit

protocol MainPageRouter {
    func openZipCodesScene(cityName: String)
}

final class MainPageRouterImpl: MainPageRouter {
    
    weak var sceneController: UIViewController?
    
    func openZipCodesScene(cityName: String) {
        let zipCodesVC = ZipCodesBuilder().build(cityName: cityName)
        sceneController?.navigationController?.pushViewController(zipCodesVC, animated: true)
    }
    
    
}

//
//  MainPageBuilder.swift
//  MVP-IOS
//
//  Created by Егор Иванов on 11.01.2024.
//

import UIKit


struct MainPageBuilder {
    func build() -> UIViewController {
        let router = MainPageRouterImpl()
        let presenter = MainPagePresenter(service: ModelMainPageServiceImpl(), router: router)
        let view = MainPageViewController(presenter: presenter)
        
        
        
        presenter.view = view
        
        router.sceneController = view
        
        return view 
    }
}

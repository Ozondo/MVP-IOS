//
//  MainPagePresenter.swift
//  MVP-IOS
//
//  Created by Егор Иванов on 11.01.2024.
//

import Foundation

final class MainPagePresenter: MainPageViewOutput {
    
    weak var view: MainPageViewInput?
    private let service: MainPageService
    private let router: MainPageRouter
    private var response: MainPageResponse?
    
    init(service: MainPageService, router: MainPageRouter) {
        self.service = service
        self.router = router
    }
    func viewDidLoad() {
        view?.title = "IOS MVP"
        
        
        service.loadCities(completion: { [weak self] result in
            switch result {
            case .success(let success):
                self?.response = success
                DispatchQueue.main.async {
                    self?.view?.displayCities(items: success.cities)
                }
            case .failure(_):
                print("error")
            }
        })
    }
    func itemTapped(item: Int) {
        guard let response, response.cities.count > item else { return }
        
        let cityName = response.cities[item].name
        
        router.openZipCodesScene(cityName: cityName)
    }
    
    
}

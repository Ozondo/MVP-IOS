//
//  ZipCodesPresenter.swift
//  MVP-IOS
//
//  Created by Егор Иванов on 17.01.2024.
//
import Foundation

final class ZipCodesPresenter: ZipCodesViewOutput {
    
    private let city: String
    
    weak var view: ZipCodesViewInput?

    private let service: ZipCodesService
    
    private var response:  ZipCodesResponse?
    
    init(city: String, service: ZipCodesService) {
        self.city = city
        self.service = service
    }
    
    func viewDidLoad() {
        view?.title = "ios mvp"
        
        service.loadZips(cityName: city, completion: { [weak self] result in
            switch result {
            case .success(let success):
                self?.response = success
                DispatchQueue.main.async {
                    self?.view?.displayZipCodes(items: success.zipcodes)
                    print("success")
                }
            case .failure(_):
                print("error")
            }
        })
    }
    
}


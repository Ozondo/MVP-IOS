//
//  ZipCodesPageViewController.swift
//  MVP-IOS
//
//  Created by Егор Иванов on 13.01.2024.
//

import UIKit

final class ZipCodesPageViewController: UIViewController, ZipCodesViewInput {

    private let zipCodesView = ZipCodesView()
    
    let city: String
    
    private let presenter: ZipCodesViewOutput 
    
    init(presenter: ZipCodesViewOutput, city: String) {
        self.presenter = presenter
        self.city = city
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = zipCodesView
    }
    func displayZipCodes(items: [ZipCodesModel]) {
        zipCodesView.updateZipCodes(cityFromNetwork: items)
    }
}

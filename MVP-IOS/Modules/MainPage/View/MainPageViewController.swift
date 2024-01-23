//
//  MainPageViewController.swift
//  MVP-IOS
//
//  Created by Егор Иванов on 11.01.2024.
//

import UIKit

final class MainPageViewController: UIViewController, MainPageViewInput{
    
    private let presenter: MainPageViewOutput
    private let mainPageView = MainPageView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        didCellTapped()
    }
    //MARK: - init
    init(presenter: MainPageViewOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    //MARK: - loadView
    override func loadView() {
        view = mainPageView
    }
    
    func displayCities(items: [MainPageModel]) {
        mainPageView.getCities(cityFromNetwork: items)    }
    
    func didCellTapped() {
        mainPageView.itemTapped = { [weak self] index in
            self?.presenter.itemTapped(item: index)
        }
    }
    
}


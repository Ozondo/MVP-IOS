//
//  MainPageIO.swift
//  MVP-IOS
//
//  Created by Егор Иванов on 11.01.2024.
//

import Foundation

// Связь view с presenter
protocol MainPageViewInput: AnyObject {
    var title: String? {get set}
    
    func displayCities(items: [MainPageModel])
}

// Связь presenter с view
protocol MainPageViewOutput {
    func viewDidLoad()
    
    func itemTapped(item: Int)
}

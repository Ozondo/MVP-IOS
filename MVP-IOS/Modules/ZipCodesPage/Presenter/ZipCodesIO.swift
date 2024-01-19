//
//  ZipCodesIO.swift
//  MVP-IOS
//
//  Created by Егор Иванов on 17.01.2024.
//
import Foundation

// Связь presenter с view
protocol ZipCodesViewInput: AnyObject {
    var title: String? {get set}
    
    func displayZipCodes(items: [ZipCodesModel])
}

// Связь view с presenter
protocol ZipCodesViewOutput {
    func viewDidLoad()
    
}

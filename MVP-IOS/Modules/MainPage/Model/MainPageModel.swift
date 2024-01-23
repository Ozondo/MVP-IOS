//
//  MainPageModel.swift
//  MVP-IOS
//
//  Created by Егор Иванов on 12.01.2024.
//

import UIKit

//MARK: - model 
struct MainPageModel: Decodable {
    var id: Int
    var name: String
    var stateId: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case stateId = "state_id"
    }
}

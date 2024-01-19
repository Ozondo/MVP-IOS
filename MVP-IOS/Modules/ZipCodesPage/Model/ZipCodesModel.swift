//
//  ZipCodesModel.swift
//  MVP-IOS
//
//  Created by Егор Иванов on 17.01.2024.
//

import Foundation

struct ZipCodesModel: Decodable {
    let postNumber: String
    
    
    enum CodingKeys: String, CodingKey {
        case postNumber = "id_asenta_cpcons"
    }
}

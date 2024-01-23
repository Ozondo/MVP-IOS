//
//  ZipCodesResponse.swift
//  MVP-IOS
//
//  Created by Егор Иванов on 17.01.2024.
//

import Foundation

struct ZipCodesResponse: Decodable {
    let zipcodes:[ZipCodesModel]
    
    enum CodingKeys: String, CodingKey {
        case zipcodes = "zip_codes"
    }
}


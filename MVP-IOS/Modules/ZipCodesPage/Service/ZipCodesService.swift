//
//  ZipCodesService.swift
//  MVP-IOS
//
//  Created by Егор Иванов on 17.01.2024.
//

import Foundation
import Moya


//MARK: - service
protocol ZipCodesService {
    func loadZips(cityName: String,completion: @escaping (Result<ZipCodesResponse,Error>) -> ())
}

enum ZipCodeTarget {
    case getZipCode(city: String)
}
extension ZipCodeTarget: TargetType {
    var baseURL: URL {
        return URL(string: "https://sepomex.icalialabs.com")!
    }
    
    var path: String {
        switch self {
        case .getZipCode(let city):
            return "/api/v1/zip_codes"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getZipCode:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getZipCode(let city):
            return .requestParameters(parameters: ["city": city], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}

//MARK: - impl

final class ZipCodeServiceImpl: ZipCodesService {
    func loadZips(cityName: String, completion: @escaping (Result<ZipCodesResponse, Error>) -> ()) {
        let provider = MoyaProvider<ZipCodeTarget>()
        
        provider.request(.getZipCode(city: cityName), completion: { result in
            switch result {
            case .success(let result):
                let data = result.data
                do {
                    let resultModel = try JSONDecoder().decode(ZipCodesResponse.self, from: data)
                    completion(.success(resultModel))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}





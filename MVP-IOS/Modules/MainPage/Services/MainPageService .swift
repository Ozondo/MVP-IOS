//
//  MainPageService .swift
//  MVP-IOS
//
//  Created by Егор Иванов on 12.01.2024.
//

import UIKit
import Moya

//MARK: - service
protocol MainPageService {
    func loadCities(completion: @escaping (Result<MainPageResponse,Error>) -> ())
}
//MARK: - impl
enum MainPageTarget {
    case getCities
}
extension MainPageTarget: TargetType {
    var baseURL: URL {
        return URL(string: "https://sepomex.icalialabs.com/")!
    }
    
    var path: String {
        return "/api/v1/cities"
    }
    
    var method: Moya.Method {
        switch self {
        case .getCities:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getCities:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
final class ModelMainPageServiceImpl: MainPageService {
    
    let provider = MoyaProvider<MainPageTarget>()
    
    func loadCities(completion: @escaping (Result<MainPageResponse, Error>) -> ()) {
        provider.request(.getCities, completion: { result in
            switch result {
            case .success(let result):
                let data = result.data
                do {
                    let resultModel = try JSONDecoder().decode(MainPageResponse.self, from: data)
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

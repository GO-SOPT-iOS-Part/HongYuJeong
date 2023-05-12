//
//  WeatherService.swift
//  Seminar_3
//
//  Created by 홍유정 on 2023/05/06.
//

import Foundation
import Alamofire

final class  WeatherService {
    
    static let shared = WeatherService()
    
    private init() {}
    
    func getWeather(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let url = Config.baseURL
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        
        let dataRequest = AF.request(url,
                                     method: .get,
                                     headers: header)
        
        dataRequest.responseData { response in
            
            switch response.result {
            case .success:
                print("success")
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
                
            case .failure:
                print("fail")
                completion(.networkErr)
            }
        }
    }
    
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        print(statusCode)
        switch statusCode {
        case 200,201: return isValidData(data: data)
        case 400, 409: return isValidData(data: data)
        case 500: return .serverErr
        default: return .networkErr
        }
    }
    
    private func isValidData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(WeatherResponse.self, from: data) else {
            print("해독실패")
            return .pathErr }
        
        return .success(decodedData as Any)
    }
    
    
}

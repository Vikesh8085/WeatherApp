//
//  NetworkManager.swift
//  Weather App
//
//  Created by macbook on 14/01/22.
//

import Foundation

final class NetworkManager {
    
    func callAPI<T: Decodable>(query: String, resultType: T.Type, success:@escaping ((T?) -> Void), failure:@escaping ((CustomError) -> Void)) {
        guard let link = getUrl(query: query) else {return}
            
         URLSession.shared.dataTask(with: link) { (data, response, error) in
            if let statusCode = (response as? HTTPURLResponse)?.statusCode,
                let httpStatusCode = HTTPStatusCodes(rawValue: statusCode) {
                switch httpStatusCode {
                case HTTPStatusCodes.success:
                    
                    if let data = data {
                        
                        do {
                            let obj = try JSONDecoder().decode(T.self, from: data)
                            success(obj)
                        } catch {
                            failure(CustomError(statusCode: 000, errorTitle: "000", errorDescription: "Parsing Error"))
                        }
                    } else {
                        failure(CustomError(statusCode: 001, errorTitle: "001", errorDescription: "Data Not Received Error"))
                    }
                    
                case HTTPStatusCodes.tooManyRequests:
                    failure(CustomError(statusCode: HTTPStatusCodes.tooManyRequests.rawValue, errorTitle: "429", errorDescription: "Too many requests"))
                case HTTPStatusCodes.notFound:
                    failure(CustomError(statusCode: HTTPStatusCodes.notFound.rawValue, errorTitle: "404", errorDescription: "Not Found"))
                case HTTPStatusCodes.cityNotFound:
                    failure(CustomError(statusCode: HTTPStatusCodes.notFound.rawValue, errorTitle: "404", errorDescription: "City Not Found"))
                case HTTPStatusCodes.unAvailable:
                    failure(CustomError(statusCode: HTTPStatusCodes.unAvailable.rawValue, errorTitle: "503", errorDescription: "Un Available"))
                default:
                    failure(CustomError(statusCode: HTTPStatusCodes.unAvailable.rawValue, errorTitle: "503", errorDescription: "Un Available"))
                }
              
            }
        }.resume()
    }
    
    fileprivate func getUrl(query: String) -> URL? {
        
        let stringUrl = "\(APIManagerConstant.baseUrl)/data/2.5/forecast?q=\(query)&appid=\(APIManagerConstant.key)"
        guard let url = URL(string:stringUrl) else {
            return nil
        }
        return url
    }
    
}

struct CustomError: Error {
    let statusCode: Int?
    let errorTitle: String?
    let errorDescription: String?
}

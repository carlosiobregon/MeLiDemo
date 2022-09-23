//
//  ProxyRest.swift
//  MeliDemo
//
//  Created by Carlos Obregon on 22/09/22.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
}

struct NilBody: Encodable {}

class ProxyRest<T: Decodable> {
    
    static func makeRequest <U: Encodable>(
        url: URL?,
        methodType: HTTPMethod,
        body: U? = nil,
        completion: @escaping (Result<T, ApiError>) -> Void)
    {
        
        guard let resourceURL = url else { return }
        var request = URLRequest(url: resourceURL)
        
        request.httpMethod = methodType.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept") 
        
        if methodType != .get,
           let it = body {
            request.httpBody = try? JSONEncoder().encode(it)
        }
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = 30
        configuration.waitsForConnectivity = true
        
        let session = URLSession(configuration: configuration)
        
        let dataTask = session.dataTask(with: request){ data, response, error  in
            guard let jsonData = data else {
                DispatchQueue.main.async {
                    completion(.failure(.noDataAvailable))
                }
                return
            }
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(T.self, from: jsonData)
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(.canNoProcessData))
                }
            }
        }
        dataTask.resume()
    }

}

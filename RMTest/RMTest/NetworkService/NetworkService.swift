//
//  NetworkService.swift
//  RMTest
//
//  Created by Anatoliy on 11.04.2022.
//

import Foundation

enum NetworkErrors: Error {
    case wrongURL
    case dataIsEmpty
    case decodeIsFail
    case noConnection
}

final class NetworkService {
    
    func baseRequest<T: Decodable>(url: String, completion: @escaping (Result<T, Error>) -> Void) {
        
        guard let url = URL(string: url) else {
            completion(.failure(NetworkErrors.wrongURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            //print(url)
            
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(NetworkErrors.dataIsEmpty))
                }
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let decodedModel = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decodedModel))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(NetworkErrors.decodeIsFail))
                }
            }
        }.resume()
    }
}


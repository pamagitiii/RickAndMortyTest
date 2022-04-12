//
//  URLFactory.swift
//  RMTest
//
//  Created by Anatoliy on 12.04.2022.
//

import Foundation

enum URLFactory {
    private static var baseURL: URL {
        return baseURLComponents.url!
    }
    private static let baseURLComponents: URLComponents = {
        let url = URL(string: API.main)!
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        urlComponents.queryItems = []
        return urlComponents
    }()
    
    static func getCharacter(params: CharacterURLParameters) -> String {
        var urlComponents = baseURLComponents
        let paramsQueryItem = [
            URLQueryItem(name: "page", value: params.page ?? "")
        ]
        urlComponents.queryItems?.append(contentsOf: paramsQueryItem)
        return urlComponents.url!.appendingPathComponent(API.TypeOf.characters).absoluteString
    }
}

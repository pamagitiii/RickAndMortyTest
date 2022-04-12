//
//  NetworkService+Characters.swift
//  RMTest
//
//  Created by Anatoliy on 12.04.2022.
//

import Foundation

extension NetworkService: NetworkServiceProtocol {
    func fetchCharacters(with params: CharacterURLParameters, and completion: @escaping (Result<Response<Character>, Error>) -> Void) {
        let url = URLFactory.getCharacter(params: params)
        self.baseRequest(url: url, completion: completion)
    }
}

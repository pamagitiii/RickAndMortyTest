//
//  NetworkServiceProtocol.swift
//  RMTest
//
//  Created by Anatoliy on 12.04.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchCharacters(with params: CharacterURLParameters, and completion: @escaping (Result<Response<Character>, Error>) -> Void)
}

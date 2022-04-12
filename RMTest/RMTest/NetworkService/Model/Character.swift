//
//  Character.swift
//  RMTest
//
//  Created by Anatoliy on 11.04.2022.
//

import Foundation

struct Character: Decodable {
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin: Origin
    let imageURL: String
    
    var statusEnum: Status {
        get {
            switch status {
            case "Alive":
                return .alive
            case "unknown":
                return .unknown
            case "Dead":
                return .dead
            default:
                return .unknown
            }
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case name, status, species, gender, origin
        case imageURL = "image"
    }
}

struct Origin: Decodable {
    let name: String
}
    //MARK: - CharacterURLParameters
struct CharacterURLParameters: Decodable {
    var page: String?
    
    init(page: String) {
        self.page = page
    }
}


//
//  Info.swift
//  RMTest
//
//  Created by Anatoliy on 12.04.2022.
//

import Foundation

struct Info: Decodable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

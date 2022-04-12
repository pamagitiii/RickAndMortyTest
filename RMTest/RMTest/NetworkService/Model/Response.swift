//
//  Response.swift
//  RMTest
//
//  Created by Anatoliy on 12.04.2022.
//

import Foundation

struct Response<T: Decodable>: Decodable {
    let info: Info
    let results: [T]
}

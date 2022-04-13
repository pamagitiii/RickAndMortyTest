//
//  MainProtocols.swift
//  RMTest
//
//  Created by Anatoliy on 11.04.2022.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func didLoadData()
    func showAlert(title: String, message : String)
}

protocol MainPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol)
    var characters: [Character] { get }
    func viewDidLoad()
    func willDisplay(at index: Int)
}

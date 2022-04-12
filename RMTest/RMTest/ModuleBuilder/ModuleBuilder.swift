//
//  ModuleBuilder.swift
//  RMTest
//
//  Created by Anatoliy on 11.04.2022.
//

import UIKit

protocol ModuleBuilderProtocol {
    func createMainModule() -> UIViewController
}

class ModuleBuilder: ModuleBuilderProtocol {
    
    let networkService = NetworkService()

    func createMainModule() -> UIViewController {
        let view = MainViewController()
        let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
}


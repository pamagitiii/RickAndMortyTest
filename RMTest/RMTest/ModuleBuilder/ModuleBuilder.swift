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
    
    //let networkManager = NetworkManager()

    func createMainModule() -> UIViewController {
        let view = MainViewController()
        let presenter = MainPresenter(view: view)
        view.presenter = presenter
        return view
    }
}


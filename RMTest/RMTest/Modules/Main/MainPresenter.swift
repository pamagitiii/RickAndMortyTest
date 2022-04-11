//
//  MainPresenter.swift
//  RMTest
//
//  Created by Anatoliy on 11.04.2022.
//

import Foundation

class MainPresenter {
    //MARK: - properties
    weak var view: MainViewProtocol?
   // private let networkManager: CoctailsNetworkProtocol!

    //MARK: - init
    required init(view: MainViewProtocol) {
        self.view = view
    }
}

extension MainPresenter: MainPresenterProtocol {

}


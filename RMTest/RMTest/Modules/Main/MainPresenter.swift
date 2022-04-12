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
    private let networkService: NetworkServiceProtocol
    
    var characters: [Character] = []
    private var isReloading = false
    private var page: Int = GlobalConstants.initialPage
    private var maxPage = 1
    private var params: CharacterURLParameters


    //MARK: - init
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        self.params = CharacterURLParameters(page: String(self.page))
    }
}

extension MainPresenter: MainPresenterProtocol {
    func willDisplay(at index: Int) {
        guard index >= 19, !(page >= maxPage) else { return }
        load()
        
        
    }
    
    func viewDidLoad() {
        page = GlobalConstants.initialPage
        params = CharacterURLParameters(page: String(self.page))
        
        load()
        
//        networkService.fetchCharacters(with: params) { [weak self] result in
//            guard let self = self else { return }
//
//            switch result {
//            case .success(let response):
//                self.characters = response.results
//                self.page += 1
//                self.params.page = String(self.page)
//                self.maxPage = response.info.pages
//                self.view?.didLoadData()
//            case .failure(let error):
//                print(error.localizedDescription)
//                //обработать ошибку
//            }
//        }
        
    }
    
    private func load() {
        networkService.fetchCharacters(with: params) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                self.characters = response.results
                self.page += 1
                self.params.page = String(self.page)
                self.maxPage = response.info.pages
                self.view?.didLoadData()
            case .failure(let error):
                print(error.localizedDescription)
                //обработать ошибку
            }
        }
    }

}


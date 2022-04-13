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
    private var isNextPageLoading = false
    private var page: Int = 1
    private var maxPage = 1
    private var params: CharacterURLParameters
    
    
    //MARK: - init
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        self.params = CharacterURLParameters(page: String(self.page))
    }
}

//MARK: - presenter protocol
extension MainPresenter: MainPresenterProtocol {
    func willDisplay(at index: Int) {
        guard index >= 19,
              index == (characters.count - 1),
              !(page > maxPage),
              !isReloading,
              !isNextPageLoading else {
                  return
              }
        isNextPageLoading = true
        networkService.fetchCharacters(with: params) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.characters += response.results
                self.page += 1
                self.params.page = String(self.page)
                self.maxPage = response.info.pages
                self.view?.didLoadData()
                self.isNextPageLoading = false
            case .failure(let error):
                self.view?.showAlert(title: "Can't load data", message: error.localizedDescription)
            }
        }
    }
    
    func viewDidLoad() {
        page = 1
        params = CharacterURLParameters(page: String(self.page))
        isNextPageLoading = true
        networkService.fetchCharacters(with: params) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.characters = response.results
                self.page += 1
                self.params.page = String(self.page)
                self.maxPage = response.info.pages
                self.view?.didLoadData()
                self.isNextPageLoading = false
            case .failure(let error):
                self.view?.showAlert(title: "Can't load data", message: error.localizedDescription)
            }
        }
    }
}


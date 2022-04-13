//
//  MainViewController.swift
//  RMTest
//
//  Created by Anatoliy on 11.04.2022.
//

import UIKit

final class MainViewController: UIViewController {
    
    //MARK: - properties
    var presenter: MainPresenter!
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupCollectionVeiw()
        presenter.viewDidLoad()
    }
    
    //MARK: - methods
    private func setupUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Characters"
        view.addSubviews([collectionView])
        
        NSLayoutConstraint.activate([collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                                     collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                                     collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
    
    private func setupCollectionVeiw() {
        collectionView.register(CharacterCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        //collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 17, left: 24, bottom: 0, right: 24)
    }
}

//MARK: - CollectionView DataSource
extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(cellType: CharacterCell.self, for: indexPath)
        let character = presenter.characters[indexPath.item]
        cell.setup(with: character)
        return cell
    }
}

//MARK: - CollectionView FlowLayout
extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - collectionView.contentInset.left - collectionView.contentInset.right
        let height = CGFloat(120)
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(32)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        presenter.willDisplay(at: indexPath.item)
    }
}

//MARK: - view protocol
extension MainViewController: MainViewProtocol {

    func didLoadData() {
        collectionView.reloadData()
    }
    
    func showAlert(title: String, message: String) {
       presentAlert(withTitle: title, message: message)
    }
}

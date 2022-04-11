//
//  MainProtocols.swift
//  RMTest
//
//  Created by Anatoliy on 11.04.2022.
//

import Foundation

protocol MainViewProtocol: AnyObject {

}

protocol MainPresenterProtocol: AnyObject {
    init(view: MainViewProtocol)
}

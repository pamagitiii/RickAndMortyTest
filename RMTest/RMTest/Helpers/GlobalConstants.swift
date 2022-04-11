//
//  GlobalConstants.swift
//  RMTest
//
//  Created by Anatoliy on 11.04.2022.
//

import UIKit

struct GlobalConstants {
    static let initialPage = 1
}

struct CharacterConstants {
    struct Layout {
        static let heightCardDescription: CGFloat = 79
        static let itemsInRow: CGFloat = 2
        
        static let spacing: CGFloat = 9
        static let spacingLeft: CGFloat = 9
        static let spacingTop: CGFloat = 9
        static let spacingBottom: CGFloat = 20
        static let spacingRight: CGFloat = 23
        static let minimumInteritemSpacingForSectionAt: CGFloat = 17
        
        static let cornerRadius: CGFloat = 8
        
        static let shadowRadius: CGFloat = 6
        static let shadowOpacity: Float = 0.4
        static let shadowOffsetWidth: CGFloat = 0
        static let shadowOffsetHeight: CGFloat = 5
    }
    
    struct Design {
        static var shadowColor = UIColor.black
    }
    
    struct Strings {
        static let emptyMessageDidError = "Не найдено персонажей или подключитесь к сети, чтобы загрузить данные"
        static let emptyMessage = "Не найдено персонажей"
        static let searchBarPlaceholder = "Найти персонажа"
        static let UISearchBarTitle = "Отменить"
    }
}

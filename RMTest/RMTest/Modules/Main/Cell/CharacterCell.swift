//
//  CharacterCell.swift
//  RMTest
//
//  Created by Anatoliy on 11.04.2022.
//

import UIKit

class CharacterCell: UICollectionViewCell {
    
    //let cornerRadius : CGFloat = 25.0
    
    let imageContainerView: DropShadowView = {
        let view = DropShadowView()
        view.layer.cornerRadius = 40
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 10)
        view.layer.shadowRadius = 20.0
        view.layer.shadowOpacity = 1
        return view
    }()
    
    
    let characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 40
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "figure.walk.diamond.fill")?.withTintColor(.orange, renderingMode: .alwaysOriginal)
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        
        sutupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func sutupUI() {
        contentView.addSubviews([imageContainerView])
        
        NSLayoutConstraint.activate([imageContainerView.heightAnchor.constraint(equalToConstant: 120),
                                     imageContainerView.widthAnchor.constraint(equalToConstant: 120),
                                     imageContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                                     imageContainerView.topAnchor.constraint(equalTo: contentView.topAnchor)])
        
        imageContainerView.addSubviews([characterImageView])
        NSLayoutConstraint.activate([characterImageView.bottomAnchor.constraint(equalTo: imageContainerView.bottomAnchor),
                                     characterImageView.trailingAnchor.constraint(equalTo: imageContainerView.trailingAnchor),
                                     characterImageView.leadingAnchor.constraint(equalTo: imageContainerView.leadingAnchor),
                                     characterImageView.topAnchor.constraint(equalTo: imageContainerView.topAnchor)])
        
    }
}

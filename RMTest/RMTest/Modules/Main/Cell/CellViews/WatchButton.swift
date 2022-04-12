//
//  WatchButton.swift
//  RMTest
//
//  Created by Anatoliy on 12.04.2022.
//

import UIKit

class WatchButton: UIControl {
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Watch episodes"
        label.textColor = UIColor(red: 1, green: 0.42, blue: 0, alpha: 1)
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .center
        return label
    }()
    
    let playImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        let playImge = UIImage(systemName: "play.fill")?.withTintColor(UIColor(red: 1, green: 0.42, blue: 0, alpha: 1), renderingMode: .alwaysOriginal)
        imageView.image = playImge
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = UIColor(red: 1, green: 0.42, blue: 0, alpha: 0.1)
        
        addSubviews([label, playImageView])
        
        NSLayoutConstraint.activate([playImageView.widthAnchor.constraint(equalToConstant: 10),
                                     playImageView.heightAnchor.constraint(equalToConstant: 12),
            //playImageView.topAnchor.constraint(equalTo: topAnchor, constant: 13),
                                     //playImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
                                     //playImageView.trailingAnchor.constraint(equalTo: imageContainerView.trailingAnchor),
                                     playImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
                                     playImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12)])
        
        NSLayoutConstraint.activate([//label.topAnchor.constraint(equalTo: topAnchor, constant: 9),
                                     //label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -9),
                                     label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
                                     label.centerYAnchor.constraint(equalTo: centerYAnchor)])
                                     //nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor , constant: 12)
    }
}


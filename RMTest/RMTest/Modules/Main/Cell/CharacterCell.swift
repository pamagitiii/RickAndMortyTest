//
//  CharacterCell.swift
//  RMTest
//
//  Created by Anatoliy on 11.04.2022.
//

import UIKit
import Kingfisher

class CharacterCell: UICollectionViewCell {
    
    let statusView = StatusView()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Rick Sanchez"
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.font = .systemFont(ofSize: 21, weight: .medium)
        label.textAlignment = .left
        
        return label
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Human, male"
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .left
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Earth (C-500A)"
        label.textColor = UIColor(red: 0.321, green: 0.321, blue: 0.321, alpha: 1)
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .left
        return label
    }()
    
    let imageContainerView: DropShadowView = {
        let view = DropShadowView()
        view.layer.cornerRadius = 40
        view.layer.shadowColor = UIColor.systemGray3.cgColor//UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
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
    
    let placemarkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "placemark")
        return imageView
    }()
    
    let watchButton: WatchButton = {
        let button = WatchButton()
        button.layer.cornerRadius = 17
        button.layer.masksToBounds = false
        return button
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
        contentView.addSubviews([imageContainerView,nameLabel ,infoLabel, statusView, placemarkImageView, locationLabel, watchButton])
        
        nameLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        statusView.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
        //контейнер с тенью
        NSLayoutConstraint.activate([imageContainerView.heightAnchor.constraint(equalToConstant: 120),
                                     imageContainerView.widthAnchor.constraint(equalToConstant: 120),
                                     imageContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                                     //imageContainerView.topAnchor.constraint(equalTo: contentView.topAnchor),
                                     imageContainerView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)])
        
        //картинка персонажа
        imageContainerView.addSubviews([characterImageView])
        NSLayoutConstraint.activate([characterImageView.bottomAnchor.constraint(equalTo: imageContainerView.bottomAnchor),
                                     characterImageView.trailingAnchor.constraint(equalTo: imageContainerView.trailingAnchor),
                                     characterImageView.leadingAnchor.constraint(equalTo: imageContainerView.leadingAnchor),
                                     characterImageView.topAnchor.constraint(equalTo: imageContainerView.topAnchor)])
        
        //табличка статуса
        NSLayoutConstraint.activate([statusView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                                     statusView.topAnchor.constraint(equalTo: contentView.topAnchor)])
        
        //инфо
        NSLayoutConstraint.activate([infoLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -74),
                                     infoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 138),
                                     infoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 29)])
        
        //значок локации
        NSLayoutConstraint.activate([placemarkImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
                                     placemarkImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 138),
                                     placemarkImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 105)])
        
        //имя персонажа
        NSLayoutConstraint.activate([nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: statusView.leadingAnchor),
                                     nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 138),
                                     nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor)])

        //название локации
        NSLayoutConstraint.activate([locationLabel.centerYAnchor.constraint(equalTo: placemarkImageView.centerYAnchor),
                                     locationLabel.leadingAnchor.constraint(equalTo: placemarkImageView.trailingAnchor, constant: 7.8)])
        
        //кнопка просмотра
        NSLayoutConstraint.activate([watchButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -27),
                                     watchButton.widthAnchor.constraint(equalToConstant: 148),
                                     watchButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 138),
                                     watchButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 58)])
        

    }
    
    func setup(with character: Character) {
        nameLabel.text = character.name
        infoLabel.text = "\(character.species), \(character.gender.lowercased())"
        locationLabel.text = character.origin.name
        
        statusView.setup(with: character.statusEnum)
        
        characterImageView.kf.indicatorType = .activity
        let placeholder = UIImage(systemName: "person.fill")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
        //если персонаж мёртв, задаём черно-белый фильр для картинки через кингфишер
        let processor: ImageProcessor = character.statusEnum == .dead ? BlackWhiteProcessor() : DefaultImageProcessor.default
        characterImageView.kf.setImage(with: URL(string: character.imageURL),
                                       placeholder: placeholder,
                                       options: [.processor(processor)],
                                       progressBlock: nil) { result in
        }
    }
}

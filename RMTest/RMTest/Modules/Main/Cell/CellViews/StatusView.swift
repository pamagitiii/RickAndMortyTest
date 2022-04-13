//
//  StatusView.swift
//  RMTest
//
//  Created by Anatoliy on 12.04.2022.
//

import UIKit

enum Status {
    case alive, dead, unknown
}

class StatusView: UIView {
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - methods
    private func setupUI() {
        layer.masksToBounds = false
        layer.cornerRadius = 13
        
        addSubviews([statusLabel])
        NSLayoutConstraint.activate([statusLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
                                     statusLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4),
                                     statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
                                     statusLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8)])
    }
    
    func setup(with status: Status) {
        switch status {
        case .alive:
            statusLabel.text = "ALIVE"
            statusLabel.textColor = UIColor(red: 0.194, green: 0.625, blue: 0.086, alpha: 1)
            backgroundColor = UIColor(red: 0.78, green: 1, blue: 0.725, alpha: 1)
        case .dead:
            statusLabel.text = "DEAD"
            statusLabel.textColor = UIColor(red: 0.913, green: 0.219, blue: 0, alpha: 1)
            backgroundColor = UIColor(red: 1, green: 0.908, blue: 0.879, alpha: 1)
        case .unknown:
            statusLabel.text = "UNKOWN"
            statusLabel.textColor = UIColor(red: 0.629, green: 0.629, blue: 0.629, alpha: 1)
            backgroundColor = UIColor(red: 0.933, green: 0.933, blue: 0.933, alpha: 1)
        }
    }
}

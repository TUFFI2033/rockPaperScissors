//
//  ChooseRoundView.swift
//  rockPaperScissors
//
//  Created by Ivan Byndiu on 24/10/2023.
//

import UIKit

class ChooseRoundView: UIImageView {
    
    private let backgroundAlphaView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .specialYellow
        label.font = .robotoBold36()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(image: UIImage?, text: String, tapGesture: UITapGestureRecognizer) {
        self.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.image = image
        label.text = text
        addGestureRecognizer(tapGesture)
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        isUserInteractionEnabled = true
        layer.masksToBounds = true
        layer.cornerRadius = 20
        addSubview(backgroundAlphaView)
        addSubview(label)
    }
}

//MARK: - Set Constraints

extension ChooseRoundView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundAlphaView.topAnchor.constraint(equalTo: topAnchor),
            backgroundAlphaView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundAlphaView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundAlphaView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            
        ])
    }
}

//
//  Hand.swift
//  rockPaperScissors
//
//  Created by Ivan Byndiu on 07/10/2023.
//

import UIKit

class Hand: UIView {
    
    private let handImage = UIImageView()
    
    private let whiteView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(background: UIColor){
        self.init()
        
        backgroundColor = background
    }
    
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        
        handImage.translatesAutoresizingMaskIntoConstraints = false
        handImage.image = UIImage(named: "rockHandSpecialBackground")
        
        whiteView.translatesAutoresizingMaskIntoConstraints = false
        whiteView.backgroundColor = .white
        
        addSubview(handImage)
        addSubview(whiteView)
    }
    
    func setNewImageHand(imageNamed: String) {
        handImage.image = UIImage(named: imageNamed)
    }
}

//MARK: - SetConstraints

extension Hand {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            handImage.widthAnchor.constraint(equalToConstant: 90),
            handImage.heightAnchor.constraint(equalToConstant: 90),
            handImage.bottomAnchor.constraint(equalTo: whiteView.topAnchor),
            handImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            whiteView.bottomAnchor.constraint(equalTo: topAnchor),
            whiteView.centerXAnchor.constraint(equalTo: centerXAnchor),
            whiteView.heightAnchor.constraint(equalToConstant: 15),
            whiteView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9)
        ])
    }
}

//
//  ViewController.swift
//  rockPaperScissors
//
//  Created by Ivan Byndiu on 24/09/2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let logoImage: UIImageView = {
        let img = UIImageView(image: UIImage(named: "rockPaperScissors"))
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstrains()
    }

    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(logoImage)
    }
}

// MARK: - Set Constraints

extension ViewController {
    
    private func setConstrains() {
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 135),
            logoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            logoImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70)
        ])
    }
}

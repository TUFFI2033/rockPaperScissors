//
//  UIView + Extensions.swift
//  rockPaperScissors
//
//  Created by Ivan Byndiu on 01/10/2023.
//

import UIKit

extension UIView {
    func findViewController<T: UIViewController>(ofType type: T.Type) -> T? {
        if let viewController = self.next as? T {
            return viewController
        } else if let nextView = self.next as? UIView {
            return nextView.findViewController(ofType: type)
        } else {
            return nil
        }
    }
}

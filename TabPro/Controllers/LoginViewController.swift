//
//  LoginViewController.swift
//  TabPro
//
//  Created by vasili kuptsov on 28.11.21.
//

import Foundation
import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate {
    
    private let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 650, width: 200, height: 50))
        button.setTitle("Register", for: .normal)
        button.backgroundColor = .systemGray.withAlphaComponent(0.5)
        button.layer.cornerRadius = 8
        button.setTitleColor(.white, for: .normal)
        return button
        
    }()
    
    
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .brown
        
    }
    
}


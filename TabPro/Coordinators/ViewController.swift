//
//  ViewController.swift
//  TabPro
//
//  Created by vasili kuptsov on 19.10.21.
//

import UIKit
import AVFoundation



class ViewController: UIViewController {
    
    
    private let registerButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 250, width: 200, height: 50))
        button.setTitle("Register", for: .normal)
        button.backgroundColor = .systemGray.withAlphaComponent(0.5)
        button.layer.cornerRadius = 8
        button.setTitleColor(.white, for: .normal)
        return button
        
    }()
    
    private let loginButton: UIButton = {
        let logButton = UIButton(frame: CGRect(x: 100, y: 320, width: 200, height: 50))
        logButton.setTitle("Log In", for: .normal)
        logButton.backgroundColor = .systemGray.withAlphaComponent(0.5)
        logButton.layer.cornerRadius = 8
        logButton.setTitleColor(.white, for: .normal)
        return logButton
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "FL.jpeg")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        view.addSubview(registerButton)
        registerButton.addTarget(self, action: #selector(didTapRegisterButton), for: .touchUpInside)
        view.addSubview(loginButton)
        loginButton.addTarget(self, action: #selector(didTaploginButton), for: .touchUpInside)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
    }
    @objc func didTapRegisterButton() {
        present(RegisterViewController(), animated: true)
    }
    @objc func didTaploginButton() {
        present(LoginViewController(), animated: true)
        
    }
}




//
//  LoginViewController.swift
//  TabPro
//
//  Created by vasili kuptsov on 28.11.21.
//

import Foundation
import UIKit

//protocol LoginViewControllerDelegate: AnyObject {
//    func searchViewController(_vc: SearchViewController, didSelectLocationWith coordinates: CLLocationCoordinate2D?)


class LoginViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate {
    
 //   weak var delegate: LoginViewControllerDelegate?
//final class LoginViewController: UIViewController {
   // final class LoginViewController: UIViewController {
        
    
private let button: UIButton = {
    let button = UIButton(frame: CGRect(x: 100, y: 650, width: 200, height: 50))
    button.setTitle("Register", for: .normal)
    button.backgroundColor = .systemGray.withAlphaComponent(0.5)
    button.layer.cornerRadius = 8
//        button.layer.borderWidth = 0.5
//        button.layer.borderColor = CGColor(red: 4, green: 4, blue: 4, alpha: 1)
    button.setTitleColor(.white, for: .normal)
    return button
    
}()

//    let contentLayoutGuide: UILayoutGuide
//
//    init() {
//        self.emailField = UITextField()
//        self.passwordField = UITextField()
//        self.loginButton = UIButton(type: .system)
//        self.contentLayoutGuide = UILayoutGuide()
//
//        super.init()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .brown
//
//        view.addSubview(emailField)
//        view.addSubview(passwordField)
//        view.addSubview(loginButton)
//
//        [emailField, passwordField, loginButton].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

//        view.addLayoutGuide(contentLayoutGuide)
//
//        NSLayoutConstraint.activate([
//            emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//
//            emailField.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor),
//            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 16.0),
//            loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 16.0),
//            loginButton.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor),
//
//            emailField.leadingAnchor.constraint(equalTo: passwordField.leadingAnchor),
//            emailField.trailingAnchor.constraint(equalTo: passwordField.trailingAnchor),
//
//            emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
//            passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
//            loginButton.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor),
//
//            contentLayoutGuide.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        ])
//
//        emailField.layer.borderWidth = 1.0
//        passwordField.layer.borderWidth = 1.0
//
//        emailField.placeholder = "email"
//        passwordField.placeholder = "password"
//
//        emailField.isSecureTextEntry = true
//        passwordField.isSecureTextEntry = true
//
//
    }

    }


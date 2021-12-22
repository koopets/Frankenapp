//
//  LoginViewController.swift
//  TabPro
//
//  Created by vasili kuptsov on 28.11.21.
//

import Foundation
import UIKit
import FirebaseAuth
import Firebase
import MapboxMaps
import MapboxSearchUI
import MapboxNavigation
import MapboxDirections
import MapboxSearch

class LoginViewController: UIViewController {
    
    
    let emailField = UITextField()
    let passwordField = UITextField()
    let loginButton = UIButton(type: .system)
    let contentLayoutGuide = UILayoutGuide()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "RDD.jpeg")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        emailField.frame.size = CGSize(width: 200, height: 30)
        emailField.layer.cornerRadius = 5
        emailField.backgroundColor = .systemGray.withAlphaComponent(0.5)
        
        view.addSubview(emailField)
        
        passwordField.frame.size = CGSize(width: 200, height: 30)
        passwordField.layer.cornerRadius = 5
        passwordField.backgroundColor = .systemGray.withAlphaComponent(0.5)
        loginButton.tintColor = .black
        loginButton.center = view.center
        loginButton.frame.size = CGSize(width: 200, height: 30)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        [emailField, passwordField, loginButton].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 25.0),
            loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 25.0),
            emailField.leadingAnchor.constraint(equalTo: passwordField.leadingAnchor),
            emailField.trailingAnchor.constraint(equalTo: passwordField.trailingAnchor),
            
            emailField.widthAnchor.constraint(equalToConstant: 200),
            passwordField.widthAnchor.constraint(equalToConstant: 200),
            loginButton.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor),
            
            emailField.heightAnchor.constraint(equalToConstant: 50),
            passwordField.heightAnchor.constraint(equalToConstant: 50),
            
        ])
        
        emailField.attributedPlaceholder = NSAttributedString(
            string: "email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        
        emailField.textAlignment = .center
        
        passwordField.attributedPlaceholder = NSAttributedString(
            string: "password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        passwordField.textAlignment = .center
        passwordField.isSecureTextEntry = true
        emailField.textContentType = .username
        emailField.autocapitalizationType = .none
        emailField.autocorrectionType = .no
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.addTarget(self, action: #selector(didTaploginButton), for: .touchUpInside)
        
    }
    override var modalPresentationStyle: UIModalPresentationStyle {
        get { .fullScreen }
        set { assertionFailure("Shouldnt change that ") }
        
    }
    @objc func didTaploginButton() {
        let tabBarViewController = UITabBarController()
        tabBarViewController.modalPresentationStyle = .fullScreen
        tabBarViewController.tabBar.backgroundColor = .white
        if let email = emailField.text, let password = passwordField.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                guard let self = self else { return }
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    self.present(tabBarViewController, animated: true)
                    
                    
                    
                    let vcOne = UINavigationController(rootViewController: HomeViewController())
                    let vcTwo = UINavigationController(rootViewController: AboutViewController())
                    let vcThree = UINavigationController(rootViewController: ActionViewController())
                    let vcFour = UINavigationController(rootViewController: MediaViewController())
                    //let vcFive = UINavigationController(rootViewController: MapViewController())
                    let vcFive = UINavigationController(rootViewController: MapsSearchViewController())
                    let vcSix = UINavigationController(rootViewController: SubscriptionViewController())
                    
                    vcOne.title = "Home"
                    vcTwo.title = "About"
                    vcThree.title = "Action"
                    vcFour.title = "Media"
                    vcFive.title = "Map"
                    vcSix.title = "SignUp"
                    
                    vcOne.navigationBar.prefersLargeTitles = false
                    vcOne.modalPresentationStyle = .fullScreen
                    vcOne.navigationBar.backgroundColor = .opaqueSeparator
                    
                    vcTwo.navigationBar.prefersLargeTitles = false
                    vcTwo.modalPresentationStyle = .fullScreen
                    vcTwo.navigationBar.backgroundColor = .opaqueSeparator
                    
                    vcSix.navigationBar.prefersLargeTitles = false
                    vcSix.modalPresentationStyle = .fullScreen
                    vcSix.navigationBar.backgroundColor = .opaqueSeparator
                    
                    
                    
                    tabBarViewController.setViewControllers([vcOne, vcTwo, vcThree, vcFour, vcFive], animated: false)
                    
                    guard let items = tabBarViewController.tabBar.items else {
                        return
                    }
                    let images = ["house.circle", "info.circle", "bicycle", "photo.on.rectangle.angled", "globe.americas"]
                    for x in 0..<items.count {
                        items[x].image = UIImage(systemName: images[x])
                    }

                }
            }
            
        }
    }
}


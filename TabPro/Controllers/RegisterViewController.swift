//
//  RegisterViewController.swift
//  TabPro
//
//  Created by vasili kuptsov on 21.12.21.
//

import UIKit
import Firebase
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    let emailField = UITextField()
   let passwordField = UITextField()
    let registerButton = UIButton(type: .system)
    let contentLayoutGuide = UILayoutGuide()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "AS.jpeg")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        

        emailField.frame.size = CGSize(width: 200, height: 30)
        emailField.layer.cornerRadius = 5
        emailField.backgroundColor = .systemGray.withAlphaComponent(0.5)

        view.addSubview(emailField)

        passwordField.frame.size = CGSize(width: 200, height: 30)
        passwordField.layer.cornerRadius = 5
        passwordField.backgroundColor = .systemGray.withAlphaComponent(0.5)

        registerButton.tintColor = .black
        registerButton.center = view.center

        registerButton.frame.size = CGSize(width: 200, height: 30)
        
        view.addSubview(passwordField)
        view.addSubview(registerButton)
        
        [emailField, passwordField, registerButton].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        
        
       NSLayoutConstraint.activate([
            emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            emailField.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            //emailField.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor),
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 25.0),
            registerButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 25.0),


            emailField.leadingAnchor.constraint(equalTo: passwordField.leadingAnchor),
            emailField.trailingAnchor.constraint(equalTo: passwordField.trailingAnchor),

            emailField.widthAnchor.constraint(equalToConstant: 200),
            passwordField.widthAnchor.constraint(equalToConstant: 200),
            registerButton.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor),

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


        registerButton.setTitle("Register", for: .normal)
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.addTarget(self, action: #selector(didTapRegisterButton), for: .touchUpInside)

        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);

    }

        @objc func keyboardWillShow(sender: NSNotification) {
             self.view.frame.origin.y = -150
        }

        @objc func keyboardWillHide(sender: NSNotification) {
             self.view.frame.origin.y = 0
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
override var modalPresentationStyle: UIModalPresentationStyle {
get { .fullScreen }
set { assertionFailure("Shouldnt change that ") }

}
    @objc func didTapRegisterButton() {
        
        if let email = emailField.text, let password = passwordField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    self.present(LoginViewController(), animated: true)
                }
                
                
            }
            
        }
    }
}

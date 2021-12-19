//
//  ViewController.swift
//  TabPro
//
//  Created by vasili kuptsov on 19.10.21.
//

import UIKit
import MapKit
import AVFoundation
import FloatingPanel
import CoreLocation


class ViewController: UIViewController {
    
    
    private let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 250, width: 200, height: 50))
        button.setTitle("Register", for: .normal)
        button.backgroundColor = .systemGray.withAlphaComponent(0.5)
        button.layer.cornerRadius = 8
        button.setTitleColor(.white, for: .normal)
        return button
        
    }()
    
    private let logButton: UIButton = {
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
        
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        view.addSubview(logButton)
        logButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
    }
    @objc func didTapButton() {
        let tabBarViewController = UITabBarController()
        
        let vcOne = UINavigationController(rootViewController: HomeViewController())
        let vcTwo = UINavigationController(rootViewController: AboutViewController())
        let vcThree = UINavigationController(rootViewController: ActionViewController())
        let vcFour = UINavigationController(rootViewController: MediaViewController())
        let vcFive = UINavigationController(rootViewController: MapViewController())
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
        
        tabBarViewController.modalPresentationStyle = .fullScreen
        tabBarViewController.tabBar.backgroundColor = .white
        present(tabBarViewController, animated: true)
    }
}




//
//  SubscriptionViewController.swift
//  TabPro
//
//  Created by vasili kuptsov on 12.12.21.
//

import UIKit

class SubscriptionViewController: UIViewController {

    let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
    
    let scrollView: UIScrollView = {
            let scrollView = UIScrollView()

            scrollView.translatesAutoresizingMaskIntoConstraints = false
            return scrollView
        }()
    
    private let button: UIButton = {
        //let button = UIButton(frame: CGRect(x: 70, y: 450, width: 250, height: 50))
        let button = UIButton()
        button.frame.size = CGSize(width: 250, height: 50)
        //let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitle("Continue with email", for: .normal)
        //button.backgroundColor = .systemGray.withAlphaComponent(0.5)
        button.backgroundColor = .black
        button.layer.cornerRadius = 8
//        button.layer.borderWidth = 0.5
//        button.layer.borderColor = CGColor(red: 4, green: 4, blue: 4, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        
        return button
        
    }()
    
   
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Testing your sanity"
//        backgroundImage.image = UIImage(named: "st.jpeg")
//        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "st.jpeg")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        
        button.center = view.center
        
       
        //self.view.insertSubview(backgroundImage, at: 0)
        
        
        scrollView.addSubview(button)
        self.view = scrollView
        self.scrollView.contentSize = CGSize(width:250, height: 1000)
        
        //view.insertSubview(scrollView, aboveSubview: backgroundImage)
        //scrollView.backgroundColor = .opaqueSeparator.withAlphaComponent(0.3)
        scrollView.backgroundColor = .white.withAlphaComponent(0.3)
        
        //view.backgroundColor = .yellow
        
        // Do any additional setup after loading the view.
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        view.addSubview(button)
    }
    @objc func didTapButton() {
        present(EmailViewController(), animated: true)
    
    }
    override var modalPresentationStyle: UIModalPresentationStyle {
        get { .fullScreen }
        set { assertionFailure("FCN fullscreen") }
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//
//        self.scrollView.contentSize = CGSize(width:250, height: 1000)
//    }


}

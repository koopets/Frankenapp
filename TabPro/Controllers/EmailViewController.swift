//
//  EmailViewController.swift
//  TabPro
//
//  Created by vasili kuptsov on 12.12.21.
//

import UIKit

class EmailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "st.jpeg")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
    override var modalPresentationStyle: UIModalPresentationStyle {
        get { .fullScreen }
        set { assertionFailure("FCN fullscreen") }
    }
        
}

//
//  HomeViewController.swift
//  TabPro
//
//  Created by vasili kuptsov on 12.12.21.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController {
    
    var player: AVPlayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Home"
        playBackgroundVideo()
        configureitems()
        
    }
    private func configureitems() {
        
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchSmt)),
                                              UIBarButtonItem(image: UIImage(systemName: "person.crop.circle.badge.plus"), style: .done, target: self, action: #selector(user))]
        self.navigationItem.leftBarButtonItems = [UIBarButtonItem(image: UIImage(systemName: "music.note.house.fill"), style: .done, target: self, action: nil),
                                                  UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(doSmt))]
        
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationController?.navigationBar.tintColor = .black
    }
    
    @objc func doSmt() {
        let st = SettingsViewController()
        navigationController?.pushViewController(st, animated: true)
    }
    
    @objc func user() {
        let proUser = UserViewController()
        navigationController?.pushViewController(proUser, animated: true)
        
        
    }
    
    @objc func searchSmt() {
        let search = SearchViewController()
        navigationController?.pushViewController(search, animated: true)
        
        
        
    
        view.backgroundColor = .none
        
        //        // 2
        //        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterialLight)
        //        // 3
        //        let blurView = UIVisualEffectView(effect: blurEffect)
        //        // 4
        //        blurView.translatesAutoresizingMaskIntoConstraints = false
        //
        //        view.insertSubview(blurView, at: 50)
        
        
        
        
        
    }
    
    func playBackgroundVideo() {
        let path = Bundle.main.path(forResource: "Final", ofType: ".MOV")
        player = AVPlayer(url: URL(fileURLWithPath: path!))
        player!.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.frame
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.view.layer.insertSublayer(playerLayer, at: 0)
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player!.currentItem)
        player!.seek(to: CMTime.zero)
        player!.play()
        
        self.player?.isMuted = true
    }
    @objc func playerItemDidReachEnd() {
        player!.seek(to: CMTime.zero)

        
        
    }
}

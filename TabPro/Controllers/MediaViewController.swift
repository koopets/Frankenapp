//
//  MediaViewController.swift
//  TabPro
//
//  Created by vasili kuptsov on 12.12.21.
//

import UIKit

class MediaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        return table
    }()
    
    
    private let viewModels: [CollectionTableViewCellViewModel] = [CollectionTableViewCellViewModel(viewModels: [ TileCollectionViewCellViewModel(name: "Gear", imageName: "t"),
                                                                                                                 TileCollectionViewCellViewModel(name: "Jungles", imageName: "fg"),
                                                                                                                 TileCollectionViewCellViewModel(name: "Horizons", imageName: "sf"),
                                                                                                                 TileCollectionViewCellViewModel(name: "Timofey", imageName: "tl"),
                                                                                                                 TileCollectionViewCellViewModel(name: "Sunshine", imageName: "sfl"),
                                                                                                                 TileCollectionViewCellViewModel(name: "Woods", imageName: "st")
                                                                                                                 
                                                                                                                 
                                                                                                               ])]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "FL.jpeg")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        tableView.backgroundColor = .white.withAlphaComponent(0.3)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return viewModels.count
        return viewModels.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath)
                as? CollectionTableViewCell else {
                    fatalError()
                    
                }
        cell.delegate = self
        cell.confiure(with: viewModel)
        cell.backgroundColor = .clear
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.width/2
    }
    
}

extension MediaViewController: CollectionTableViewCellDelegate {
    func collectionTableViewCellDidTapItem(with viewModel: TileCollectionViewCellViewModel) {
        present(SubscriptionViewController(), animated: true, completion: nil)
        
    }
    
}

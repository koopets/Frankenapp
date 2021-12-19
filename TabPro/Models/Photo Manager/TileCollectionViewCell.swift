//
//  TileCollectionViewCell.swift
//  TabPro
//
//  Created by vasili kuptsov on 12.12.21.
//

import UIKit

struct TileCollectionViewCellViewModel {
    
    let name: String
    let imageName: String
}

class TileCollectionViewCell: UICollectionViewCell {
    static let identifier = "TileCollectionViewCell"
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sfl")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        return imageView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(myImageView)
        contentView.addSubview(label)
        contentView.layer.cornerRadius = 6
        contentView.layer.borderWidth = 4
        contentView.layer.borderColor = CGColor.init(red: 255, green: 255, blue: 255, alpha: 0.5)
        //contentView.layer.borderColor = UIColor.quaternaryLabel.cgColor
        //contentView.layer.borderColor = UIColor.quaternaryLabel.cgColor
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = contentView.bounds
        myImageView.frame = contentView.bounds
    }
    
    func configure(with viewModel: TileCollectionViewCellViewModel) {
        myImageView.image = UIImage(named: viewModel.imageName)
        label.text = viewModel.name
    }
}

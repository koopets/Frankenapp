//
//  ThirdViewController.swift
//  TabPro
//
//  Created by vasili kuptsov on 5.12.21.
//

import UIKit
import RxSwift
import RxCocoa

struct Product {
    let imageName: String
    let title: String
}

struct ProductViewModel {
    var items = PublishSubject<[Product]>()
    
    func fetchItems() {
        let products = [
        Product(imageName: "figure.walk.diamond.fill", title: "Human"),
        Product(imageName: "bicycle", title: "Bike"),
        Product(imageName: "house.fill", title: "Home"),
        Product(imageName: "bitcoinsign.circle", title: "Bike"),
        Product(imageName: "gear", title: "Settings"),
        Product(imageName: "person.circle", title: "Money"),
        Product(imageName: "airplane", title: "Flights"),
        Product(imageName: "bell", title: "Activity"),
        Product(imageName: "peacesign", title: "Peace"),
        Product(imageName: "video.square", title: "Video"),
        Product(imageName: "figure.walk.diamond.fill", title: "Human"),
        Product(imageName: "bicycle", title: "Bike"),
        Product(imageName: "house.fill", title: "Home"),
        Product(imageName: "bitcoinsign.circle", title: "Bike"),
        Product(imageName: "gear", title: "Settings"),
        Product(imageName: "person.circle", title: "Money"),
        Product(imageName: "airplane", title: "Flights"),
        Product(imageName: "bell", title: "Activity"),
        Product(imageName: "peacesign", title: "Peace"),
        Product(imageName: "video.square", title: "Video"),
        Product(imageName: "figure.walk.diamond.fill", title: "Human"),
        Product(imageName: "bicycle", title: "Bike"),
        Product(imageName: "house.fill", title: "Home"),
        Product(imageName: "bitcoinsign.circle", title: "Bike"),
        Product(imageName: "gear", title: "Settings"),
        Product(imageName: "person.circle", title: "Money"),
        Product(imageName: "airplane", title: "Flights"),
        Product(imageName: "bell", title: "Activity"),
        Product(imageName: "peacesign", title: "Peace"),
        Product(imageName: "video.square", title: "Video"),
        Product(imageName: "figure.walk.diamond.fill", title: "Human"),
        Product(imageName: "bicycle", title: "Bike"),
        Product(imageName: "house.fill", title: "Home"),
        Product(imageName: "bitcoinsign.circle", title: "Bike"),
        Product(imageName: "gear", title: "Settings"),
        Product(imageName: "person.circle", title: "Money"),
        Product(imageName: "airplane", title: "Flights"),
        Product(imageName: "bell", title: "Activity"),
        Product(imageName: "peacesign", title: "Peace"),
        Product(imageName: "video.square", title: "Video"),]
        
        items.onNext(products)
        items.onCompleted()
    }
}

class ActionViewController: UIViewController, UITableViewDelegate {
    
    private let tableView: UITableView = {
        
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private var viewModel = ProductViewModel()
    private var bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        view.addSubview(tableView)
        tableView.delegate = self
        //tableView.dataSource = self
        tableView.frame = view.bounds
        bindTableData()
        
    }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
    
        
    }
    
    func bindTableData() {
        viewModel.items.bind(to: tableView.rx.items(cellIdentifier: "cell", cellType: UITableViewCell.self)) { row, model, cell in
            cell.textLabel?.text = model.title
            cell.imageView?.image = UIImage(systemName: model.imageName)
            let backgroundView = UIView()
            backgroundView.backgroundColor = UIColor.systemOrange.withAlphaComponent(0.7)
            cell.selectedBackgroundView = backgroundView
            cell.contentView.tintColor = UIColor.black
        }.disposed(by: bag)
        
        tableView.rx.modelSelected(Product.self).bind { product in
            print(product.title)
        }.disposed(by: bag)
        
        viewModel.fetchItems()
    }

    
}



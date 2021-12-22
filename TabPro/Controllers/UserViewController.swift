//
//  UserViewController.swift
//  TabPro
//
//  Created by vasili kuptsov on 22.12.21.
//

import UIKit
import Firebase
import FirebaseAuth

struct Division {
    let title: String
    
    let options: [UserOptionType]
}

enum UserOptionType {
    case staticCell(model: UserOption)
    case switchCell(model: UserSwithchOption)
}

struct UserSwithchOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
    var isOn: Bool
}

struct UserOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}

class UserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UserTableViewCell.self, forCellReuseIdentifier: UserTableViewCell.identifier)
        table.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier)
        
        return table
    }()
    
    var models = [Division]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        title = "User"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds

    }
    func configure() {
        models.append(Division(title: "Status", options: [
            .switchCell(model: UserSwithchOption(title: "Log Out", icon: UIImage(systemName: "person.crop.circle"), iconBackgroundColor: .systemGreen, handler: {
            }, isOn: true))

        ]))
        models.append(Division(title: "General", options: [
            .staticCell(model: UserOption(title: "Personal data", icon: UIImage(systemName: "person.text.rectangle"), iconBackgroundColor: .systemRed) {
        }),
            .staticCell(model: UserOption(title: "Stuff", icon: UIImage(systemName: "gear"), iconBackgroundColor: .systemGray) {
        }),
            .staticCell(model: UserOption(title: "Area", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemRed) {
        }),
            .staticCell(model: UserOption(title: "Directions", icon: UIImage(systemName: "globe"), iconBackgroundColor: .systemBlue) {
        })
        ]))
        models.append(Division(title: "Optional", options: [
            .staticCell(model: UserOption(title: "Wifi", icon: UIImage(systemName: "leaf.circle"), iconBackgroundColor: .systemRed) {
        }),
            .staticCell(model: UserOption(title: "Stuff", icon: UIImage(systemName: "gear"), iconBackgroundColor: .systemGray) {
        }),
            .staticCell(model: UserOption(title: "Area", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemRed) {
        }),
            .staticCell(model: UserOption(title: "Directions", icon: UIImage(systemName: "globe"), iconBackgroundColor: .systemBlue) {
        })
        ]))
        models.append(Division(title: "Custom", options: [
            .staticCell(model: UserOption(title: "Wifi", icon: UIImage(systemName: "leaf.circle"), iconBackgroundColor: .systemRed) {
        }),
            .staticCell(model: UserOption(title: "Stuff", icon: UIImage(systemName: "gear"), iconBackgroundColor: .systemGray) {
        }),
            .staticCell(model: UserOption(title: "Area", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemRed) {
        }),
            .staticCell(model: UserOption(title: "Directions", icon: UIImage(systemName: "globe"), iconBackgroundColor: .systemBlue) {
        })
        ]))
    }
    @objc func signOut(_sender: UISwitch) {
 
            let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            present(ViewController(), animated: true)
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
          
            
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        
        switch model.self {
        case .staticCell(let model):
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as? UserTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
            
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier, for: indexPath) as? SwitchTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        }
        

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].options[indexPath.row]
        switch type.self {
        case .staticCell(let model):
            model.handler()
            
        case .switchCell(let model):
            model.handler()
        }
        
    }
}



        
        
        
    

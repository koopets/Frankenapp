//
//  SettingsViewController.swift
//  TabPro
//
//  Created by vasili kuptsov on 5.12.21.
//

import UIKit

struct Section {
    let title: String
    let options: [SettingsOption]
    //let options: [SettingsOptionType]
//}
//
//enum SettingsOptionType {
//    case staticCell(model: SettingsOption)
//    case swithCell(model: SettingsSwithchOption)
//}
//
//struct SettingsSwithchOption {
//    let title: String
//    let icon: UIImage?
//    let iconBackgroundColor: UIColor
//    let handler: (() -> Void)
//    var isOn: Bool
}

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        return table
    }()
    
    var models = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        title = "Settings"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.backgroundColor = .white.withAlphaComponent(0.1)
        tableView.frame = view.bounds

    }
    func configure() {
        models.append(Section(title: "General", options: [
            SettingsOption(title: "Account", icon: UIImage(systemName: "person.crop.rectangle"), iconBackgroundColor: .systemBlue) {
                print("tapped first cell")
        },
            SettingsOption(title: "Damn pivacy settings", icon: UIImage(systemName: "eye.slash"), iconBackgroundColor: .systemRed) {
        },
            SettingsOption(title: "Subscription", icon: UIImage(systemName: "dollarsign.square"), iconBackgroundColor: .systemGreen) {
        },
            SettingsOption(title: "Personal data", icon: UIImage(systemName: "person.text.rectangle"), iconBackgroundColor: .systemBlue) {
        }
        ]))
        models.append(Section(title: "Optional", options: [
            SettingsOption(title: "Volume level", icon: UIImage(systemName: "speaker.wave.2.circle"), iconBackgroundColor: .systemRed) {
        },
            SettingsOption(title: "Preferences", icon: UIImage(systemName: "gearshape"), iconBackgroundColor: .systemGray) {
        },
            SettingsOption(title: "Area", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemRed) {
        },
            SettingsOption(title: "Precise location", icon: UIImage(systemName: "globe"), iconBackgroundColor: .systemBlue) {
        }
        ]))
        models.append(Section(title: "Custom", options: [
            SettingsOption(title: "App appearance", icon: UIImage(systemName: "apps.iphone"), iconBackgroundColor: .systemRed) {
        },
            SettingsOption(title: "Stuff", icon: UIImage(systemName: "gear"), iconBackgroundColor: .systemGray) {
        },
            SettingsOption(title: "Area", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemRed) {
        },
            SettingsOption(title: "Directions", icon: UIImage(systemName: "globe"), iconBackgroundColor: .systemBlue) {
        }
        ]))
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as? SettingsTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: model)
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.systemOrange.withAlphaComponent(0.7)
        cell.selectedBackgroundView = backgroundView
//        cell.backgroundColor = .white.withAlphaComponent(0.35)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = models[indexPath.section].options[indexPath.row]
        model.handler()
    }
}

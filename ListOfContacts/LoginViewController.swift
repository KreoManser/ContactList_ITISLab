//
//  ViewController.swift
//  ListOfContacts
//
//  Created by Сергей Бабич on 02.07.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var nextViewButton: UIButton!
    @IBOutlet weak var loginLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.view.backgroundColor = .black
        nextViewButton.configuration = setupConfiguration(with: "Next")
    }
    
    @IBAction func nextButtonDidTap(_ sender: Any) {
        let numPhone = loginLabel.text ?? ""
        let countSymbolsInLine = numPhone.count
        let PersonalInfo = (countSymbolsInLine, numPhone)
        
        guard let wrongVC = storyboard?.instantiateViewController(withIdentifier: "WrongViewController") else { return }
        guard let contactListVC = storyboard?.instantiateViewController(withIdentifier: "ContactListTableViewController") else { return }
        
        
        switch PersonalInfo {
        case (12..., _):
            print("Неверный формат!")
            present(wrongVC, animated: true)
        case (..<11, _):
            print("Неверный формат!")
            present(wrongVC, animated: true)
        case (11, _) where numPhone.hasPrefix("89087"):
            print("Авторизация успешна!")
            navigationController?.pushViewController(contactListVC, animated: true)
        default:
            print("Неверный формат!")
            present(wrongVC, animated: true)
        }
    }
    
    
    private func setupConfiguration(with title: String) -> UIButton.Configuration {
        var buttonConfiguration = UIButton.Configuration.filled()
            
        buttonConfiguration.cornerStyle = .large
        buttonConfiguration.buttonSize = .large
        buttonConfiguration.baseBackgroundColor = .systemIndigo
        buttonConfiguration.attributedTitle?.font = UIFont.systemFont(ofSize: 36)
        buttonConfiguration.title = title
        
        return buttonConfiguration
    }
}


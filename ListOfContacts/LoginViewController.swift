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
        let phoneLength = 11
        let numPhone = loginLabel.text ?? ""
        let countSymbolsInLine = numPhone.count
        let PersonalInfo = (countSymbolsInLine, numPhone)
        
        guard let wrongVC = storyboard?.instantiateViewController(withIdentifier: "WrongViewController") as? WrongViewController else { return }
        
        guard let contactListVC = storyboard?.instantiateViewController(withIdentifier: "ContactListTableViewController") as? ContactListTableViewController else { return }
        
        
        switch PersonalInfo {
        case (12..., _):
//            print("Неверный формат!")
            wrongVC.error = "Cократите номер на \(countSymbolsInLine - phoneLength) символов"
            present(wrongVC, animated: true)
        case (..<11, _):
//            print("Неверный формат!")
            wrongVC.error = "Дополните номер на \(phoneLength - countSymbolsInLine) символов"
            present(wrongVC, animated: true)
        case (11, _) where numPhone.hasPrefix("89087"):
//            print("Авторизация успешна!")
            navigationController?.pushViewController(contactListVC, animated: true)
        default:
//            print("Неверный формат!")
            wrongVC.error = "Неверный формат!"
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


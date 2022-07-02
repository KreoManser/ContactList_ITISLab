//
//  DetailUserViewController.swift
//  ListOfContacts
//
//  Created by Сергей Бабич on 02.07.2022.
//

import UIKit

class DetailUserViewController: UIViewController {
    
    
    @IBOutlet weak var nameUserLabel: UILabel!
    @IBOutlet weak var numberOfPhoneUserLabel: UILabel!
    @IBOutlet weak var closeDetailButton: UIButton!
    
    var nameUser: String?
    var numberOfPhoneUser: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        closeDetailButton.configuration = setupConfiguration(with: "Close")
        
        if nameUser != nil {
            nameUserLabel.text = nameUser
        }
        if numberOfPhoneUser != nil {
            numberOfPhoneUserLabel.text = numberOfPhoneUser
        }
    }
    
    @IBAction func closeButtonDidTap(_ sender: Any) {
        dismiss(animated: true)
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

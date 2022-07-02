//
//  WrongViewController.swift
//  ListOfContacts
//
//  Created by Сергей Бабич on 02.07.2022.
//

import UIKit

class WrongViewController: UIViewController {

    @IBOutlet weak var closeViewButton: UIButton!
    @IBOutlet weak var wrongLabel: UILabel!
    
    var error: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        closeViewButton.configuration = setupConfiguration(with: "Close")
        
        if error != nil {
            wrongLabel.text = error
        }
    }
    
    @IBAction func closeViewButtonDidTap(_ sender: Any) {
        dismiss(animated: true)
    }
    
    private func setupConfiguration(with title: String) -> UIButton.Configuration {
        var buttonConfiguration = UIButton.Configuration.filled()
            
        buttonConfiguration.cornerStyle = .large
        buttonConfiguration.buttonSize = .large
        buttonConfiguration.baseBackgroundColor = .systemRed
        buttonConfiguration.attributedTitle?.font = UIFont.systemFont(ofSize: 36)
        buttonConfiguration.title = title
        
        return buttonConfiguration
    }

}

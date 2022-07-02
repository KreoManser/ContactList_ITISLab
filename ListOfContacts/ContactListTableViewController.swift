//
//  ContactListTableViewController.swift
//  ListOfContacts
//
//  Created by Сергей Бабич on 02.07.2022.
//

import UIKit

struct Contact {
    let name: String
    let numPhone: String
}

class ContactListTableViewController: UITableViewController {
    
    let contacts = [
        Contact(name: "Alex", numPhone: "89970479672"),
        Contact(name: "Mommy", numPhone: "89989479665"),
        Contact(name: "Rose", numPhone: "89030479341"),
        Contact(name: "Grey", numPhone: "89308479670"),
        Contact(name: "Hexlet", numPhone: "89970776666"),
        Contact(name: "Marie", numPhone: "8908479653"),
        Contact(name: "Lex", numPhone: "89238479440"),
        Contact(name: "Ray", numPhone: "89308479670"),
        Contact(name: "Lexi", numPhone: "89308479521"),
        Contact(name: "Kurt", numPhone: "89308455699"),
        Contact(name: "Bart", numPhone: "89088479221"),
        Contact(name: "Mark", numPhone: "89068479772")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Didnt uncoment!
//        let nib = UINib(nibName: "ContactListTableViewCell", bundle: nil)
//        tableView.register(nib, forCellReuseIdentifier: "ContactListTableViewCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "ContactListTableViewCell",
            for: indexPath
        ) as? ContactListTableViewCell else { return UITableViewCell() }
        
        cell.nameLabel.text = contacts[indexPath.row].name
        cell.numPhoneLabel.text = contacts[indexPath.row].numPhone
        
        return cell
    }
}

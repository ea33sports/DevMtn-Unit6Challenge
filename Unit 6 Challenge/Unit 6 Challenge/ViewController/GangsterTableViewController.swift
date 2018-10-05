//
//  GangsterTableViewController.swift
//  Unit 6 Challenge
//
//  Created by Eric Andersen on 10/5/18.
//  Copyright © 2018 Eric Andersen. All rights reserved.
//

import UIKit

class GangsterTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Functions
    func presentAlertController() {
        let alertController = UIAlertController(title: "Enter a gangster", message: nil, preferredStyle: .alert)
        alertController.addTextField { (entryTextField) in
            entryTextField.placeholder = "yo ho gangsters go here..."
        }
        
        let dismissAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let saveAction = UIAlertAction(title: "Add", style: .default) { (_) in
            
            guard let nameText = alertController.textFields?[0].text else { return }
            GangsterController.shared.createGangster(name: nameText)
            self.tableView.reloadData()
        }
        
        alertController.addAction(dismissAction)
        alertController.addAction(saveAction)
        
        present(alertController, animated: true)
    }
    
    
    // MARK: - Table view data source
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return GangsterController.shared.gangsters.count % 2 == 1 ? (GangsterController.shared.gangsters.count / 2) + 1 : GangsterController.shared.gangsters.count / 2
//    }
//
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Group \(section + 1)"
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GangsterController.shared.gangsters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gangsterCell", for: indexPath)
//        let gangsters = GangsterController.shared.gangsters
//        let array = [gangsters]
//        let eachItem = array[indexPath.section][indexPath.row]
//
//        if indexPath.section % 2 == 1 {
//            print("For one \(indexPath)")
//            cell.textLabel?.text = gangsters[indexPath.row].name
//            return cell
//
//        } else if indexPath.section % 2 == 0 {
//            print("For TWO \(indexPath)")
//
//            cell.textLabel?.text = gangsters[indexPath.row].name
//            return cell
//        }
        
        
        let gangster = GangsterController.shared.gangsters[indexPath.row]
        

        // Configure the cell...
        cell.textLabel?.text = gangster.name
        
        return cell
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
    }

    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
     }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let gangster = GangsterController.shared.gangsters[indexPath.row]
            GangsterController.shared.delete(gangster: gangster)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
        }
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        presentAlertController()
    }
    
    @IBAction func randomizeButtonTapped(_ sender: Any) {
        GangsterController.shared.gangsters.shuffle()
        tableView.reloadData()
    }
}

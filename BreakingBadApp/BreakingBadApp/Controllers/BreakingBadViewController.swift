//
//  BreakingBadViewController.swift
//  BreakingBadApp
//
//  Created by Deniz Adil on 10/12/20.
//

import UIKit

class BreakingBadViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var characters = [BrBad]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTable()
        
        APIManager.shared.getActors { (actors, error) in
            if let actors = actors {
                self.characters = actors
                self.tableView.reloadData()
            }
            print("aj da vidime")
        }
    }
    
    func setupTable() {
        tableView.register(UINib(nibName: "ActorsTableViewCell", bundle: nil), forCellReuseIdentifier: "actorCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
}
extension BreakingBadViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "actorCell") as! ActorsTableViewCell
        let allActors = characters[indexPath.row]
        cell.getActorInfo(actors: allActors)
        return cell
        }
    }


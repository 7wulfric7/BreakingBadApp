//
//  BreakingBadViewController.swift
//  BreakingBadApp
//
//  Created by Deniz Adil on 10/12/20.
//

import UIKit
import Kingfisher

class BreakingBadViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var actors = [BreakingBadInfo]()
    var filteredActors = [BreakingBadInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTable()
        registerForKeyboardNotificaitons()
        searchBar.delegate = self
        
        APIManager.shared.getActorInfo { (brBaInfo, error) in
            if let actors = brBaInfo {
                self.actors = actors
                self.tableView.reloadData()
            }
            print("vrakja nesto")
        }
        
        
//        getActors()
        
        // Do any additional setup after loading the view.
    }
    func registerForKeyboardNotificaitons() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardDidShow(notification: Notification) {
        if let userInfo = notification.userInfo {
            if let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height, right: 0)
                tableView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height, right: 0)
            }
        }
    }
    @objc func keyboardDidHide(notification: Notification) {
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func setupTable() {
        tableView.register(UINib(nibName: "ActorsTableViewCell", bundle: nil), forCellReuseIdentifier: "actorCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}
extension BreakingBadViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            filteredActors.removeAll()
            filteredActors.append(contentsOf: actors)
            tableView.reloadData()
            return
        }
        let text = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        filteredActors = actors.filter({ $0.name.lowercased().hasPrefix(text.lowercased()) })
        tableView.reloadData()
    }
}

extension BreakingBadViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredActors.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "actorCell") as! ActorsTableViewCell
        let actors = filteredActors[indexPath.row]
        cell.setActorInfo(actors: actors)
        cell.selectionStyle = .gray
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


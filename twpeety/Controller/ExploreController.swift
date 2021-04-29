//
//  ExploreController.swift
//  twpeety
//
//  Created by Temitope on 09/04/2021.
//

import UIKit

private let reuseIdentifier = "UserCell"

class ExploreController: UITableViewController {

    // MARK: - Properties
    
    // MARK: -  LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()

    }
    
    // MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Explore"

        tableView.register(UserCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 60
        tableView.separatorStyle = .none
    }
 

}

extension ExploreController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! UserCell
        return cell
    }
}

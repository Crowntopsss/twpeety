//
//  ProfileController.swift
//  twpeety
//
//  Created by Temitope on 23/04/2021.
//

import UIKit

private let reuseIdentifier = "TweetCell"

class ProfileController: UICollectionViewController {
    
    // MARK: - Properties
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()

    }
    
    // MARK: - Helpers
    func configureCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.register(TweetCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }


}


// MARK: UICollectionViewDataSource

extension ProfileController {

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TweetCell
        
        // Configure the cell
        
        return cell
    }
}

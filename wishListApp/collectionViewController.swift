//
//  collectionViewController.swift
//  wishListApp
//
//  Created by DANIEL VEGA on 1/7/22.
//

import UIKit

class collectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
   
    

    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionViewOutlet.dataSource = self
        collectionViewOutlet.delegate = self
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CustomCell
        return cell
    }
   

}

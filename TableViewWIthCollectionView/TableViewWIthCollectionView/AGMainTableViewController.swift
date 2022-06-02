//
//  AGMainViewController.swift
//  TableViewWIthCollectionView
//
//  Created by Anton Gorlov on 3/1/20.
//  Copyright © 2020 Anton Gorlov. All rights reserved.
//

import UIKit

class AGMainTableViewController: UITableViewController,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet var myTableView: UITableView!
    
    let cellIdentifire       = "cellIdentifier"//#function
    let collectionIdentifier = "cellCollectionIdentifier"
    
    var sectionArray: [String] {
        
        let array = ["One","Two","Three","Four","Five"]
        
        return array
    }
    
    var statusCollection: [String]{
        
        let array = ["1 collection cell","2 collection cell","3 collection cell","4 collection cell","5 collection cell"]
        
        return array
    }
    
    var descriptionArray: [String]{
    
        let array = ["46t43","sdrgdrg","thfh","ere","345sefg"]
        
        return array
    }
    
    var images:[String]{
        
        let yodaImage = "yodaImage"
        let pandaImage = "pandaImage"
       
        var array = [String]()
        
        for _ in 0...3 {
            
            array.append(yodaImage)
            array.append(pandaImage)
        }
        
        return array
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sectionArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire, for: indexPath) as! AGTableViewCell
        
        cell.titleLabel.text = sectionArray[indexPath.row]
        
        return cell
    }
    
    //MARK:- Collection view
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         
        return sectionArray.count
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionIdentifier, for: indexPath) as! AGCollectionViewCell
        
        collectionCell.statusLabel.text = nil
        collectionCell.descriptionLabel.text = nil
        collectionCell.imageView.image = nil
        collectionCell.statusLabel.text = statusCollection[indexPath.row]
        collectionCell.descriptionLabel.text = descriptionArray[indexPath.row]
        collectionCell.imageView.image = UIImage(named: images[indexPath.row])
        return collectionCell
     }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width / 1.2, height: collectionView.frame.height)
    }
}


final class AGTableViewCell: UITableViewCell{
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var titleLabel: UILabel!
    
    override func prepareForReuse() {
        
        super.prepareForReuse()
        self.collectionView  = nil
        self.titleLabel.text = nil
    }
}

final class AGCollectionViewCell: UICollectionViewCell{
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func prepareForReuse() {
        
        super.prepareForReuse()
        self.imageView.image       = nil
        self.statusLabel.text      = nil
        self.descriptionLabel.text = nil
    }
}

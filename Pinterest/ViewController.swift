//
//  ViewController.swift
//  Pinterest
//
//  Created by Maria on 07/12/2020.
//

import UIKit

class ViewController: UIViewController {
    
    let numberOfColumns: Int
    let items: [String]
    
    init(numberOfColumns: Int, items: [String]) {
        self.numberOfColumns = numberOfColumns
        self.items = items
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let layout = PinterestLayout(numberOfColumns: numberOfColumns)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        let collection = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout:  layout)
        collection.backgroundColor = .white
        collection.register(PinterestCell.self, forCellWithReuseIdentifier: "CELL")
        collection.dataSource = self
        
        if let layout = collection.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        
        view.addSubview(collection)
        
    }
    
    
}


extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CELL", for: indexPath)as! PinterestCell
        let image = UIImage(named: self.items[indexPath.row])
        cell.image = image
        return cell
    }
    
}

extension ViewController: PinterestDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfColumns: Int, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat{
        let image = UIImage(named: self.items[indexPath.item])!
        let imageHeight = image.size.height
        let imageWidth = image.size.width
        let columnRatio: CGFloat = 1/CGFloat(numberOfColumns)
        let imageSizeRatio = (collectionView.frame.width * columnRatio) / imageWidth
        return imageHeight * imageSizeRatio
    }
    
    
}

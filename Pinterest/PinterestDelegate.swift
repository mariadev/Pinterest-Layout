//
//  PinterestDelegate.swift
//  Pinterest
//
//  Created by Maria on 08/12/2020.
//

import UIKit


protocol PinterestDelegate: class {
    func collectionView(_ collectionView: UICollectionView, numberOfColumns: Int, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat
    
}

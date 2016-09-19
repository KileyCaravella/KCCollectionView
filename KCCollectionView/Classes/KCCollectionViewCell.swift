//
//  KCCollectionViewCell.swift
//  KCCollectionViewPod
//
//  Created by Kiley Caravella on 9/12/16.
//  Copyright © 2016 Kiley Caravella. All rights reserved.
//

import UIKit

protocol KCCollectionViewCellDelegate: class {
    
}

public class KCCollectionViewCell: UICollectionViewCell {
    weak var delegate: KCCollectionViewCellDelegate?
    
    public func configureCellWithCollectionView(collectionView: KCCollectionView) {
        autoresizesSubviews = true
        layer.cornerRadius = collectionView.cellCornerRadius
        layer.borderWidth = collectionView.cellBorderWidth
        layer.borderColor = collectionView.cellBorderColor
        clipsToBounds = true
    }
}

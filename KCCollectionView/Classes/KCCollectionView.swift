//
//  KCCollectionBoard.swift
//  KCCollectionViewPod
//
//  Created by Kiley Caravella on 9/12/16.
//  Copyright © 2016 Kiley Caravella. All rights reserved.
//

import UIKit

public class KCCollectionView: UICollectionView {
    
    // MARK: - Base Private
    
    private var privateNumberCellsPerRow: Int {
        if equalCellsInRowsAndColumns {
            return numberCellsInView.squared()
        }
        return numberCellsPerRow
    }
    
    private var privateNumberCellsPerColumn: Int {
        if equalCellsInRowsAndColumns {
            return privateNumberCellsPerRow
        }
        return numberCellsInView/privateNumberCellsPerRow
    }
    
    private var floatNumberCellsPerRow: CGFloat {
        return CGFloat(privateNumberCellsPerRow)
    }
    
    private var floatNumberCellsPerColumn: CGFloat {
        return CGFloat(privateNumberCellsPerColumn)
    }
    
    private var centerCell: Int {
        if sqrt(Double(numberCellsInView))%2 != 0 {
            return numberCellsInView/2
        } else {
            return -1
        }
    }
    
    private func setupSelf() {
        registerClass(KCCollectionViewCell.self, forCellWithReuseIdentifier: "KCCollectionViewCell")
        dataSource = self
    }
    
    public var layout: UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = minimumRowSpacing
        layout.minimumInteritemSpacing = minimumColumnSpacing
        layout.itemSize = cellSize
        return layout
    }
    
    // MARK: - Base Public
    
    public override func awakeFromNib() {
        setupSelf()
    }
    
    override public init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        setupSelf()
    }
    
    public convenience init(frame: CGRect) {
        self.init(frame: frame, collectionViewLayout: UICollectionViewLayout())
        setupSelf()
    }
    
    public convenience init() {
        self.init(frame: CGRectZero, collectionViewLayout: UICollectionViewLayout())
        setupSelf()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public var numberCellsPerRow = 2
    public var numberCellsInView = 25
    public var equalCellsInRowsAndColumns: Bool = false
    
    public var cellCornerRadius: CGFloat = 5
    public var cellBorderWidth: CGFloat = 1
    public var cellBorderColor = UIColor.blackColor().CGColor
    
    public var minimumColumnSpacing: CGFloat = 0
    public var minimumRowSpacing: CGFloat = 0

    // MARK: - Public Functions
    
    public var cellSize: CGSize {
        return CGSizeMake(frame.width/floatNumberCellsPerRow - minimumColumnSpacing, frame.height/floatNumberCellsPerColumn - minimumRowSpacing)
    }
}

// MARK: - UICollectionView Main Functions

extension KCCollectionView: UICollectionViewDataSource {
    @objc public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberCellsInView
    }
    
    @objc public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("KCCollectionViewCell", forIndexPath: indexPath) as! KCCollectionViewCell
        cell.configureCellWithCollectionView(self)
        return cell
    }
}

// MARK: - Extensions

extension Int {
    mutating func squared() -> Int {
        return Int(sqrt(Double(self)))
    }
}

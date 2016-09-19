//
//  ViewController.swift
//  KCCollectionViewPod
//
//  Created by Kiley Caravella on 9/6/16.
//  Copyright © 2016 Kiley Caravella. All rights reserved.
//

import UIKit
import KCCollectionViewPod

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var exampleCollectionView: KCCollectionView!
    
    // MARK: - Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupExampleCollectionView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        exampleCollectionView.collectionViewLayout = exampleCollectionView.layout
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    // MARK: - Methods
    
    func setupExampleCollectionView() {
        exampleCollectionView.numberCellsPerRow = 4
        exampleCollectionView.numberCellsInView = 28
        exampleCollectionView.minimumColumnSpacing = 1
        exampleCollectionView.minimumRowSpacing = 5
        exampleCollectionView.delegate = self
        exampleCollectionView.dataSource = self
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return exampleCollectionView.collectionView(collectionView, numberOfItemsInSection: section)
    }
    
    func button(number: Int) -> UIButton {
        let createButton = UIButton()
        createButton.frame = CGRectMake(0, 0, exampleCollectionView.cellSize.width/2, exampleCollectionView.cellSize.height/2)
        createButton.layer.borderColor = UIColor.orangeColor().CGColor
        createButton.layer.borderWidth = 1
        createButton.setTitle("\(number)", forState: .Normal)
        createButton.titleLabel?.textColor = UIColor.blueColor()
        createButton.backgroundColor = UIColor.clearColor()
        return createButton
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = exampleCollectionView.collectionView(collectionView, cellForItemAtIndexPath: indexPath)
        cell.backgroundColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 0.8)
        cell.addSubview(button(indexPath.row))
        return cell
    }
}


//  ViewController.swift
//  KCCollectionViewPod
//
//  Created by Kiley Caravella on 9/6/16.
//  Copyright © 2016 Kiley Caravella. All rights reserved.
//

import UIKit
import KCCollectionView

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var exampleCollectionView: KCCollectionView!
    var exampleInitCollectionView = KCCollectionView(frame: CGRectMake(0, UIScreen.mainScreen().bounds.height*3/4, 300, 150))
    
    // MARK: - Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupExampleCollectionView()
        setupInitExampleCollectionView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
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
    
    func setupInitExampleCollectionView() {
        exampleInitCollectionView.backgroundColor = UIColor.clearColor()
        exampleInitCollectionView.numberCellsInView = 9
        exampleInitCollectionView.equalCellsInRowsAndColumns = true
        exampleInitCollectionView.minimumColumnSpacing = 0
        exampleInitCollectionView.minimumRowSpacing = 0
        exampleInitCollectionView.dataSource = self
        exampleInitCollectionView.delegate = self
        exampleInitCollectionView.resetLayout()
        view.addSubview(exampleInitCollectionView)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if exampleInitCollectionView == collectionView {
            return exampleInitCollectionView.collectionView(collectionView, numberOfItemsInSection: section)
        }
        return exampleCollectionView.collectionView(collectionView, numberOfItemsInSection: section)
    }
    
    func collViewButton(number: Int) -> UIButton {
        let createButton = UIButton()
        createButton.frame = CGRectMake(0, 0, exampleCollectionView.cellSize.width/2, exampleCollectionView.cellSize.height/2)
        createButton.layer.borderColor = UIColor.blackColor().CGColor
        createButton.layer.borderWidth = 1
        createButton.setTitle("\(number)", forState: .Normal)
        createButton.titleLabel?.textColor = UIColor.blueColor()
        createButton.backgroundColor = UIColor.purpleColor()
        return createButton
    }
    
    func initCollViewButton(number: Int) -> UIButton {
        let createButton = UIButton()
        createButton.frame = CGRectMake(0, 0, exampleInitCollectionView.cellSize.width/2, exampleInitCollectionView.cellSize.height/2)
        createButton.layer.borderColor = UIColor.blackColor().CGColor
        createButton.layer.borderWidth = 1
        createButton.setTitle("\(number)", forState: .Normal)
        createButton.titleLabel?.textColor = UIColor.blueColor()
        createButton.backgroundColor = UIColor.purpleColor()
        return createButton
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        if exampleInitCollectionView == collectionView {
            cell = exampleInitCollectionView.collectionView(collectionView, cellForItemAtIndexPath: indexPath)
            cell.addSubview(initCollViewButton(indexPath.row))

        } else {
            cell = exampleCollectionView.collectionView(collectionView, cellForItemAtIndexPath: indexPath)
            cell.addSubview(collViewButton(indexPath.row))
        }
        cell.backgroundColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 0.8)
        return cell
    }
}

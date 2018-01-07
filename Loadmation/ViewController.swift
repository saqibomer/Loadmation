//
//  ViewController.swift
//  Loadmation
//
//  Created by Saqib Omer on 17/12/2017.
//  Copyright © 2017 Saqib Omer. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    // Properties
    @IBOutlet weak var circle1ContainerView: UIView!
    @IBOutlet weak var circle2ContainerView: UIView!
    @IBOutlet weak var pulseContainerView: UIView!
    
    var cicular  : Loadmation!
    var cicular2 : Loadmation!
    var arrow    : Loadmation!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
    // Start Animating
    
    @IBAction func startLoadmationAction(_ sender: UIButton) {
        
        self.cicular.startAnimation()
        self.cicular2.startAnimation()
        self.arrow.startAnimation()
    }
    // stop Animating
    @IBAction func stopLoadmationAction(_ sender: UIButton) {
        self.cicular.stopLoadingAnimation()
        self.cicular2.stopLoadingAnimation()
        self.arrow.stopLoadingAnimation()
    }
    
    
    
    // MARK: - CollectionView DataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "exampleCell", for: indexPath) as! ExampleCollectionViewCell
        
        
        if indexPath.row == 0 {
            self.cicular = Loadmation(parent: cell.contentView, style: Loadmation.Styles.Circular.rawValue, frame: cell.contentView.frame)
            
        } else if indexPath.row == 1 {
            self.cicular2 = Loadmation(parent: cell.contentView, style: Loadmation.Styles.Circular2.rawValue, frame: cell.contentView.frame)
            
            
        } else if indexPath.row == 2 {
            self.arrow = Loadmation(parent: cell.contentView, style: Loadmation.Styles.Arrow.rawValue, frame: cell.contentView.frame)
            
        }
        
        return cell
    }
    
    
    
    // MARK - CollectionViewDelegateFlowlayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.width / 3)
        
    }
    
}


//
//  SlippersViewController.swift
//  Nano1
//
//  Created by heri hermawan on 29/04/22.
//

import Foundation
import UIKit

protocol SlippersVCDelegate : AnyObject{
    func getItem(item: String?)
}

class SlippersViewController : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    struct Slippers{
        var emoji: String?
    }
    
    struct Slipon{
        var emoji: String?
    }
    
    @IBOutlet weak var slippersCollection: UICollectionView!
    @IBOutlet weak var sliponCollection: UICollectionView!
    
    weak var slippersVCDelegate: SlippersVCDelegate?
    
    var slippers = [Slippers]()
    var slipon = [Slipon]()
    
    override func viewDidLoad() {
        
        blurBackground()
        
        slippersCollection.dataSource = self
        slippersCollection.delegate = self
        slippersCollection.tag = 1
        
        sliponCollection.delegate = self
        sliponCollection.dataSource = self
        sliponCollection.tag = 2
        
        initSlipon()
        initSlippers()
    }
    
    func initSlippers(){
        slippers.append(Slippers(emoji: "🩴"))
        slippers.append(Slippers(emoji: "👡"))
        slippers.append(Slippers(emoji: "🩰"))
        
//        slippersCollection.reloadData()
    }
    
    func initSlipon(){
        slipon.append(Slipon(emoji: "🥿"))
        slipon.append(Slipon(emoji: "⛸"))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 {
            return slippers.count
        }
        
        return slipon.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "slippersCell", for: indexPath) as! SlipperCollectionViewCell
            cell.roundedCorner()
            let slipper = slippers[indexPath.row]
            cell.slippersLabel.text = slipper.emoji
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sliponCell", for: indexPath) as! SlipperCollectionViewCell
        cell.roundedCorner()
        let slipon = slipon[indexPath.row]
        cell.sliponLabel.text = slipon.emoji
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 1 {
            self.dismiss(animated: true){
                let item = self.slippers[indexPath.row]
                print("***** INDEX : \(item.emoji!)")
                self.slippersVCDelegate?.getItem(item: item.emoji!)
            }
        } else {
            self.dismiss(animated: true){
                let item = self.slipon[indexPath.row]
                print("***** INDEX : \(item.emoji!)")
                self.slippersVCDelegate?.getItem(item: item.emoji!)
            }
        }
    }
    
}

//
//  ShoesViewController.swift
//  Nano1
//
//  Created by heri hermawan on 28/04/22.
//

import Foundation
import UIKit

protocol ShoesVCDelegate : AnyObject{
    func getItem(item: String?)
}

class ShoesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    struct Sneakers{
        var emoji: String?
    }
    
    struct Formal{
        var emoji: String?
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var formalCollection: UICollectionView!
    
    weak var shoesVCDelegate: ShoesVCDelegate?
    
    var sneakers = [Sneakers]()
    var formal = [Formal]()
    
    override func viewDidLoad() {
        
        blurBackground()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        formalCollection.delegate = self
        formalCollection.dataSource = self
        collectionView.tag = 1
        formalCollection.tag = 2
        
        initSneakers()
        initFormal()
    }
    
//    func blurBackground(){
//        let blur = UIVisualEffectView()
//        blur.frame = view.frame
//        blur.effect = UIBlurEffect(style: .systemUltraThinMaterialDark)
//        view.insertSubview(blur, at: 0)
//    }
    
    func initSneakers(){
        sneakers.append(Sneakers(emoji: "👟"))
        sneakers.append(Sneakers(emoji: "🥾"))
        sneakers.append(Sneakers(emoji: "👢"))
        sneakers.append(Sneakers(emoji: "🛼"))
        
        collectionView.reloadData()
    }
    
    func initFormal(){
        formal.append(Formal(emoji: "👞"))
        formal.append(Formal(emoji: "👠"))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 {
            return sneakers.count
        }
        
        return formal.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shoesCell", for: indexPath) as! ShoesCollectionViewCell
            cell.roundedCorner()
            let sneaker = sneakers[indexPath.row]
            cell.shoesLabel.text = sneaker.emoji
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "formalCell", for: indexPath) as! ShoesCollectionViewCell
        cell.roundedCorner()
        let formal = formal[indexPath.row]
        cell.formalLabel.text = formal.emoji
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 1 {
            self.dismiss(animated: true){
                let item = self.sneakers[indexPath.row]
                print("***** INDEX : \(item.emoji!)")
                self.shoesVCDelegate?.getItem(item: item.emoji!)
            }
        } else {
            self.dismiss(animated: true){
                let item = self.formal[indexPath.row]
                print("***** INDEX : \(item.emoji!)")
                self.shoesVCDelegate?.getItem(item: item.emoji!)
            }
        }
    }
}

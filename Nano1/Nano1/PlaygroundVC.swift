//
//  PlaygroundVC.swift
//  Nano1
//
//  Created by heri hermawan on 27/04/22.
//

import Foundation
import UIKit

class PlaygroundVC : UIViewController {

    var imageView = UIImageView(frame: CGRect(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2, width: 50, height: 50))
    
    var label = UILabel(frame: CGRect(x: (UIScreen.main.bounds.width / 2), y: UIScreen.main.bounds.height / 2, width: 60, height: 60))
    
    var label2 = UILabel(frame: CGRect(x: (UIScreen.main.bounds.width / 2), y: UIScreen.main.bounds.height / 2, width: 60, height: 60))
    
    var arrLabel : [UILabel] = []
    
    var current = 0
    
    @IBOutlet weak var chooseShoes: UIButton!
    @IBOutlet weak var chooseSlippers: UIButton!
    @IBOutlet weak var container: UIView!
    
    override func viewDidLoad() {
        chooseShoes.addTarget(self, action: #selector(shoesTapped), for: .touchUpInside)
        chooseSlippers.addTarget(self, action: #selector(slippersTapped), for: .touchUpInside)
        
        setupLabel()
        arrLabel.append(label)
        arrLabel.append(label2)
        
//        imageView.image = UIImage.init(named: "shoe1")
//        imageView.contentMode = .scaleToFill
//        imageView.addGestureRecognizer(pan2)
//        imageView.isUserInteractionEnabled = true
        
//        self.view.addSubview(imageView)
        self.view.addSubview(label)
        self.view.addSubview(label2)
    }
    
    func setupLabel(){
        let pan = UIPanGestureRecognizer(target: self, action: #selector(gesturePan(_:)))
        let pan2 = UIPanGestureRecognizer(target: self, action: #selector(gesturePan2(_:)))
        
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(pan)
        label.font = label.font.withSize(60)
        
        label2.isUserInteractionEnabled = true
        label2.addGestureRecognizer(pan2)
        label2.font = label.font.withSize(60)
    }
    
    @objc func gesturePan(_ sender: UIPanGestureRecognizer){
        let translation = sender.translation(in: container)
        var finalPoint = CGPoint()
        finalPoint.x = min(max(finalPoint.x, 0), container.bounds.width)
        finalPoint.y = min(max(finalPoint.y, 0), container.bounds.height)
        let minX = container.frame.minX
        let maxX = container.frame.maxX
        let minY = container.frame.minY
        let maxY = container.frame.maxY
        
        if let view = sender.view {
            if (view.frame.minX == minX ||
                view.frame.maxX == maxX ||
                view.frame.minY == minY ||
                view.frame.maxY == maxY){
                print("******** MASUK SINI maxX \(container.frame.minX) \(minX)***")
//                view.center = CGPoint(x:translation.x, y: translation.y)
            } else {
                view.center = CGPoint(x:view.center.x + translation.x, y:view.center.y + translation.y)
            }
        }
        sender.setTranslation(CGPoint(x: 0, y: 0), in: container)
        
        switch sender.state {
        case .ended:
            if arrLabel[1].text?.isEmpty == nil{
                current = 1
                break
            }
            current = 0
            break
        case .possible:
            break
        case .began:
            break
        case .changed:
            break
        case .cancelled:
            break
        case .failed:
            break
        @unknown default:
            break
        }
//        guard sender.state == .began else {return}

    }
    
    @objc func gesturePan2(_ sender: UIPanGestureRecognizer){
        let translation = sender.translation(in: self.view)
        if let view = sender.view {
            view.center = CGPoint(x:view.center.x + translation.x, y:view.center.y + translation.y)
        }
        sender.setTranslation(CGPoint(x: 0, y: 0), in: self.view)
        current = 1
    }
    
    @objc func shoesTapped(_ : UIButton){
        self.performSegue(withIdentifier: "shoesSegue", sender: nil)
    }
    
    @objc func slippersTapped(_ : UIButton){
        self.performSegue(withIdentifier: "slippersSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "shoesSegue" {
            if let destination = segue.destination as? ShoesViewController{
                destination.shoesVCDelegate = self
            }
        }
        
        if segue.identifier == "slippersSegue" {
            if let destination = segue.destination as? SlippersViewController{
                destination.slippersVCDelegate = self
            }
        }
    }
}

extension PlaygroundVC: ShoesVCDelegate, SlippersVCDelegate{
    func getItem(item: String?) {
//        label.text = item
        arrLabel[current].text = item
    }
}

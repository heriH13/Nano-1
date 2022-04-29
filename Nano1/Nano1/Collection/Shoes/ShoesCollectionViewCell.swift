//
//  ShoesCollectionViewCell.swift
//  Nano1
//
//  Created by heri hermawan on 28/04/22.
//

import UIKit

class ShoesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var shoesLabel: UILabel!
    @IBOutlet weak var formalLabel: UILabel!
    
    func roundedCorner(){
        self.layer.cornerRadius = 16
        self.contentView.backgroundColor = .gray
        let blur = UIVisualEffectView()
        blur.frame = contentView.frame
        blur.effect = UIBlurEffect(style: .regular)
        contentView.insertSubview(blur, at: 0)
    }
    
    
}

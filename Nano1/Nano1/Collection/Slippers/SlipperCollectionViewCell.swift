//
//  SlipperCollectionViewCell.swift
//  Nano1
//
//  Created by heri hermawan on 29/04/22.
//

import Foundation
import UIKit

class SlipperCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var slippersLabel: UILabel!
    @IBOutlet weak var sliponLabel: UILabel!
    
    func roundedCorner(){
        self.layer.cornerRadius = 16
        self.contentView.backgroundColor = .gray
        let blur = UIVisualEffectView()
        blur.frame = contentView.frame
        blur.effect = UIBlurEffect(style: .regular)
        contentView.insertSubview(blur, at: 0)
    }
}

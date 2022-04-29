//
//  ViewController.swift
//  Nano1
//
//  Created by heri hermawan on 26/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var startBtn: UIButton!
    var imageBG = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        imageBG.translatesAutoresizingMaskIntoConstraints = false
        imageBG.image = UIImage.init(named: "BG")
        imageBG.contentMode = .scaleToFill
        imageBG.layer.opacity = 0.6
//        imageBG.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
//        imageBG.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
//        imageBG.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
//        imageBG.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        startBtn.addTarget(self, action: #selector(openPlayground(_:)), for: .touchUpInside)
        view.insertSubview(imageBG, at: 0)
    }

    @objc func openPlayground(_ sender: UIButton){
        self.performSegue(withIdentifier: "playgroundSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PlaygroundVC {
            destination.modalPresentationStyle = .fullScreen
        }
    }
    
}

extension UIViewController{
    func blurBackground(){
        let blur = UIVisualEffectView()
        blur.frame = view.frame
        blur.effect = UIBlurEffect(style: .systemUltraThinMaterialDark)
        view.insertSubview(blur, at: 0)
    }
}

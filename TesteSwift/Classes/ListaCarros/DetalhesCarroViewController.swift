//
//  DetalhesCarroViewController.swift
//  TesteSwift
//
//  Created by Fabio Martins on 13/08/18.
//  Copyright © 2018 Fabio Martins. All rights reserved.
//

import UIKit

class DetalhesCarroViewController: UIViewController {
    
    @IBOutlet var img : UIImageView!
    @IBOutlet var tDesc : UITextView!
    var carro : Carro!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let c = carro {
            self.title = c.nome
            self.tDesc.text = c.desc
            let data = try! Data(contentsOf: URL(string: c.url_foto)!)
            self.img.image = UIImage(data: data)
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        print("viewWillTransitionToSize \(size)")
        if(size.width > size.height) {
            print("Horizontal")
            tDesc.isHidden = true
            self.tabBarController!.tabBar.isHidden = true
            self.navigationController!.navigationBar.isHidden = true
        } else {
            print("Vertical")
            tDesc.isHidden = false
            self.tabBarController!.tabBar.isHidden = false
            self.navigationController!.navigationBar.isHidden = false
        }
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
}

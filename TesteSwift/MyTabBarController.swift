//
//  MyTabBarController.swift
//  TesteSwift
//
//  Created by Fabio Martins on 17/08/18.
//  Copyright © 2018 Fabio Martins. All rights reserved.
//

import UIKit

class MyTabBarController : UITabBarController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        // delega para o view controller atual (o último do array) a decisao da orientacao suportada para o view controller que esta sendo exibido no momento
        return self.selectedViewController!.supportedInterfaceOrientations
    }
}

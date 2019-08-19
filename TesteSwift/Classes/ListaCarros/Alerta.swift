//
//  Alerta.swift
//  TesteSwift
//
//  Created by Fabio Martins on 14/08/18.
//  Copyright © 2018 Fabio Martins. All rights reserved.
//

import UIKit

class Alerta {
    
    class func alerta (_ msg: String, viewController: UIViewController) {
        let alert = UIAlertController(title: "Alerta", message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
    
}

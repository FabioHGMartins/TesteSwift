//
//  SobreViewController.swift
//  TesteSwift
//
//  Created by Fabio Martins on 13/08/18.
//  Copyright © 2018 Fabio Martins. All rights reserved.
//

import UIKit

class SobreViewController: UIViewController, UIWebViewDelegate {
    
    let URL_SOBRE = "http://www.livroiphone.com.br/carros/sobre.htm"

    @IBOutlet var webView: UIWebView!
    @IBOutlet var progress : UIActivityIndicatorView!

    // trava a orientacao na vertical
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Sobre"
        
        self.progress.startAnimating()
        let url = URL(string: URL_SOBRE)
        let request = URLRequest(url:url!)
        self.webView.loadRequest(request)
        
        self.webView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.progress.stopAnimating()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

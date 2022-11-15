//
//  PetDetailVC.swift
//  Sepia_iOS_Vimal
//
//  Created by Vimal on 15/11/22.
//

import UIKit
import WebKit

class PetDetailVC: UIViewController {
    var list: Pet!
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = list.title
        self.loadWebView(model: list)
        // Do any additional setup after loading the view.
    }
    
    private func loadWebView(model: Pet){
        let url=URL(string: model.contentUrl ?? "")
        let urlreq=URLRequest(url:url!)
        webView.load(urlreq)
           
    }
}

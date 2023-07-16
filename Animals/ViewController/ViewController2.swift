//
//  ViewController2.swift
//  Animals
//
//  Created by zehra on 15.07.2023.
//

import UIKit
import WebKit

class ViewController2: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    public var selectedAnimals: Animals?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showWebView()
    }
    
    func showWebView() {
        guard let selectedAnimals else { return }
        let wikiLinks = "https://en.wikipedia.org/wiki/".appending(selectedAnimals.rawValue)
        guard let link = URL(string: wikiLinks) else { return }
        webView.load(URLRequest(url: link))
    }
    
}


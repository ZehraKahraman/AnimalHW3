//
//  ViewController.swift
//  Animals
//
//  Created by zehra on 15.07.2023.
//

import UIKit
import AVKit
import AVFoundation

public enum Animals: String {
    case lion
    case gorilla
    case zebra
    case elephant
    case ostrich
    case hippo
    case cheetah
    case giraffe
}

class ViewController: UIViewController {
    
    @IBOutlet weak var lionImageView: UIImageView!
    @IBOutlet weak var gorillaImageView: UIImageView!
    @IBOutlet weak var elephantImageView: UIImageView!
    @IBOutlet weak var zebraImageView: UIImageView!
    @IBOutlet weak var cheetahImageView: UIImageView!
    @IBOutlet weak var hippoImageView: UIImageView!
    @IBOutlet weak var ostrichImageView: UIImageView!
    @IBOutlet weak var giraffeImageView: UIImageView!
    var webViewItem: Animals = .elephant
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewsCornerRadius()
    }
    
    func setViewsCornerRadius() {
        lionImageView.layer.cornerRadius = 30
        gorillaImageView.layer.cornerRadius = 30
        elephantImageView.layer.cornerRadius = 30
        zebraImageView.layer.cornerRadius = 30
        cheetahImageView.layer.cornerRadius = 30
        hippoImageView.layer.cornerRadius = 30
        ostrichImageView.layer.cornerRadius = 30
        giraffeImageView.layer.cornerRadius = 30
    }
    
    @IBAction func about(_ sender: UIButton) {
        guard let buttonId = sender.restorationIdentifier,
              let animalEnum = Animals(rawValue: buttonId) else {
            return
        }
        webViewItem = animalEnum
    }
    
    @IBAction func video(_ sender: UIButton) {
        guard let docPath = Bundle.main.path(forResource: sender.restorationIdentifier, ofType: "mp4") else { return }
            
        let player = AVPlayer(url: URL(fileURLWithPath: docPath))
        let playerControl = AVPlayerViewController()
        playerControl.player = player
        present(playerControl, animated: true)
        player.play()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let arrrivedVC = segue.destination as! ViewController2
        arrrivedVC.selectedAnimals = webViewItem
    }
}


//
//  FindCarIndoorViewController.swift
//  Light-G
//
//  Created by James Au on 6/2/2023.
//

import Foundation
import UIKit
import AVFoundation
class FindCarIndoorViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        playvideo()
    }
    func playvideo() {
        let str = "https://firebasestorage.googleapis.com/v0/b/myfirebase-53e4d.appspot.com/o/Light_G_navigation.mp4?alt=media&token=ca018fde-3b91-473d-9950-f841031798bb"
        guard let videourl = URL(string: str) else { return  }
        let player = AVPlayer(url: videourl)
        let playerlayer = AVPlayerLayer(player: player)
        playerlayer.frame = self.view.bounds
        playerlayer.videoGravity = .resizeAspect
        self.view.layer.addSublayer(playerlayer)
        player.play()
        
    }
}

//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var queuePlayer = AVQueuePlayer()
    var playerLooper: AVPlayerLooper?
    var storyBrain = StoryBrain()
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        guard let url = Bundle.main.url(forResource: "bgm", withExtension: "mp3") else { return }
        let playerItem = AVPlayerItem(asset: AVAsset(url: url))
        playerLooper = AVPlayerLooper(player: queuePlayer, templateItem: playerItem)
        queuePlayer.play()
    }
    
    @IBAction func choiceMade(_ sender: UIButton) {
        let url = Bundle.main.url(forResource: "click", withExtension: "mp3")
        self.player = try! AVAudioPlayer(contentsOf: url!)
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
        } catch(let error) {
            print(error.localizedDescription)
        }
        
        self.player.play()
        storyBrain.nextStory(userChoice: sender.currentTitle!)
        updateUI()
    }
    
    func updateUI() {
        storyLabel.text = storyBrain.getDesc()
        choice1Button.setTitle(storyBrain.getC1(), for: .normal)
        choice2Button.setTitle(storyBrain.getC2(), for: .normal)
    }
}


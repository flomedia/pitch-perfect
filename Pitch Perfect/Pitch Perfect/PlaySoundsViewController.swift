//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Florin Tudose on 05.03.15.
//  Copyright (c) 2015 FLO Media. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    var audioPlayer: AVAudioPlayer!
    var receivedAudio: RecordedAudio!
    var audioEngine:AVAudioEngine!
    var audioFile:AVAudioFile!
    
    var auTimePitch:AVAudioUnitTimePitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: nil)
        audioPlayer.enableRate = true
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: receivedAudio.filePathUrl, error: nil)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playSlow(sender: UIButton) {
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        audioPlayer.rate = 0.5
        audioPlayer.play()
    }

    @IBAction func playFast(sender: UIButton) {
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        audioPlayer.rate = 1.5
        audioPlayer.play()
    }
    @IBAction func playChipmunk(sender: UIButton) {

        playAudioWithVariablePitch(1000)
    }
    @IBAction func playDarthVader(sender: UIButton) {
        playAudioWithVariablePitch(-1000)
    }
    func playAudioWithVariablePitch(pitch: Float){
    
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        var audioplayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioplayerNode)
        
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioplayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioplayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        
        audioplayerNode.play()
        
    }
    @IBAction func stopAllAudio(sender: UIButton) {
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

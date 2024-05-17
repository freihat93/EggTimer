//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    //dictionar
    //1
    let eggTimes = ["Soft": 3,"Medium": 420,"Hard": 720]
    // 2 & 3
//    let softTime = 5
//    let medimTime = 7
//    let hardTime = 12
    
    var totalTime = 0
    var timer = Timer()
    var secondsPassed = 0
    
    var player: AVAudioPlayer!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    @IBOutlet weak var titleLable: UILabel!
   // @IBOutlet weak var progressBar: NSLayoutConstraint!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        func playSoud(){
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
        
        if titleLable.text == "DONE!" {
            playSoud()
        }
        
    
        timer.invalidate()
        
        
        
        let hardness = sender.currentTitle!
        progressBar.progress = 0.0
        
        secondsPassed = 0
        titleLable.text = hardness
        totalTime = eggTimes[hardness]!
         
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        
        
        
        //1 ---------------------------------------------------
//        let result = eggTimes[hardness]!
//
//        print(result)
        
        
            
        
        
        //2 ---------------------------------------------------
//        switch hardness {
//        case "Soft":
//            print(softTime)
//
//        case "Medium":
//            print(medimTime)
//
//        case "Hard":
//            print(hardTime)
//
//        default:
//            print("ERROR")
//        }
        
        
        //3 ----------------------------------------------------
//        if hardness == "Soft"{
//            print(softTime)
//
//        }
//        else if  hardness == "Medium"{
//            print(medimTime)
//
//
//        }
//        else if hardness == "Hard" {
//            print(hardTime)
//
//        }
       
     
    }
    
    @objc func updateTimer() {
        var player: AVAudioPlayer!

        if secondsPassed < totalTime {


            secondsPassed += 1


            progressBar.progress = (Float(secondsPassed) / Float(totalTime))



        }else{
            timer.invalidate()
            titleLable.text = "DONE!"
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()

        }
    }
    

}

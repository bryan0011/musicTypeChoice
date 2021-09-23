//
//  ViewController.swift
//  musicTypeChoice
//
//  Created by Bryan Kuo on 2021/7/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var musicType: UIImageView!
    @IBOutlet weak var noMusic: SharpImageView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var birthdayPicker: UIDatePicker!
    @IBOutlet weak var genderSegment: UISegmentedControl!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var pairButton: UIButton!
    
    @IBOutlet weak var introvertedSwitch: UISwitch!
    @IBOutlet weak var outgoingSwitch: UISwitch!
    
//    按配對之後才會出現推薦收聽的Label,Slider,跟Slider 的Value Label
    @IBOutlet weak var recommandSlider: UISlider!
    @IBOutlet weak var recommandSinger: UILabel!
    @IBOutlet weak var recommandLabel: UILabel!
    
    var number = Int.random(in: 1...16)
    let player = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cancelButton.isHidden = true
        // Do any additional setup after loading the view.
        let musicUrl = Bundle.main.url(forResource: "TsaiStars", withExtension: "mp3")!
        let playItem = AVPlayerItem(url: musicUrl)
        player.replaceCurrentItem(with: playItem)
        player.volume = 0.8
        player.play()
    }


    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    @IBAction func changeOutgoing(_ sender: UISwitch) {
        if sender.isOn {
            number += 8
        }
    }
    
    
    @IBAction func changeIntroverted(_ sender: UISwitch) {
        if sender.isOn {
            number -= 8
        }
    }
    
    

    
    //    定義取消按鈕所發生的事情
    @IBAction func reset(_ sender: UIButton) {
        number = Int.random(in: 1...16)
        musicType.image = UIImage(named: "musicType")
        noMusic.isHidden = false
        recommandLabel.isHidden = true
        recommandSlider.isHidden = true
        recommandSinger.isHidden = true
        recommandSlider.value = 1
        recommandSinger.text = ""
        introvertedSwitch.isOn = false
        outgoingSwitch.isOn = false
        genderSegment.selectedSegmentIndex = 0
        cancelButton.isHidden = true
        pairButton.isHidden = false
    }
    
//    根據number 所產生的亂數來決定聽那一種類型的歌,並將recommand 的Slider，Label 顯示出來
    @IBAction func pair(_ sender: UIButton) {
        if number<=4 {
                musicType.image = UIImage(named: "jazz")
        } else if number>4 && number<9 {
            musicType.image = UIImage(named: "pop")
        } else if number>8 && number<12 {
            musicType.image = UIImage(named: "hiphop")
        } else {
            musicType.image = UIImage(named: "edm")
        }
        recommandLabel.isHidden = false
        recommandSlider.isHidden = false
        recommandSinger.isHidden = false
        noMusic.isHidden = true
        cancelButton.isHidden = false
        pairButton.isHidden = true
    }
    
    
//    配對音樂Type
    @IBAction func changeSinger(_ sender: UISlider) {

        
//        將recommandSinger 這個Label 根據recommandSlider數值來變更為1，2，3，4
        if sender.value < 21 {
            recommandSinger.text = ""
        } else if sender.value > 20 && sender.value < 41 {
            recommandSinger.text = "1"
        } else if sender.value > 40 && sender.value < 61 {
            recommandSinger.text = "2"
        } else if sender.value > 60 && sender.value < 81 {
            recommandSinger.text = "3"
        } else {
            recommandSinger.text = "4"
        }
        
        
//        定義recommandSlider 不同數值顯示不同圖片
        if number<=4 {
            if recommandSlider.value < 21 {
                musicType.image = UIImage(named: "jazz")
            } else if recommandSlider.value > 20 && recommandSlider.value < 41 {
                musicType.image = UIImage(named: "jazz-1")
            } else if recommandSlider.value > 40 && recommandSlider.value < 61 {
                musicType.image = UIImage(named: "jazz-2")
            } else if recommandSlider.value > 60 && recommandSlider.value < 81 {
                musicType.image = UIImage(named: "jazz-3")
            } else {
                musicType.image = UIImage(named: "jazz-4")
            }
            
        } else if number>4 && number<9 {
            if recommandSlider.value < 21 {
                musicType.image = UIImage(named: "pop")
            } else if recommandSlider.value > 20 && recommandSlider.value < 41 {
                musicType.image = UIImage(named: "pop-1")
            } else if recommandSlider.value > 40 && recommandSlider.value < 61 {
                musicType.image = UIImage(named: "pop-2")
            } else if recommandSlider.value > 60 && recommandSlider.value < 81 {
                musicType.image = UIImage(named: "pop-3")
            } else {
                musicType.image = UIImage(named: "pop-4")
            }
        } else if number>8 && number<12 {
            if recommandSlider.value < 21 {
                musicType.image = UIImage(named: "hiphop")
            } else if recommandSlider.value > 20 && recommandSlider.value < 41 {
                musicType.image = UIImage(named: "hiphop-1")
            } else if recommandSlider.value > 40 && recommandSlider.value < 61 {
                musicType.image = UIImage(named: "hiphop-2")
            } else if recommandSlider.value > 60 && recommandSlider.value < 81 {
                musicType.image = UIImage(named: "hiphop-3")
            } else {
                musicType.image = UIImage(named: "hiphop-4")
            }
        } else {
            if recommandSlider.value < 21 {
                musicType.image = UIImage(named: "edm")
            } else if recommandSlider.value > 20 && recommandSlider.value < 41 {
                musicType.image = UIImage(named: "edm-1")
            } else if recommandSlider.value > 40 && recommandSlider.value < 61 {
                musicType.image = UIImage(named: "edm-2")
            } else if recommandSlider.value > 60 && recommandSlider.value < 81 {
                musicType.image = UIImage(named: "edm-3")
            } else {
                musicType.image = UIImage(named: "edm-4")
            }
        }
    }
}


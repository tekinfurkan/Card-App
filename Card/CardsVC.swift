//
//  CardsVC.swift
//  Card
//
//  Created by Furkan Tekin on 25.06.2023.
//

import UIKit

class CardsVC: UIViewController {
    
    @IBOutlet var CardsİmageView: UIImageView!
    @IBOutlet var Buttons: [UIButton]!
    var cards : [UIImage] = Deck.allValues
    var timer : Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TimerStart()
        
        for button in Buttons {
            button.layer.cornerRadius = 8
        }
    }
    
    override func viewWillDisappear(_: Bool) {
        super.viewWillDisappear(true)
        timer.invalidate()
    }
    
    func TimerStart() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage),  userInfo: nil , repeats: true)
        
    }
    
    @objc func showRandomImage() {
        CardsİmageView.image = cards.randomElement() ?? UIImage(named: "10S")
    }
    
    @IBAction func RestartButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        TimerStart()
    }
    
    @IBAction func StopButtonTapped(_ sender: UIButton) {
        timer.invalidate()
    }
}

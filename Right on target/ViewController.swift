//
//  ViewController.swift
//  Right on target
//
//  Created by Лидия Ладанюк on 21.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var Slider: UISlider!
    @IBOutlet var Label: UILabel!
    
    var number: Int = 0
    var round: Int = 1
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewDidLoad ")
        number = Int.random(in: 1...50)
        Label.text = String(number)
        round = 1
    }

    @IBAction func checkNumber() {
        let numSlider = Int(Slider.value.rounded())
        if numSlider > number {
            score += 50 - numSlider + number
        } else if numSlider < number {
            score += 50 - number + numSlider
        } else {
            score += 50
        }
        if round == 5 {
            let alert = UIAlertController(title: "Игра окончена", message: "Вы заработали \(score) очков", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Начать заново", style: .default))
            present(alert, animated: true)
            round = 1
            score = 0
        } else {
            round += 1
        }
        number = Int.random(in: 1...50)
        Label.text = String(number)
    }
    
}



//
//  ViewController.swift
//  Calculator
//
//  Created by Gwair on 28.10.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet var numberOfButtons: [UIButton]!
    
    @IBOutlet var funcButtonOutlet: [UIButton]!
    
    var brain = CalculatorBrain()
    var firstNum:Float = 0
    var secondNum:Float = 0
    var percentNum:Float = 0
    var chahgeSing:Float = 0
    var isTrue = false
    var isFalse = false
    var result = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "0"
    }
    
    
    @IBAction func ChangeTheSign(_ sender: UIButton) {
        let sign = Float(resultLabel.text ?? "0") ?? 0
        if sign > 0 {
            chahgeSing = sign
            resultLabel.text = "-\(sign)"
        } else {
            resultLabel.text = "\(chahgeSing)"
        }
    }
    
    
    
    @IBAction func percendButton(_ sender: UIButton) {
        percentNum = Float(resultLabel.text ?? "0") ?? 0
        if firstNum == 0 {
            firstNum = percentNum / 100
            resultLabel.text = "\(firstNum)"
        } else {
            secondNum = (firstNum * percentNum) / 100
            resultLabel.text = "\(secondNum)"
        }
    }
    
    
    @IBAction func ACbutton(_ sender: UIButton) {
        numberOfButtons[7].isEnabled = true
        
        firstNum = 0
        secondNum = 0
        percentNum = 0
        chahgeSing = 0
        resultLabel.text = "0"
        result = ""
        isFalse = false
        isTrue = false
        setUI()
    }
    
    @IBAction func numberButton(_ sender: UIButton) {
        
        guard let number = sender.currentTitle else {return}

        if isFalse {
            resultLabel.text = ""
            isFalse = false
        }
        
        if isTrue {
            resultLabel.text = resultLabel.text! + number
        } else{
            resultLabel.text = number
            isTrue = true
        }
        
        if sender.tag == 17{
            numberOfButtons[7].isEnabled = false
        }
    }
    
    
    @IBAction func funcButton(_ sender: UIButton) {
        numberOfButtons[7].isEnabled = true
        
        if sender.tag == 10 {
            //                  =
            secondNum = Float(resultLabel.text ?? "0") ?? 0

            if funcButtonOutlet[2].layer.borderWidth == 2{
                //              *
                result = brain.mathOper(firstNum, secondNum) {"\($0 * $1)"}
            }else if funcButtonOutlet[0].layer.borderWidth == 2{
                //              +
                result = brain.mathOper(firstNum, secondNum) {"\($0 + $1)"}
            }else if funcButtonOutlet[1].layer.borderWidth == 2{
                //              -
                result = brain.mathOper(firstNum, secondNum) {"\($0 - $1)"}
            }else if funcButtonOutlet[3].layer.borderWidth == 2{
                //              /
                if firstNum != 0 && secondNum != 0{
                    result = brain.mathOper(firstNum, secondNum) {"\($0 / $1)"}
                } else{
                    resultLabel.text = "0"
                }
            }
            
            let formatArray = result.components(separatedBy: ".")
            if formatArray[1] == "0"{
                resultLabel.text = formatArray[0]
            } else {
                resultLabel.text = result
            }
            setUI()
            isTrue = false
        }
        setUI()
        ifMathSing(tag: sender.tag - 11)

    }
    
    func setUI() {
        for index in funcButtonOutlet.indices{
            funcButtonOutlet[index].layer.borderWidth = 0
        }
    }
    
    func ifMathSing(tag:Int){
        
        if tag < 4 && tag >= 0 {
        firstNum = Float(resultLabel.text ?? "0") ?? 0
            isFalse = true
            funcButtonOutlet[tag].layer.borderWidth = 2
        
    }
    }
    
    
}


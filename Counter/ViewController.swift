//
//  ViewController.swift
//  Counter
//
//  Created by Данила on 02.04.2025.
//

import UIKit

class ViewController: UIViewController {
    var a: Int = 0
    
    @IBOutlet weak var buttonPlus: UIButton!
    
    @IBOutlet weak var buttonMinus: UIButton!
    
    @IBOutlet weak var buttonReset: UIButton!
    
    @IBOutlet weak var counterValue: UILabel!
        
    @IBOutlet weak var labelInfo: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelInfo.text = "История изменений:"
        labelInfo.isEditable = false
        labelInfo.isScrollEnabled = true
    }
    
    @IBAction func buttonPlusDidTap(_ sender: Any) {
        a += 1
        counterValue.text = "Значение счетчика: \(a)"
        labelInfo.text += "\n[\(getCurrentTime())]: значение изменено на +1"
        scrollToBottom()
    }
    
    @IBAction func buttonMinusDidTap(_ sender: Any) {
        if a > 0 {
            a -= 1
            counterValue.text = "Значение счетчика: \(a)"
            labelInfo.text += "\n[\(getCurrentTime())]: значение изменено на -1"
        } else {
            labelInfo.text += "\n[\(getCurrentTime())]: попытка уменьшить значение счётчика ниже 0"
        }
        scrollToBottom()
    }
    
    @IBAction func buttonResetDidTap(_ sender: Any) {
       a = 0
        counterValue.text = "\(a)"
        labelInfo.text += "\n[\(getCurrentTime())]: значение сброшено"
        scrollToBottom()
    }
    
    func getCurrentTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return formatter.string(from: Date())
    }
    
    func scrollToBottom() {
        let range = NSRange(location: labelInfo.text.count - 1, length: 1)
        labelInfo.scrollRangeToVisible(range)
    }
}

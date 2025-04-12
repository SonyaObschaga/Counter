//
//  ViewController.swift
//  Counter
//
//  Created by Данила on 02.04.2025.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var buttonPlus: UIButton!
    @IBOutlet private weak var buttonMinus: UIButton!
    @IBOutlet private weak var buttonReset: UIButton!
    @IBOutlet private weak var labelValue: UILabel!
    @IBOutlet private weak var labelInfo: UITextView!
    private var counterValue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    @IBAction private func buttonPlusDidTap(_ sender: Any) {
        counterValue += 1
        labelValue.text = "Значение счетчика: \(counterValue)"
        labelInfo.text += "\n[\(getCurrentTime())]: значение изменено на +1"
        scrollToBottom()
    }
    @IBAction private func buttonMinusDidTap(_ sender: Any) {
        if counterValue > 0 {
            counterValue -= 1
            labelValue.text = "Значение счетчика: \(counterValue)"
            labelInfo.text += "\n[\(getCurrentTime())]: значение изменено на -1"
        } else {
            labelInfo.text += "\n[\(getCurrentTime())]: попытка уменьшить значение счётчика ниже 0"
        }
        scrollToBottom()
    }
    @IBAction private func buttonResetDidTap(_ sender: Any) {
        counterValue = 0
        labelValue.text = "\(counterValue)"
        labelInfo.text += "\n[\(getCurrentTime())]: значение сброшено"
        scrollToBottom()
    }
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return formatter
    }()
    private func getCurrentTime() -> String {
        return dateFormatter.string(from: Date())
    }
   private func scrollToBottom() {
        let range = NSRange(location: labelInfo.text.count - 1, length: 1)
        labelInfo.scrollRangeToVisible(range)
    }
    private func setupUI() {
        labelInfo.text = "История изменений:"
        labelInfo.isEditable = false
        labelInfo.isScrollEnabled = true
        }
}


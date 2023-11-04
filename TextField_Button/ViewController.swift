//
//  ViewController.swift
//  TextField_Button
//
//  Created by jr on 2023/11/3.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var myTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendButton.layer.cornerRadius = 5
        myTextField.delegate = self
        canNotUseSendButton()
    }

    private func canNotUseSendButton() {
        sendButton.isEnabled = false
        sendButton.setTitleColor(.systemGray5, for: .normal)
        sendButton.backgroundColor = .systemGray3
    }
    
    private func canUseSendButton() {
        sendButton.isEnabled = true
        sendButton.setTitleColor(.white, for: .normal)
        sendButton.backgroundColor = .systemMint
    }
    
    @IBAction func sendText(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "", message: myTextField.text ?? "", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.myTextField.text = ""
        canNotUseSendButton()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("增加或刪除前的文字數: \(myTextField.text!.count)")
        print("增加文字數: \(string.count)")
        print("刪除文字數目: \(range.length)")
        print("增加或刪除的文字位置: \(range.location)")
        print("總文字長度:\(myTextField.text!.count + string.count - range.length)")
        print("------------------")
        if let text = myTextField.text,  text.count + string.count - range.length != 0 {
           canUseSendButton()
        } else {
            canNotUseSendButton()
        }
        return true
    }
}

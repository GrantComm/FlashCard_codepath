//
//  creationView.swift
//  FlashCards
//
//  Created by Grant Commodore on 2/29/20.
//  Copyright © 2020 Grant Commodore. All rights reserved.
//

import Foundation
import UIKit

class creationViewController: UIViewController{
    
    var flashCardController: ViewController!
    
    @IBOutlet weak var newQuestion: UITextField!
    @IBOutlet weak var newAnswer: UITextField!
    @IBOutlet weak var newChoice1: UITextField!
    @IBOutlet weak var newChoice2: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func cancelClicked(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func submitClicked(_ sender: Any) {
        if(newQuestion.text == " " || newAnswer.text == " " || newChoice1.text == " " || newChoice2.text == " "){
            let message = "All fields must be filled"
            let alert1 = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert1.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert1, animated: true, completion: nil)
            dismiss(animated: false)

        }else{
        let nquestion = newQuestion.text
        let nanswer = newAnswer.text
        let nchoice1 = newChoice1.text
        let nchoice2 = newChoice2.text
        flashCardController.newCard(question: nquestion!, answer: nanswer!, choice1: nchoice1!, choice2: nchoice2!)
        dismiss(animated: true)
        }
    }

}

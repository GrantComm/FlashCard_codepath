//
//  ViewController.swift
//  FlashCards
//
//  Created by Grant Commodore on 2/15/20.
//  Copyright © 2020 Grant Commodore. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var answer: UILabel!
    
    
    @IBOutlet weak var Question: UILabel!
    @IBOutlet weak var card: UIView!
    
    
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        card.layer.cornerRadius = 20.0
        card.layer.shadowRadius = 15.0
        card.layer.shadowOpacity = 0.2
        card.clipsToBounds = true
        
        Button1.layer.borderWidth = 2.0
        Button1.layer.cornerRadius = 20.0
        Button1.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        Button2.layer.borderWidth = 2.0
        Button2.layer.cornerRadius = 20.0
        Button2.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        Button3.layer.borderWidth = 2.0
        Button3.layer.cornerRadius = 20.0
        Button3.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

    }


    @IBAction func tappedFlashCard(_ sender: Any) {
        if(Question.isHidden != true){
            Question.isHidden = true;
            print("Tapped Question")
        }else{
            Question.isHidden = false;
        }
    }
    
    
    @IBAction func button1Clicked(_ sender: Any) {
        Question.isHidden = true
    }
    
    
    @IBAction func button2Clicked(_ sender: Any) {
        Button2.isHidden = true
    }
    
    @IBAction func button3Clicked(_ sender: Any) {
        Button3.isHidden = true
    }
    
    func newCard(question: String, answer: String, choice1: String, choice2: String){
        Question.text = question
        Button1.setTitle(answer, for: .normal)
        Button2.setTitle(choice1, for: .normal)
        Button3.setTitle(choice2, for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let creationViewController = navigationController.topViewController as! creationViewController
        
        creationViewController.flashCardController = self
    }
    
    
}

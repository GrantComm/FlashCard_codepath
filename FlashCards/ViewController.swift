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
    
    @IBOutlet weak var question: UILabel!
    
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
        if(question.isHidden != true){
            question.isHidden = true;
            print("Tapped Question")
        }else{
            question.isHidden = false;
        }
    }
    
    
    @IBAction func button1Clicked(_ sender: Any) {
        question.isHidden = true
    }
    
    
    @IBAction func button2Clicked(_ sender: Any) {
        Button2.isHidden = true
    }
    
    @IBAction func button3Clicked(_ sender: Any) {
        Button3.isHidden = true
    }
    
    
}

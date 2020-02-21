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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func tappedFlashCard(_ sender: Any) {
        question.isHidden = true;
        print("Tapped")
    }
    
}

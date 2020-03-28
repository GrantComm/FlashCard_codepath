//
//  ViewController.swift
//  FlashCards
//
//  Created by Grant Commodore on 2/15/20.
//  Copyright © 2020 Grant Commodore. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    struct Flashcard{
        var q: String;
        var a: String;
        var c1: String;
        var c2: String;
    };

    @IBOutlet weak var Answer: UILabel!
    @IBOutlet weak var Question: UILabel!
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    
    
    var flashcards = [Flashcard]()
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        readDisk()
        if flashcards.count == 0{
        newCard(question: "Where is Morehouse College Located?", answer: "Atlanta", choice1: "New Orleans", choice2: "Washington DC")
        }else{
            updateLabels()
            updateCurrAndPrev()
        }
        
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
        flipCard()
    }
    
    func flipCard(){
        if(Question.isHidden != true){
            UIView.transition(with: card, duration: 0.3, options: .transitionCurlUp, animations: {
                    self.Question.isHidden = true})
                print("Tapped Question")
        }else{
            UIView.transition(with: card, duration: 0.3, options: .transitionCurlDown, animations: {
                self.Question.isHidden = false})
        }
    }
    
    
    func animateOut(){
        UIView.animate(withDuration: 0.3, animations: {
            self.card.transform = CGAffineTransform.identity.translatedBy(x: -300.0, y: 0.0)
        }) { finished in
            self.updateLabels()
            self.animateIn()
        }
    }
    
    func animateIn(){
        card.transform = CGAffineTransform.identity.translatedBy(x: 300.0, y: 0.0)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.card.transform = CGAffineTransform.identity
        })
    }
    
    
    @IBAction func button1Clicked(_ sender: Any) {
        Question.isHidden = true
        print("Button1 Clicked")
    }
    
    
    @IBAction func button2Clicked(_ sender: Any) {
        Button2.isHidden = true
        print("Button2 Clicked")
    }
    
    @IBAction func button3Clicked(_ sender: Any) {
        Button3.isHidden = true
        print("Button3 Clicked")
    }
    
    func newCard(question: String, answer: String, choice1: String, choice2: String){
        let flashcard = Flashcard(q: question, a: answer, c1: choice1, c2: choice2)
        Question.text = flashcard.q
        Button1.setTitle(flashcard.a, for: .normal)
        Button2.setTitle(flashcard.c1, for: .normal)
        Button3.setTitle(flashcard.c2, for: .normal)
        Answer.text = flashcard.a
        flashcards.append(flashcard)
        currentIndex = flashcards.count - 1
        updateCurrAndPrev()
        savetoDisk()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let creationViewController = navigationController.topViewController as! creationViewController
        
        creationViewController.flashCardController = self
        Button3.isHidden = false
        Button2.isHidden = false
    }
    
    
    @IBAction func nextCardClicked(_ sender: Any) {
        currentIndex += 1
        updateLabels()
        updateCurrAndPrev()
        animateOut()
    }
    
    
    @IBAction func previousCardClicked(_ sender: Any) {
        currentIndex -= 1
        updateLabels()
        updateCurrAndPrev()
    }
    
    func updateCurrAndPrev(){
        if currentIndex == flashcards.count - 1{
            nextButton.isEnabled = false
        }else{
            nextButton.isEnabled = true
        }
        if currentIndex == 0{
            previousButton.isEnabled = false
        }else{
            previousButton.isEnabled = true
        }
    }
    
    func updateLabels(){
        let currentFlashcard = flashcards[currentIndex]
        Question.text = currentFlashcard.q
        Button1.setTitle(currentFlashcard.a, for: .normal)
        Button2.setTitle(currentFlashcard.c1, for: .normal)
        Button3.setTitle(currentFlashcard.c2, for: .normal)
        Answer.text = currentFlashcard.a
    }
    
    func savetoDisk(){
        let dictionaryArray = flashcards.map { (card) -> [String: String] in
            return ["question": card.q, "answer": card.a, "choice1": card.c1, "choice2": card.c2]
        }
        
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
    }
    
    
    func readDisk(){
            if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String:String]]{
                
                let savedCards = dictionaryArray.map { dictionary -> Flashcard in
                    return Flashcard(q: dictionary["question"]!, a: dictionary["answer"]!, c1: dictionary["choice1"]!, c2: dictionary["choice2"]!)
                }
                flashcards.append(contentsOf: savedCards)
            
            }
    
    }
}

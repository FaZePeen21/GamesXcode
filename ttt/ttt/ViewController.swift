//
//  ViewController.swift
//  ttt
//
//  Created by period8 on 4/7/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var labelFour: UILabel!
    @IBOutlet weak var labelFive: UILabel!
    @IBOutlet weak var labelSix: UILabel!
    @IBOutlet weak var labelSeven: UILabel!
    @IBOutlet weak var labelEight: UILabel!
    
    @IBOutlet weak var labelNine: UILabel!
    
    @IBOutlet weak var turnLabel: UILabel!
    
    @IBOutlet weak var myView: UIView!
    
    
    
    var allLabels: [UILabel] = []
   
    
    override func viewDidLoad() {
        turnLabel.text = "X"


        allLabels = [labelOne, labelTwo, labelThree, labelFour, labelFive, labelSix, labelSeven, labelEight, labelNine]
        
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
   
    @IBAction func tapGesture(_ sender: Any) {
        let selectedPoint = (sender as AnyObject).location(in: myView)
        for label in allLabels {
            if label.frame.contains(selectedPoint) {
                placeInToLabel(myLabel: label)
                    }
    
    }
    checkForWinner()
    

}
    func placeInToLabel(myLabel: UILabel) {
        if myLabel.text == "" {
            
            
            if turnLabel.text == "X" {
                
                myLabel.text = turnLabel.text
                turnLabel.text = "O"
            }
            else {
                myLabel.text = turnLabel.text
                turnLabel.text = "X"
            }
        }
    }
    func checkForWinner() {
        if labelOne.text == labelTwo.text && labelTwo.text == labelThree.text && labelOne.text != "" {
            alert()
        }
        if labelOne.text == labelFour.text && labelFour.text == labelSeven.text && labelOne.text != "" {
            alert()
        }
        if labelTwo.text == labelFive.text && labelFive.text == labelEight.text && labelTwo.text != "" {
            alert()
        }
        if labelThree.text == labelSix.text && labelSix.text == labelNine.text && labelThree.text != "" {
            alert()
        }
        if labelFour.text == labelFive.text && labelFive.text == labelSix.text && labelFour.text != "" {
            alert()
        }
        if labelSeven.text == labelEight.text && labelEight.text == labelNine.text && labelSeven.text != "" {
            alert()
        }
        if labelOne.text == labelFive.text && labelFive.text == labelNine.text && labelOne.text != "" {
            alert()
        }
        if labelThree.text == labelFive.text && labelFive.text == labelSeven.text && labelThree.text != "" {
            alert()
        }
        
        
        
        
    
        
}
    func alert() {
        let winningAlert = UIAlertController(title: "BIG W", message: "Good Stuff!!!", preferredStyle: .alert)
let newGameButton = UIAlertAction(title: "New Game?", style: .default) { (action) in

    self.reset()
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

winningAlert.addAction(newGameButton)

winningAlert.addAction(cancelButton)

        present(winningAlert, animated: true, completion: nil)
        
    }
    @IBAction func resetButton(_ sender: Any) {
        reset()
    }

     func reset() {

         for label in allLabels{
             label.text = ""
         }
    }
    


 

      

 

    }
    
    






//
//  PongViewController.swift
//  ttt
//
//  Created by period8 on 5/11/22.
//

import UIKit

class PongViewController: UIViewController, UICollisionBehaviorDelegate {
    
    
    
    
    
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let orientation = UIApplication.shared.statusBarOrientation

        var orientationValue = UIInterfaceOrientation.landscapeRight.rawValue

        if orientation == .landscapeLeft || orientation == .landscapeRight {
        orientationValue = orientation.rawValue

        }

        UIDevice.current.setValue(orientationValue, forKey: "orientation")


        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

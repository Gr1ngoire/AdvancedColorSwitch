//
//  ViewController.swift
//  HW7_Course2
//
//  Created by admin on 24.04.2021.
//

import UIKit

class ViewController: UIViewController, PassingTheColor {
    
    // color view outlet
    @IBOutlet var mainView: UIView!
    
    // Delegation method
    func execution(redPar: CGFloat, greenPar: CGFloat, bluePar: CGFloat, alphaPar: CGFloat) {
        mainView.backgroundColor = UIColor(red: redPar, green: greenPar, blue: bluePar, alpha: alphaPar)
    }
    
    // passing the color
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendColor" {
            let segueData = segue.destination as! SwitchColorController
            segueData.delegate = self
            segueData.viewColor = mainView.backgroundColor
        }
    }

}


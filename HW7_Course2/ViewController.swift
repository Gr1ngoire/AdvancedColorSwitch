//
//  ViewController.swift
//  HW7_Course2
//
//  Created by admin on 24.04.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "sendColor" else { return }
        let segueData = segue.destination as! SwitchColorController
        segueData.viewColor = mainView.backgroundColor
    }

}


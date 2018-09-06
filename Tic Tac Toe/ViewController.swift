//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Daniel Hipskind on 9/5/18.
//  Copyright © 2018 Daniel Hipskind. All rights reserved.
//
var numPlayers = 1;
import UIKit

class ViewController: UIViewController {
    //action for switching numPlayer
    @IBOutlet weak var numPlayer: UISegmentedControl!
    @IBAction func numPlayerSelector(_ sender: Any) {
        numPlayers = numPlayer.selectedSegmentIndex + 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


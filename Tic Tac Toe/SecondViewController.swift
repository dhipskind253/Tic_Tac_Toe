//
//  SecondViewController.swift
//  Tic Tac Toe
//
//  Created by Daniel Hipskind on 9/5/18.
//  Copyright © 2018 Daniel Hipskind. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    //player whose turn it is
    var activePlayer = 1;
    
    //action for when each player places a piece
    @IBAction func buttonPress(_ sender: AnyObject) {
        if (activePlayer == 1) {
            sender.setImage(UIImage(named: "o.png"),for:[])
            activePlayer = 2;
        }
        else {
            sender.setImage(UIImage(named: "x.png"),for:[])
            activePlayer = 1;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  SecondViewController.swift
//  Tic Tac Toe
//
//  Created by Daniel Hipskind on 9/5/18.
//  Copyright © 2018 Daniel Hipskind. All rights reserved.
//

import UIKit
//struct for locking the orientation of the app
struct AppUtility {
    
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
        
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.orientationLock = orientation
        }
    }
    
    /// OPTIONAL Added method to adjust lock and rotate to the desired orientation
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation:UIInterfaceOrientation) {
        
        self.lockOrientation(orientation)
        
        UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
    }
    
}

class SecondViewController: UIViewController {
    //variable to keep track of the board
    //0 for empty, 1 for x, and 2 for o
    var currBoard: [Int] = [0,0,0,0,0,0,0,0,0]
    
    //player whose turn it is
    var activePlayer = 1;
    
    //Label to display winner
    @IBOutlet weak var winLabel: UILabel!
    
    //action for when each player places a piece
        @IBAction func buttonPress(_ sender: AnyObject) {
            if (winLabel.text != " ") {
                activePlayer = 3
            }
            
            //Play against another person
            if (numPlayers == 1) {
                if (activePlayer == 1) {
                    sender.setImage(UIImage(named: "o.png"),for:[])
                    currBoard[sender.tag - 1] = 1
                    winLabel.text = winCheck(player: activePlayer)
                    activePlayer = 2;
                }
                else if (activePlayer == 2){
                    sender.setImage(UIImage(named: "x.png"),for:[])
                    currBoard[sender.tag - 1] = 2
                    winLabel.text = winCheck(player: activePlayer)

                    activePlayer = 1;
                }
            }
            //Play against AI
            else if (numPlayers == 2) {
                if (activePlayer == 1) {
                    sender.setImage(UIImage(named: "o.png"),for:[])
                    currBoard[sender.tag - 1] = 2
                    winLabel.text = winCheck(player: activePlayer)
                    activePlayer = 2
                    AImove()
                    winLabel.text = winCheck(player: activePlayer)

                }
            }
        }
    
    //resets board
    @IBAction func reset(_ sender: Any) {
        currBoard = [0,0,0,0,0,0,0,0,0]
        activePlayer = 1;
        winLabel.text = " "
        
        for i in 1..<10 {
            if let button = view.viewWithTag(i) as? UIButton {
                button.setImage(nil, for:[])
            }
        }
    }
    
    //checks if either player has won the game
    func winCheck(player: Int) -> String {
        if (currBoard[0] == player && currBoard[1] == player && currBoard[2] == player) || (currBoard[3] == player && currBoard[4] == player && currBoard[5] == player) || (currBoard[6] == player && currBoard[7] == player && currBoard[8] == player) || (currBoard[0] == player && currBoard[3] == player && currBoard[6] == player) || (currBoard[1] == player && currBoard[4] == player && currBoard[7] == player) || (currBoard[2] == player && currBoard[5] == player && currBoard[8] == player) || (currBoard[0] == player && currBoard[4] == player && currBoard[8] == player) || (currBoard[2] == player && currBoard[4] == player && currBoard[6] == player) {
            print(currBoard)
            return "Player \(player) won the game!!"
        }
        else {
            return " "
        }
    }
    
    //returns the index in the array where the AI wants to place a piece
    func AImove() {
        
        activePlayer = 1
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Locking this ViewController
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        AppUtility.lockOrientation(.portrait)
        // Or to rotate and lock
        // AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Don't forget to reset when view is being removed
        AppUtility.lockOrientation(.all)
    }
}

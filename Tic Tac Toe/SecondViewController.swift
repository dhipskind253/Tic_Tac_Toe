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
    //buttons for AI to set
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    
    //variable to keep track of the board
    //0 for empty, 1 for o, and 2 for x
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
            if (numPlayers == 2) {
                if (activePlayer == 1) {
                    sender.setImage(UIImage(named: "o.png"),for:[])
                    currBoard[sender.tag - 1] = 1
                    if winCheck(board: currBoard, player: activePlayer) == 1 {
                        winLabel.text = "Player \(activePlayer) won the game!!"
                    }
                    else if winCheck(board: currBoard, player: activePlayer) == 2 {
                        winLabel.text = "It's a Draw!!"
                    }
                    activePlayer = 2;
                }
                else if (activePlayer == 2){
                    sender.setImage(UIImage(named: "x.png"),for:[])
                    currBoard[sender.tag - 1] = 2
                    if winCheck(board: currBoard, player: activePlayer) == 1 {
                        winLabel.text = "Player \(activePlayer) won the game!!"
                    }
                    else if winCheck(board: currBoard, player: activePlayer) == 2 {
                        winLabel.text = "It's a Draw!!"
                    }

                    activePlayer = 1;
                }
            }
            //Play against AI
            else if (numPlayers == 1) {
                if (activePlayer == 1) {
                    sender.setImage(UIImage(named: "o.png"),for:[])
                    currBoard[sender.tag - 1] = 1
                    if winCheck(board: currBoard, player: activePlayer) == 1 {
                        winLabel.text = "Player \(activePlayer) won the game!!"
                    }
                    else if winCheck(board: currBoard, player: activePlayer) == 2 {
                        winLabel.text = "It's a Draw!!"
                    }
                    activePlayer = 2
                    let tempBoard = getTempBoard(board: currBoard)
                    let index = AImove(board: tempBoard)
                    switch index {
                    case 0: button0.setImage(UIImage(named: "x.png"), for:[])
                    case 1: button1.setImage(UIImage(named: "x.png"), for:[])
                    case 2: button3.setImage(UIImage(named: "x.png"), for:[])
                    case 3: button4.setImage(UIImage(named: "x.png"), for:[])
                    case 4: button5.setImage(UIImage(named: "x.png"), for:[])
                    case 5: button6.setImage(UIImage(named: "x.png"), for:[])
                    case 6: button7.setImage(UIImage(named: "x.png"), for:[])
                    case 7: button8.setImage(UIImage(named: "x.png"), for:[])
                    case 8: button9.setImage(UIImage(named: "x.png"), for:[])
                    default: button0.setImage(UIImage(named: "x.png"), for:[])
                    }
                    currBoard[index] = 2
                    if winCheck(board: currBoard, player: activePlayer) == 1 {
                        winLabel.text = "Player \(activePlayer) won the game!!"
                    }
                    else if winCheck(board: currBoard, player: activePlayer) == 2 {
                        winLabel.text = "It's a Draw!!"
                    }
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
    func winCheck(board: [Int], player: Int) -> Int {
        if (currBoard[0] == player && currBoard[1] == player && currBoard[2] == player) || (currBoard[3] == player && currBoard[4] == player && currBoard[5] == player) || (currBoard[6] == player && currBoard[7] == player && currBoard[8] == player) || (currBoard[0] == player && currBoard[3] == player && currBoard[6] == player) || (currBoard[1] == player && currBoard[4] == player && currBoard[7] == player) || (currBoard[2] == player && currBoard[5] == player && currBoard[8] == player) || (currBoard[0] == player && currBoard[4] == player && currBoard[8] == player) || (currBoard[2] == player && currBoard[4] == player && currBoard[6] == player) {
            print(currBoard)
            return 1
        }
        else if currBoard[0] != 0 && currBoard[1] != 0 && currBoard[2] != 0 && currBoard[3] != 0 && currBoard[4] != 0 && currBoard[5] != 0 && currBoard[6] != 0 && currBoard[7] != 0 && currBoard[8] != 0 {
            return 2
        }
        else {
            return 0
        }
    }
    
    func getTempBoard (board: [Int])->[Int]{
        let newBoard = currBoard
        return newBoard
    }
    
    func checkWinMove(board: [Int], player: Int, moveIndex: Int)->Bool {
        var tempBoard = getTempBoard(board: board)
        tempBoard[moveIndex] = player
        if winCheck(board: board, player: player) == 1 {
            return true
        }
        
        return false
    }
    
    func forkMove(board: [Int], player: Int, moveIndex: Int)->Bool {
        var tempBoard = getTempBoard(board: board)
        tempBoard[moveIndex] = player
        var winningMoves = 0
        for spot in tempBoard {
            if checkWinMove(board: tempBoard, player: player, moveIndex: spot) {
                winningMoves += 1
            }
        }
        if winningMoves >= 2 {
            return true
        }
        return false
    }
    
    //returns the index in the array where the AI wants to place a piece
    func AImove(board: [Int])->Int {
        // loop through available spots and check for instant win
        for (index, value) in currBoard.enumerated() {
            if value == 0 && checkWinMove(board: board, player: activePlayer, moveIndex: index) {
                activePlayer = 1
                return index
            }
        }
        //loop through and check for necesary blocks
        for (index, value) in currBoard.enumerated() {
            if value == 0 && checkWinMove(board: board, player: 1, moveIndex: index) {
                activePlayer = 1
                return index
            }
        }
        //loop through for forks
        for (index, value) in currBoard.enumerated() {
            if value == 0 && forkMove(board: board, player: activePlayer, moveIndex: index) {
                activePlayer = 1
                return index
            }
        }
        //loop through for opponent forks
        for (index, value) in currBoard.enumerated() {
            if value == 0 && forkMove(board: board, player: 1, moveIndex: index) {
                activePlayer = 1
                return index
            }
        }
        //then prioritize corners
        for (index, value) in currBoard.enumerated() {
            if index == 0 || index == 2 || index == 6 || index == 8 {
                if value == 0 {
                    activePlayer = 1
                    return index
                }
            }
        }
        //prioritze middle
        for (index, value) in currBoard.enumerated() {
            if index == 4 && value == 0 {
                activePlayer = 1
                return index
            }
        }
        //prioritize edges
        for (index, value) in currBoard.enumerated() {
            if index == 1 || index == 3 || index == 5 || index == 7 {
                if value == 0 {
                    activePlayer = 1
                    return index
                }
            }
        }
        activePlayer = 1
        return 0
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

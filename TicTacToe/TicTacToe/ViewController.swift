//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alan Sax on 10/29/18.
//  Copyright © 2018 Alan Sax. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var victoryLabel: UILabel!
    
    @IBOutlet weak var resetButton: UIButton!
    
    var moveCount = 0;
    
    var board = [
        "topLeft",
        "topMiddle",
        "topRight",
        "middleLeft",
        "middleMiddle",
        "middleRight",
        "bottomLeft",
        "bottomMiddle",
        "bottomRight"
    ]
    
    var activePiece = "x"
    
    var xMoves: [String] = []
    var oMoves: [String] = []
    
    @IBAction func pressButton(_ sender: Any) {
        
        let button = sender as! UIButton;
    
        let move = button.tag - 1
        
        if(button.currentImage == nil) {
            if activePiece == "o" {
                button.setImage(UIImage(named: "nought.png"), for: [])
                oMoves.append(board[move])
            } else {
                button.setImage(UIImage(named: "cross.png"), for: [])
                xMoves.append(board[move])
            }
        }
        
        
        activePiece == "x" ? checkForVictory(array: xMoves) : checkForVictory(array: oMoves)
        checkForTie()
        changeGamePiece()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func checkForTie(){
        if xMoves.count + oMoves.count == 9 {
            victoryLabel.text = "TIE"
            victoryLabel.isHidden = false
            resetButton.isHidden = false
            
            
            buttons.forEach { (button) in
                button.isEnabled = false
            }
            
        }
    }
    
    func checkForVictory(array: [String]){
        let topLeft = array.contains("topLeft")
        let topMiddle = array.contains("topMiddle")
        let topRight = array.contains("topRight")

        let middleLeft = array.contains("middleLeft")
        let middleMiddle = array.contains("middleMiddle")
        let middleRight = array.contains("middleRight")
        
        let bottomLeft = array.contains("bottomLeft")
        let bottomMiddle = array.contains("bottomMiddle")
        let bottomRight = array.contains("bottomRight")
        
        //conditions
        let topRowVictory = topLeft && topMiddle && topRight
        let middleVerticalRowVictory = topMiddle && middleMiddle && bottomMiddle
        let bottomRowVictory = bottomLeft && bottomMiddle && bottomRight
        
        let leftRowVictory = topLeft && middleLeft && bottomLeft
        let middleRowVictory = middleLeft && middleMiddle && middleRight
        let rightRowVictory = topRight && middleRight && bottomRight
        
        let diagonalLeftVictory = topLeft && middleMiddle && bottomRight
        let diagonalRightVictory = topRight && middleMiddle && bottomLeft
        
        let horizontalVictory = topRowVictory || middleVerticalRowVictory || bottomRowVictory
        let verticalVictory = leftRowVictory || middleRowVictory || rightRowVictory
        let diagonalVictory = diagonalLeftVictory || diagonalRightVictory
        
        if horizontalVictory || verticalVictory || diagonalVictory {
            handleVictory()
        }
        
    }
    
    func handleVictory() {
    
        buttons.forEach { (button) in
            button.isEnabled = false
        }
        
        victoryLabel.text = "Victory \(activePiece.uppercased())"
        victoryLabel.isHidden = false
        resetButton.isHidden = false

    }
    
    func resetView(){
        
        xMoves = []
        oMoves = []
        
        buttons.forEach { (button) in
            button.setImage(nil, for: [])
            button.isEnabled = true
        }
        victoryLabel.isHidden = true
        resetButton.isHidden = true
        
        activePiece = "x"
    }
    
    func changeGamePiece() {
        if activePiece == "x" {
            activePiece = "o"
        } else {
            activePiece = "x"
        }
    }
    
    @IBAction func clickReset(_ sender: Any) {
        resetView()
    }

}


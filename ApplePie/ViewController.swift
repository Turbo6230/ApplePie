//
//  ViewController.swift
//  ApplePie
//
//  Created by Angielina Rutledge on 12/3/20.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Instance Properties
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    var listOfWords = ["pinna", "eardrum", "cochlea", "nerves", "mallus", "incas","stapes"]
    let incorrectGuessesAllowed = 7
    var totalWins = 0 {
        didSet {
            newRound()
        
        }
    }
    
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    
    var currentGame: Game!
    
    //MARK: - View Instance Method
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    
    //MARK: - IB Actions
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGussed(letter: letter)
        //updateUI()
        updateGameState()
    }
    
    
    //MARK: - Game and Helper Methods
    func newRound () {
        if !listOfWords.isEmpty {
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectGuessesRemaining: incorrectGuessesAllowed, gussesdLetters: [])
        enableLetterButtons(true)
        updateUI()
        } else {
            enableLetterButtons(false)
        }
    }
    
    func updateUI() {
        var letters = [String]()
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        
        let wordWithSpacing = letters.joined(separator: " ")
        
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectGuessesRemaining)")
    }
    
    func updateGameState() {
        if currentGame.incorrectGuessesRemaining == 0 {
            totalLosses += 1
        } else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
        } else {
            updateUI()
        }
    }
    
    func enableLetterButtons (_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
}


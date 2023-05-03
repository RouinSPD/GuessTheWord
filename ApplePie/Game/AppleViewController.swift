//
//  AppleViewController.swift
//  ApplePie
//
//  Created by ios dev lab fi unam on 31/01/23.
//

import UIKit
class AppleViewController: UIViewController {
    
    //Inital variables
    var topic : String = ""
    var listOfWords : [String] = []
    let incorrectMovesAllowed = 7
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
    
    
    
    //MARK: Outlets
    @IBOutlet weak var treeImageView: UIImageView!
    
    @IBOutlet weak var correctWordLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    @IBOutlet var letterButtons: [UIButton]!
    
    @IBOutlet weak var topicLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        chooseTopic()
        newRound()
    }
    
    func setUpUI(){
        self.navigationItem.hidesBackButton = true
        topicLabel.text = topic.uppercased()
    }
    
    //receive the topic from the home screen to get the array of words
    func chooseTopic(){
        switch topic{
            case "colors" :
                listOfWords = ["blue", "red", "green", "yellow", "black", "orange"]
            case "countries" :
                listOfWords = ["mexico", "spain", "canada", "japan", "finland", "germany"]
            case "animals" :
            listOfWords = ["rabbit", "lion", "bear", "zebra", "elephant", "donkey"]
            case "sports" :
            listOfWords = ["soccer", "basketball", "tennis", "golf", "boxing", "volleyball"]
            default:
                print("no topic")
        }
    }
    
    func newRound(){
       
        //if there are words left on the array, get a new word, set moves to cero and update de UI
        if !listOfWords.isEmpty{
            let newWord = listOfWords.removeFirst()
            //print(newWord)
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        } else {
            //if there are no more words the game is over and go to the final screen passing the total wins and total losses
            let endStoryBoard = UIStoryboard(name: "EndStoryboard", bundle: .main)
            if let endViewController = endStoryBoard.instantiateViewController(withIdentifier: "EndVC") as? EndViewController {
                endViewController.totalWins = totalWins
                endViewController.totalLosses = totalLosses
                self.navigationController?.pushViewController(endViewController, animated: true)
            }
            
            
        }
    }
    
    
    //update all the UI including the image, the score label and the word label
    func updateUI(){
        var letters = [String]()
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
            //print(letters)
        }
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    
    //MARK: Actions
    
    // get the letter that has been selected
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.titleLabel!.text!
        //print(letterString)
        let letter = Character(letterString.lowercased())
        //print(letter)
        currentGame.playerGuessed(letter: letter)
        //print(currentGame.guessedLetters, currentGame.incorrectMovesRemaining)
        updateGameState()
        
    }
    
    //update the total wins and total losses
    func updateGameState(){
        if currentGame.incorrectMovesRemaining == 0{
            totalLosses += 1
        } else if currentGame.word == currentGame.formattedWord{
            totalWins += 1
        }else{
            updateUI()
        }
    }
    
    //enable buttons of letters in the keyboard
    func enableLetterButtons(_ enable: Bool){
        for button in letterButtons{
            button.isEnabled = enable
        }
    }
    
}

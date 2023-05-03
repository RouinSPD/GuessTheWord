//
//  EndViewController.swift
//  ApplePie
//
//  Created by Pedro Rouin on 01/05/23.
//

import UIKit

class EndViewController: UIViewController {
    @IBOutlet weak var gameOverImageView: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var restartButton: UIButton!
    
    //Declare initial variables
    var totalWins : Int = 0
    var totalLosses : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        
    }
    
    //setup the UI for the last screen
    func setUpUI(){
        self.navigationItem.hidesBackButton = true
        gameOverImageView.image = UIImage(named: "gameOver")
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
    }
    
    //dismiss all the way back to the home screen
    @IBAction func restartButtonPressed(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: false)
    }
}

//
//  HomeViewController.swift
//  ApplePie
//
//  Created by Pedro Rouin on 01/05/23.
//

import UIKit
import Foundation

class HomeViewController: UIViewController {
    
    //Buttons for the game topics
    @IBOutlet weak var countriesButton: UIButton!
    
    @IBOutlet weak var colorsButton : UIButton!
    
    @IBOutlet weak var animalsButton: UIButton!
    @IBOutlet weak var sportsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
    
    func setupUI(){
        colorsButton.layer.cornerRadius = 30
        countriesButton.layer.cornerRadius = 1000
        
    }

    
    //Actions for the buttons to move to the game with modal presentation and passing the topic for the next screen
    
    
    @IBAction func colorsButtonPressed(_ sender: Any) {
        presentGame(topic: "colors")
    }
    
    @IBAction func countriesButtonPressed(_ sender: Any) {
        presentGame(topic: "countries")
    }
    
    @IBAction func animalsButtonPressed(_ sender: Any) {
        presentGame(topic: "animals")
    }
    
    @IBAction func sportsButtonPressed(_ sender: Any) {
        presentGame(topic: "sports")
    }
    
    // method to create a screen with the corresponding topic
    func presentGame(topic : String){
        let gameStoryBoard = UIStoryboard(name: "Main", bundle: .main)
        if let gameViewController = gameStoryBoard.instantiateViewController(withIdentifier: "GameVC") as? AppleViewController {
            gameViewController.topic = topic
            self.navigationController?.pushViewController(gameViewController, animated: true)
            }
    }
    
}

//
//  ViewController.swift
//  Silly Song
//
//  Created by Lam Phu Nguyen on 12/11/16.
//  Copyright © 2016 Lam Phu Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(_ sender: AnyObject) {
        self.nameField.text = ""
        self.lyricsView.text = ""
    }

    @IBAction func displayLyrics(_ sender: AnyObject) {
        if (self.nameField.text != "") {
            self.lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: self.nameField.text!)
        }
    }
}

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

func shortNameForName(_ name: String) -> String {
    let lowercaseName = name.lowercased()
    let vowelSet = CharacterSet(charactersIn: "aeiou")
    
    if let firstVowel = lowercaseName.rangeOfCharacter(from: vowelSet) {
        return lowercaseName.substring(from: firstVowel.lowerBound)
    }
    
    return lowercaseName
}

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    let shortName = shortNameForName(fullName)
    let lyrics = lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName)
                                .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    
    return lyrics
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}




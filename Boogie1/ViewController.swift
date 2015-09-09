//
//  ViewController.swift
//  Boogie1
//
//  Created by Arvind Subramanian on 6/14/15.
//  Copyright (c) 2015 iOS Boogie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let filePath = NSBundle.mainBundle().pathForResource("small", ofType: "txt"), contents = NSString(contentsOfFile: filePath, encoding: NSUTF8StringEncoding, error: nil) {
            findTheDuplicates(contents as String)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    function that counts
    how often each word appears in the text and prints:
    word1 count1
    word2 count2
    ...
    
    Print the above list in order sorted by word (swift will sort punctuation to
    come before letters -- that's fine). Store all the words as lowercase,
    so 'The' and 'the' count as the same word.
    */
    
    
    func findTheDuplicates(fileContents: String) {
        // convert string to lowercase
        // create array of words by splitting string on space or newline
        var wordArr = split(fileContents.lowercaseString) {$0 == " " || $0 == "\n"}
        
        // create empty dictionary
        var wordDic = Dictionary<String, Int>()

        for word in wordArr {
            // append word to dictionary if key does not exist and give value of 1
            if (wordDic[word] == nil) {
               wordDic[word] = 1
            } else {
                // add 1 to the value if key exists
                wordDic[word] = wordDic[word]! + 1
            }
        }
        
        // sort the words alphabetically in dictionary
        let sortedWordDic = sorted(wordDic) { $0.0 < $1.0 }
        
        // iterate through dictionary and print the count for each word
        for (word, count) in sortedWordDic {
            println("\(word): \(count)")
            
        }
    }
    
}


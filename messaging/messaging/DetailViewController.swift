//
//  DetailViewController.swift
//  messaging
//
//  Created by Royal, Cindy L on 4/19/20.
//  Copyright © 2020 Royal, Cindy L. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var msg: UITextView!
    @IBOutlet weak var post: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //selects post text from array based on selection passed from previous controller
               msg.text = postData[selection]["msg"]
               //selects story text from array based on selection
               post.text = postData[selection]["post"]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  ViewController.swift
//  messaging
//
//  Created by Royal, Cindy L on 4/19/20.
//  Copyright © 2020 Royal, Cindy L. All rights reserved.
//

import UIKit
import FirebaseFirestore
var selection:Int = 0
var postData = [[String: String]]()
//var postData = [["msg":"Message 1", "post": "Post 1"],["msg": "Message 2", "post": "Post 2"]]

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
  

    @IBOutlet weak var msgView: UITextView!
    
   
    
    
    
    @IBOutlet weak var postView: UITextView!
    @IBOutlet weak var tableView: UITableView!
    
         var db = Firestore.firestore()
    
    @IBAction func addPost(_ sender: Any) {
        var msg = msgView.text
        var post = postView.text
        
        db.collection("messages").addDocument(data: [
           "msg": msg,
        "post": post])
        
        //adds to array to immediately update
        postData.append(["msg": msg!, "post": post!])
        //reloads the tableView to show current data
        self.tableView.reloadData()
        msgView.resignFirstResponder()
        // removes the text from the TextView
        msgView.text = ""
        postView.text = ""
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")
        cell?.textLabel?.text = (postData[indexPath.row]["msg"] as! String)
        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            selection = indexPath.row
            performSegue(withIdentifier: "TheSegue", sender: self)
        }


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        // this reads the posts from the database, checking to be sure they exist before execuing a loop
        // the loop appends the data to the newsItems array we initialized above.
        
        db.collection("messages").getDocuments { (snapshot, error) in
            if error == nil && snapshot != nil {
                for document in snapshot!.documents {
                    var documentData = document.data()
                 postData.append(documentData as! [String : String])
                }
                self.tableView.reloadData()
            }
        }
 
    }


}


//
//  ViewController.swift
//  login2
//
//  Created by Guest1 on 30/07/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var forgetUsername: UIButton!
    
    @IBOutlet weak var forgetPassword: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        guard let sender = sender as? UIButton else {return}
        if sender == forgetPassword {
            segue.destination.navigationItem.title = "Forget Password"
            
        }
        else if sender == forgetUsername {
            segue.destination.navigationItem.title = "Forget username"
        }
        else{
            segue.destination.navigationItem.title = username.text
        }
        
    }


    
    @IBAction func username(_ sender: Any) {
        performSegue(withIdentifier: "forget",sender: sender)
    }
    @IBAction func password(_ sender: Any) {
        performSegue(withIdentifier: "forget",sender: sender)
    }
    
    
    
}


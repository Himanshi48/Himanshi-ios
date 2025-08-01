//
//  MiddleViewController.swift
//  Order-of-event
//
//  Created by Guest1 on 01/08/25.
//

import UIKit

class MiddleViewController: UIViewController {

    @IBOutlet weak var middleLabel: UILabel!
    
    
    
    var eventNumber = 1
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func addEvent (from: String) {

    if let existingText = middleLabel.text {

        middleLabel.text = "\(existingText) \nEvent number \(eventNumber) was \(from) "

    eventNumber += 1
    }
        
        func viewDidLoad() {
            super.viewDidLoad()
            addEvent(from: "viewDidLoad")
        }

        func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            addEvent(from: "viewWillAppear")
        }

        func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            addEvent(from: "viewDidAppear")
        }

        func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            addEvent(from: "viewWillDisappear")
        }

        func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            addEvent(from: "viewDidDisappear")
        }


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

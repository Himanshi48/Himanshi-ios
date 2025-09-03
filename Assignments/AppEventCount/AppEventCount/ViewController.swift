//
//  ViewController.swift
//  AppEventCount
//
//  Created by Himanshi Godara on 03/09/25.
//

import UIKit

class ViewController: UIViewController {

 
    @IBOutlet weak var didFinishLaunchingLabel: UILabel!
    
    
    @IBOutlet weak var configurationForConnectingLabel: UILabel!
    
    @IBOutlet weak var willConnectLabel: UILabel!
    
    @IBOutlet weak var didBecomeActiveLabel: UILabel!
    
    
    
    @IBOutlet weak var didEnterBackgroundLabel: UILabel!
    
    @IBOutlet weak var willResignActiveLabel: UILabel!
    
    
    @IBOutlet weak var willEnterForegroundLabel: UILabel!
    
    
    
    
    
    
    
    
    
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate

    var willConnectCount = 0
    var didBecomeActiveCount = 0
    var willResignActiveCount = 0
    var willEnterForegroundCount = 0
    var didEnterBackgroundCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }

    func updateView() {
        didFinishLaunchingLabel.text = "didFinishLaunching: \(appDelegate.launchCount)"
        configurationForConnectingLabel.text = "configurationForConnecting: \(appDelegate.configurationForConnectingCount)"
        willConnectLabel.text = "willConnect: \(willConnectCount)"
        didBecomeActiveLabel.text = "didBecomeActive: \(didBecomeActiveCount)"
        willResignActiveLabel.text = "willResignActive: \(willResignActiveCount)"
        willEnterForegroundLabel.text = "willEnterForeground: \(willEnterForegroundCount)"
        didEnterBackgroundLabel.text = "didEnterBackground: \(didEnterBackgroundCount)"
    }
}


//
//  ViewController.swift
//  JBMedical2.0
//
//  Created by James Paulk on 4/27/17.
//  Copyright © 2017 James Paulk. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UIPopoverPresentationControllerDelegate
{
    @IBOutlet weak var jbInfoLabel: UILabel!
    @IBOutlet var userView: UIView!
    
    @IBAction func userViewCloseButtonPressed()
    {
        UIView.animate(withDuration: 0.58) {
            self.userView.alpha = 0.0
        }
    }

    @IBAction func userButtonPressed()
    {
        self.userView.alpha = 0.0
        print("user button pressed")
        UIView.animate(withDuration: 0.58) {
            self.view.addSubview(self.userView)
            self.userView.isHidden = false
            self.userView.bounds = self.view.bounds
            self.userView.alpha = 1.0
        }
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        jbInfoLabel.text = isStoreOpen()
        userView.frame.size = UIScreen.main.bounds.size
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "toMapVC"
        {
            guard let vc = segue.destination as? MapViewController else { return }
            guard let ppc = vc.popoverPresentationController else { return }
            ppc.delegate = self 
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle
    {
        return .none
    }
    
    private func isStoreOpen() -> String
    {
        var open = ""
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)

        let components = (calendar as NSCalendar).components(.weekday, from: Date())
        let weekday = components.weekday
        let calTime: DateComponents! = (calendar as NSCalendar?)?.components(.hour, from: Date())
        if weekday == 2 || weekday == 3 || weekday == 4 || weekday == 5 || weekday == 6
        {
            if calTime.hour! >= 9 && calTime.hour! <= 17
            {
                open = "Open until 5pm"
            }
            else
            {
                open = "Closed Now"
            }
        }
        else
        {
            open = "Closed Today"
        }
        return open
    }
}

extension UIButton
{
    
    open override var isHighlighted: Bool
    {
        didSet
        {
            if self.tag == 1
            {
                let colorFor = UIColor(colorLiteralRed: 257, green: 154, blue: 112, alpha: 1.0)
                backgroundColor = isHighlighted ? colorFor : UIColor.clear
            }
        }
    }
}


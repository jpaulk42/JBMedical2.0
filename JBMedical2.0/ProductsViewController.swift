//
//  ProductsViewController.swift
//  JBMedical2.0
//
//  Created by James Paulk on 4/28/17.
//  Copyright © 2017 James Paulk. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "toRequestVC"
        {
            for item in Products.items
            {
                if item.isNeeded
                {
                    Products.userSelectedItems.append(item)
                }
            }
        }
    }
}

class ProductsTableViewController: UITableViewController
{
    @IBOutlet weak var headgearButton: ProductButton!
    @IBOutlet weak var maskButton: ProductButton!
    @IBOutlet weak var pillowsButton: ProductButton!
    @IBOutlet weak var cushionsButton: ProductButton!
    @IBOutlet weak var tubingButton: ProductButton!
    @IBOutlet weak var chinstrapButton: ProductButton!
    @IBOutlet weak var ndfilterButton: ProductButton!
    @IBOutlet weak var dispFilterButton: ProductButton!
    @IBOutlet weak var o2lineButton: ProductButton!
    @IBOutlet weak var waterChamberButton: ProductButton!
    
    @IBAction func allSuppliesEligibleSelected()
    {
        print("all supplies eligible selected ()")
    }
    
    @IBAction func productSelected(_ sender: ProductButton)
    {
        sender.select()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        Products.items = [headgearButton, maskButton, pillowsButton, cushionsButton, tubingButton, chinstrapButton, ndfilterButton, dispFilterButton, o2lineButton, waterChamberButton]
    }
}

public struct Products
{
    static var items: [ProductButton] = []
    static var userSelectedItems: [ProductButton] = []
}

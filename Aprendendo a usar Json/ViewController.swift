//
//  ViewController.swift
//  Aprendendo a usar Json
//
//  Created by Letícia Santos on 10/6/19.
//  Copyright © 2019 devlet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let url = URL(string: "http://api.fixer.io/latest")
    let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
    
        if error != nil {
            print("ERRO")
        } else {
        
            if let content = data{
                
                do{
                
                    let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)
                    
                    if let rates = myJson["rates"] as? NSDictionary {
                        
                        if let currency = rates ["GBP"] {
                            
                            print (currency)
                        }
                    
                   }
            }
        }
        
       task.resume()
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


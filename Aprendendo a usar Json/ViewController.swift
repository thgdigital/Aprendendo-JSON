//
//  ViewController.swift
//  Aprendendo a usar Json
//
//  Created by Letícia Santos on 10/6/19.
//  Copyright © 2019 devlet. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let url = URL(string: "http://api.fixer.io/latest")
   
    func fetch() {
        
         Alamofire.request(url).responseJSON { response in
            switch response.result {
            
            case .success:
                
                let myJson = try! JSONSerialization.jsonObject(with: response.data!, options: JSONSerialization.ReadingOptions.mutableContainers)  as? [String: Any]
                print(myJson)
//                if let rates = myJson?["rates"] as? [String: Any] {
//
//                    if let currency = rates ["GBP"] {
//
//                        print (currency)
//                    }
//                }
            case .failure(let error):
                print(error)
            }
         }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fetch()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


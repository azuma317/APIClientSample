//
//  ViewController.swift
//  APIClientSample
//
//  Created by Azuma on 2018/05/08.
//  Copyright © 2018年 Azuma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIClient.apiResult { (result) in
            switch result {
            case .success(let json):
                print("success")
                print(json)
            case .failure(let error):
                print("failure")
                print(error)
            }
        }
        
    }
}


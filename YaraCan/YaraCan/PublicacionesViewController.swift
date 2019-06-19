//
//  PublicacionesViewController.swift
//  YaraCan
//
//  Created by MAC17 on 18/06/19.
//  Copyright © 2019 Fernando Huarcaya Torres. All rights reserved.
//

import UIKit

class PublicacionesViewController: UIViewController {
    struct Response: Codable { // or Decodable
        let count: String
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(">>>>>>>>>>>>>>>><gaaaa")
        if let url = URL(string: "api-env.mwtpjjfsp2.us-west-2.elasticbeanstalk.com/api/pet") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let res = try JSONDecoder().decode(Response.self, from: data)
                        print(res.count)
                    } catch let error {
                        print(error)
                    }
                }
                }.resume()
        }
        // Do any additional setup after loading the view.
    }
    

}

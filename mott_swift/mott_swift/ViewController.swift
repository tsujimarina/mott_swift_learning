//
//  ViewController.swift
//  mott_swift
//
//  Created by 辻麻梨菜 on 2018/03/25.
//  Copyright © 2018年 辻麻梨菜. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var uiImageView1: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let uiImage1 = UIImage(named:"kronosくん1.png")
        uiImageView1.image = uiImage1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ViewController02.swift
//  mott_swift
//
//  Created by 辻麻梨菜 on 2018/03/25.
//  Copyright © 2018年 辻麻梨菜. All rights reserved.
//

import UIKit

class ViewController02: UIViewController {

    @IBOutlet weak var uiImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let uiImage2 = UIImage(named:"kronosくん2")
        uiImageView2.image = uiImage2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

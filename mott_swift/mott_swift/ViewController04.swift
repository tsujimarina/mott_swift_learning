//
//  ViewController04.swift
//  mott_swift
//
//  Created by 辻麻梨菜 on 2018/03/25.
//  Copyright © 2018年 辻麻梨菜. All rights reserved.
//

import UIKit

class ViewController04: UIViewController {

    @IBOutlet weak var uiImageView4: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let uiImage4 = UIImage(named:"kronosくん4")
        uiImageView4.image = uiImage4
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

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
  private var imageName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      uiImageView2.image = UIImage(named:"kronosくん2")
      guard let imageName = imageName else {
        return
      }

      uiImageView2.image = UIImage(named: imageName)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  ///
  ///
  /// Parameter -
  ///    imageName: 画像名
  func setImageName(_ imageName: String) {
    self.imageName = imageName
    if let _ = uiImageView2 {
      uiImageView2.image = UIImage(named: imageName)
    }
  }
}

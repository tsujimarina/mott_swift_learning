//
//  PageViewController.swift
//  mott_swift
//
//  Created by 辻麻梨菜 on 2018/03/25.
//  Copyright © 2018年 辻麻梨菜. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
  var viewControllerIndex : Int = 0
  let imageNames: [String] = ["kronosくん1", "kronosくん2", "kronosくん3", "kronosくん4"]
  var targetViewControllers : [UIViewController] = []

    override func viewDidLoad() {
      super.viewDidLoad()

      // 表示用ViewControllerを生成し、画像を設定する
      for i in 0..<imageNames.count {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "vc02") as! ViewController02

        // 画像名をセットしておく
        viewController.setImageName(imageNames[i])
        targetViewControllers.append(viewController)
      }

        // Do any additional setup after loading the view.
        self.setViewControllers([targetViewControllers[0]], direction: .forward, animated: true, completion: nil)
      // StoryBoard上で設定も可能
        self.dataSource = self

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - UIPageViewControllerDataSource
extension PageViewController : UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {

        if viewControllerIndex == targetViewControllers.count - 1 {
            return nil
        } else {
            viewControllerIndex = viewControllerIndex + 1
        }

        return targetViewControllers[viewControllerIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        if viewControllerIndex == 0 {
            return nil
        } else {
            viewControllerIndex = viewControllerIndex - 1
        }

        return targetViewControllers[viewControllerIndex]
    }

}



//
//  PageViewController.swift
//  mott_swift
//
//  Created by 辻麻梨菜 on 2018/03/25.
//  Copyright © 2018年 辻麻梨菜. All rights reserved.
//

import UIKit

class OnishiPageViewController: UIPageViewController {
  let count: Int =  10 // 1 << (6 * 3)
  var red: [Int] = []
  var green: [Int] = []
  var blue: [Int] = []
  var rgba: [UIColor] = []
  var lastPage: Int = 0

  var eachViewControllers: [ViewController] = []

  override func viewDidLoad() {
    super.viewDidLoad()

      for i in 0..<count {
        red.append(Int(arc4random_uniform(256)))
        green.append(Int(arc4random_uniform(256)))
        blue.append(Int(arc4random_uniform(256)))
        rgba.append(UIColor(red: CGFloat(red[i]) / 255.0, green: CGFloat(green[i]) / 255.0, blue: CGFloat(blue[i]) / 255.0, alpha: CGFloat(1.0)))
      }
      for i in 0..<3 {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "vc01") as! ViewController

        viewController.setIndexTo(i)
        eachViewControllers.append(viewController)
      }

      // StoryBoard上で設定も可能
      self.dataSource = self

      eachViewControllers[0].setBackgroundRgba(rgba[0])
      eachViewControllers[0].loadViewData()
      setViewControllers([eachViewControllers[0]], direction: .forward, animated: true, completion: nil)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}


// MARK: - UIPageViewControllerDataSource
extension OnishiPageViewController : UIPageViewControllerDataSource {

  func pageViewController(_ pageViewController:
    UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    let vc = viewController as! ViewController
    let currentPage = vc.index
    if currentPage+1 == rgba.count {
      return nil
    }
    return nextPage(viewController, moveTo:1)
  }

  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController:UIViewController) -> UIViewController? {
    let vc = viewController as! ViewController
    let currentPage = vc.index
    if currentPage == 0 {
      return nil
    }
    return nextPage(viewController, moveTo:-1)
  }

  func nextPage(_ viewController: UIViewController, moveTo:Int) -> ViewController {
    let vc = viewController as! ViewController
    let currentPage = vc.index
    // インデックスをセットする
    let index = (currentPage + moveTo) % count

    // 前後のページの値をセットする
    let nextPage = (currentPage + 1) % 3
    let prevPage = (currentPage + 2) % 3

    // デバッグ
    print("index: \(index), lastPage: \(lastPage) , page: >> [\(prevPage) -> \(currentPage) -> \(nextPage)]")

    if moveTo > 0 {
      lastPage = nextPage
    } else {
      lastPage = prevPage
    }

    eachViewControllers[lastPage].setBackgroundRgba(rgba[index])
    eachViewControllers[lastPage].setIndexTo(index)

    eachViewControllers[lastPage].loadViewData()
    return eachViewControllers[lastPage]
  }

}

// MARK: - UIPageViewControllerDelegate
extension OnishiPageViewController: UIPageViewControllerDelegate {
  func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {

  }
}



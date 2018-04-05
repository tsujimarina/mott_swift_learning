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

  public var index: Int = 0
  public var color: String = ""
  @IBOutlet weak var colorName: UILabel!
  @IBOutlet weak var pageNum: UILabel!


  override func viewDidLoad() {
        super.viewDidLoad()
        let uiImage1 = UIImage(named:"kronosくん1.png")
        uiImageView1.image = uiImage1
    self.pageNum.text = "\(index+1)ページ"
    if let color = self.view.backgroundColor {
      self.colorName.text = color.rgbString
    }
  }

  override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
  }

  public func setImage(_ name: String) {
    uiImageView1.image = UIImage(named: name)
  }

  public func setIndexTo(_ index:Int) {
    self.index = index
  }

  func setBackgroundRgba(_ color: UIColor) {
    self.view.backgroundColor = color
  }

  func loadViewData() {
    if let _ = self.pageNum  {
      self.pageNum.text = "\(index+1)ページ"
    }
    if let _ = self.colorName {
      self.colorName.text = self.view.backgroundColor!.rgbString
    }

  }
}
extension UIColor {

  var floatValues: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
    var r:CGFloat = -1, g:CGFloat = -1, b:CGFloat = -1, a:CGFloat = -1
    self.getRed(&r, green: &g, blue: &b, alpha: &a)
    return (r, g, b, a)
  }

  var intValues: (red: Int, green: Int, blue: Int, alpha: Int) {
    let f = self.floatValues
    return (
      UIColor.intByCGFloat(f.red),
      UIColor.intByCGFloat(f.green),
      UIColor.intByCGFloat(f.blue),
      UIColor.intByCGFloat(f.alpha)
    )
  }
}

extension UIColor {

  private static let maxHex = 0xFFFFFFFF
  private static let minHex = 0x0

  private static let prefix = "#"

  private class func substring(_ string: String, location: Int, length: Int? = nil) -> String {
    let strlen = string.characters.count
    var len = length ?? strlen
    if location + len > strlen {
      len = strlen - location
    }
    return (string as NSString).substring(with: NSMakeRange(location, len))
  }

  private class func intByCGFloat(_ v: CGFloat) -> Int {
    return Int(round(v * 255.0))
  }

  private class func hexStringByCGFloat(_ v: CGFloat) -> String {
    let n = self.intByCGFloat(v)
    return NSString(format: "%02X", n) as String
  }
}

extension UIColor {

  convenience init(rgb: Int) {
    let r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
    let g = CGFloat((rgb & 0x00FF00) >>  8) / 255.0
    let b = CGFloat( rgb & 0x0000FF       ) / 255.0
    self.init(red: r, green: g, blue: b, alpha: 1.0)
  }

  var rgb: Int {
    let i = self.intValues
    return (i.red * 0x010000) + (i.green * 0x000100) + i.blue
  }

  var rgbString: String {
    var r:CGFloat = -1, g:CGFloat = -1, b:CGFloat = -1, a:CGFloat = -1
    self.getRed(&r, green: &g, blue: &b, alpha: &a)

    var ret = ""
    ret += UIColor.hexStringByCGFloat(r)
    ret += UIColor.hexStringByCGFloat(g)
    ret += UIColor.hexStringByCGFloat(b)
    return ret
  }
}

extension UIColor {

  convenience init(rgba: Int) {
    let r = CGFloat((rgba & 0xFF000000) >> 24) / 255.0
    let g = CGFloat((rgba & 0x00FF0000) >> 16) / 255.0
    let b = CGFloat((rgba & 0x0000FF00) >>  8) / 255.0
    let a = CGFloat( rgba & 0x000000FF       ) / 255.0
    self.init(red: r, green: g, blue: b, alpha: a)
  }

  var rgba: Int {
    let i = self.intValues
    return (i.red * 0x01000000) + (i.green * 0x00010000) + (i.blue *  0x00000100) + i.alpha
  }

  var rgbaString: String {
    var r:CGFloat = -1, g:CGFloat = -1, b:CGFloat = -1, a:CGFloat = -1
    self.getRed(&r, green: &g, blue: &b, alpha: &a)

    var ret = ""
    ret += UIColor.hexStringByCGFloat(r)
    ret += UIColor.hexStringByCGFloat(g)
    ret += UIColor.hexStringByCGFloat(b)
    ret += UIColor.hexStringByCGFloat(a)
    return ret
  }
}

extension UIColor {

  convenience init(colorCode: String) {
    self.init(rgba: UIColor.colorCodeToHex(colorCode))
  }

  class func colorCodeToHex(_ colorCode: String) -> Int {
    var colorCode = colorCode
    if colorCode.hasPrefix(self.prefix) {
      colorCode = self.substring(colorCode, location: 1)
    }

    switch colorCode.characters.count {
    case 8: // e.g. 35D24CFF
      break
    case 6: // e.g. 35D24C
      colorCode += "FF"
    case 4: // e.g. 35DF
      let r = self.substring(colorCode, location:0, length: 1)
      let g = self.substring(colorCode, location:1, length: 1)
      let b = self.substring(colorCode, location:2, length: 1)
      let a = self.substring(colorCode, location:3, length: 1)
      colorCode = "\(r)\(r)\(g)\(g)\(b)\(b)\(a)\(a)"
    case 3: // e.g. 35D
      let r = self.substring(colorCode, location:0, length: 1)
      let g = self.substring(colorCode, location:1, length: 1)
      let b = self.substring(colorCode, location:2, length: 1)
      colorCode = "\(r)\(r)\(g)\(g)\(b)\(b)FF"
    default: return self.minHex
    }

    if (colorCode as NSString).range(of: "^[a-fA-F0-9]+$", options: .regularExpression).location == NSNotFound {
      return self.minHex
    }

    var ret: UInt32 = 0
    Scanner(string: colorCode).scanHexInt32(&ret)
    return Int(ret)
  }

  class func hexToColorCode(hex: Int, withPrefix prefix: Bool = true) -> String {
    var hex = hex
    if hex > self.maxHex {
      hex = self.maxHex
    }

    let r = CGFloat((hex & 0xFF000000) >> 24) / 255.0
    let g = CGFloat((hex & 0x00FF0000) >> 16) / 255.0
    let b = CGFloat((hex & 0x0000FF00) >>  8) / 255.0
    let a = CGFloat( hex & 0x000000FF       ) / 255.0

    var ret = ""
    ret += self.hexStringByCGFloat(r)
    ret += self.hexStringByCGFloat(g)
    ret += self.hexStringByCGFloat(b)
    ret += self.hexStringByCGFloat(a)
    if prefix {
      ret = self.prefix + ret
    }
    return ret
  }
}

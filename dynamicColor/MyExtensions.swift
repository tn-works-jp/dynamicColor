import UIKit

extension UIColor {
    
    // ダークモード対応のためダイナミックカラーを返す
    private class func dynamicColor(light: UIColor, dark: UIColor) -> UIColor {
        if #available(iOS 13, *) {
            return UIColor { (traitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .dark {
                    return dark
                } else {
                    return light
                }
            }
        }
        return light
    }
    
    // カラーを定義する
    public static var viewBackground: UIColor {
        return dynamicColor(
            light: UIColor.hex("#ffffff", alpha: 1),
            //dark:  UIColor.hex("#000000", alpha: 1)
            dark:  UIColor.rgb(r: 0, g: 0, b: 0, alpha: 1.0)
        )
    }
    

    // 16進数で色を指定出来るように
    private class func hex (_ hexStr : String, alpha : CGFloat) -> UIColor {
        var hexStr = hexStr
        hexStr = hexStr.replacingOccurrences(of: "#", with: "")

        if hexStr.count == 3 {
            var newHexStr = ""
            for c in hexStr {
                newHexStr += "\(c)\(c)"
            }
            hexStr = newHexStr
        }

        let scanner = Scanner(string: hexStr as String)
        var color: UInt64 = 0
        if scanner.scanHexInt64(&color) {
            let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
            let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
            let b = CGFloat(color & 0x0000FF) / 255.0
            return UIColor(red:r,green:g,blue:b,alpha:alpha)
        } else {
            return UIColor.white
        }
    }

    // RGBで色を指定出来るように
    private class func rgb(r: Int, g: Int, b: Int, alpha: CGFloat) -> UIColor{
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
    
} //extension UIColor


// ダークモード判定
extension UITraitCollection {

    public static var isDarkMode: Bool {
        if #available(iOS 13, *), current.userInterfaceStyle == .dark {
            return true
        }
        return false
    }
}








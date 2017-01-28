//
//  Extensions.swift
//  EdBinx
//
//  Created by Tushar Sharma on 09/08/16.
//  Copyright © 2016 edbinx. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(hex: String) {
        self.init(hex: hex, alpha:1)
    }
    
    convenience init(hex: String, alpha: CGFloat) {
        var hexWithoutSymbol:String = hex
        if hexWithoutSymbol.hasPrefix("#") {
            hexWithoutSymbol.remove(at: hexWithoutSymbol.startIndex)
        }
        
        let scanner = Scanner(string: hexWithoutSymbol)
        var hexInt:UInt32 = 0x0
        scanner.scanHexInt32(&hexInt)
        
        var r:UInt32!, g:UInt32!, b:UInt32!
        switch (hexWithoutSymbol.length) {
        case 3: // #RGB
            r = ((hexInt >> 4) & 0xf0 | (hexInt >> 8) & 0x0f)
            g = ((hexInt >> 0) & 0xf0 | (hexInt >> 4) & 0x0f)
            b = ((hexInt << 4) & 0xf0 | hexInt & 0x0f)
        case 6: // #RRGGBB
            r = (hexInt >> 16) & 0xff
            g = (hexInt >> 8) & 0xff
            b = hexInt & 0xff
        default:
            // TODO:ERROR
            break
        }
        self.init(
            red: (CGFloat(r)/255),
            green: (CGFloat(g)/255),
            blue: (CGFloat(b)/255),
            alpha:alpha)
    }
}

extension String {
    static func className(_ aClass: AnyClass) -> String {
       return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
    
    func substring(_ from: Int) -> String {
        return self.substring(from: index(self.startIndex, offsetBy: from))
    }
    
    var length: Int {
        return self.characters.count
    }
    
    func convertStringToDictionary(_ text: String) -> [String:AnyObject]? {
        if let data = text.data(using: String.Encoding.utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
            } catch let error as NSError {
                print(error)
            }
        }
        return nil
    }
}

extension UIView {
    func withPadding(_ padding: UIEdgeInsets) -> UIView {
    let container = UIView()
    self.translatesAutoresizingMaskIntoConstraints = false
    container.addSubview(self)
        container.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "|-(\(padding.left))-[view]-(\(padding.right))-|"
    , options: [], metrics: nil, views: ["view": self]))
        container.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(\(padding.top))-[view]-(\(padding.bottom))-|", options: [], metrics: nil, views: ["view": self]))
    return container
    }
}

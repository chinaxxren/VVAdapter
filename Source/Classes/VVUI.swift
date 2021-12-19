//
//  Copyright © 2021 chinaxxren. All rights reserved.
//

import UIKit

extension UILabel {
    @IBInspectable public var adaptFont: Bool {
        get {
            return self.adaptFont
        }
        set {
            guard newValue else {
                return
            }
            font = UIFont(name: font.fontName, size: VVAdaptationKit.adaptFont(font.pointSize))
        }
    }
}

extension UITextView {
    @IBInspectable public var adaptFont: Bool {
        get {
            return self.adaptFont
        }
        set {
            guard newValue else {
                return
            }
            guard let font = font else {
                return
            }
            self.font = UIFont(name: font.fontName, size: VVAdaptationKit.adaptFont(font.pointSize))
        }
    }
}

extension UITextField {
    @IBInspectable public var adaptFont: Bool {
        get {
            return self.adaptFont
        }
        set {
            guard newValue else {
                return
            }
            guard let font = font else {
                return
            }
            self.font = UIFont(name: font.fontName, size: VVAdaptationKit.adaptFont(font.pointSize))
        }
    }
}

extension NSLayoutConstraint {
    @IBInspectable public var adaptConstant: Bool {
        get {
            return self.adaptConstant
        }
        set {
            guard newValue else {
                return
            }
            constant = VVAdaptationKit.adaptInch(constant)
        }
    }
}

//
//  Copyright © 2021 chinaxxren. All rights reserved.
//

import UIKit
import struct CoreGraphics.CGFloat
import struct CoreGraphics.CGSize

public class VVAdaptationRule {
    internal var baseScreen: VVScreen
    internal var map = [VVScreen: Double]()

    public static let `default` = VVAdaptationRule(baseScreen: .i8)

    public init(baseScreen: VVScreen) {
        self.baseScreen = baseScreen
    }

    @discardableResult
    public func set(screen: VVScreen, ratio: Double) -> VVAdaptationRule {
        map[screen] = ratio
        return self
    }
}

public struct VVAdaptationKit {
    private static var inchRule = VVAdaptationRule.default
    private static var fontRule = VVAdaptationRule.default

    public static func set(inchRule: VVAdaptationRule) {
        self.inchRule = inchRule
    }

    public static func set(fontRule: VVAdaptationRule) {
        self.fontRule = fontRule
    }

    internal static func adaptInch(_ origin: Double) -> Double {
        return adapt(origin, rule: inchRule)
    }

    internal static func adaptFont(_ origin: Double) -> Double {
        return adapt(origin, rule: fontRule)
    }

    internal static func adaptInch(_ origin: CGFloat) -> CGFloat {
        return origin.adaptInch()
    }

    internal static func adaptFont(_ origin: CGFloat) -> CGFloat {
        return origin.adaptFont()
    }

    private static func adapt(_ origin: Double, rule: VVAdaptationRule) -> Double {
        if let ratio = rule.map[VVScreen.current] {
            return origin * ratio
        } else {
            let base = Double(rule.baseScreen.size.width)
            let width = Double(min(UIScreen.main.bounds.width, UIScreen.main.bounds.height))
            return origin * (width / base)
        }
    }
}

public protocol VVAdaptable {
    func adaptInch() -> Self
    func adaptFont() -> Self
}

extension Double: VVAdaptable {
    public func adaptInch() -> Double {
        return VVAdaptationKit.adaptInch(self)
    }

    public func adaptFont() -> Double {
        return VVAdaptationKit.adaptFont(self)
    }
}

extension BinaryFloatingPoint {
    public func adaptInch<T>() -> T where T: BinaryFloatingPoint {
        let temp = Double("\(self)") ?? 0
        return T(temp.adaptInch())
    }

    public func adaptFont<T>() -> T where T: BinaryFloatingPoint {
        let temp = Double("\(self)") ?? 0
        return T(temp.adaptFont())
    }
}

extension BinaryInteger {
    public func adaptInch<T>() -> T where T: BinaryInteger {
        let temp = Double("\(self)") ?? 0
        return T(temp.adaptInch())
    }

    public func adaptFont<T>() -> T where T: BinaryInteger {
        let temp = Double("\(self)") ?? 0
        return T(temp.adaptFont())
    }
}

// MARK: operator

postfix operator ~

public postfix func ~(value: CGFloat) -> CGFloat {
    return value.adaptInch()
}

public postfix func ~(value: Double) -> Double {
    return value.adaptInch()
}

public postfix func ~(value: Float) -> Float {
    return value.adaptInch()
}

public postfix func ~(value: Int) -> Int {
    return value.adaptInch()
}

public postfix func ~(value: UInt) -> UInt {
    return value.adaptInch()
}

postfix operator ≈

public postfix func ≈(value: CGFloat) -> CGFloat {
    return value.adaptFont()
}

public postfix func ≈(value: Double) -> Double {
    return value.adaptFont()
}

public postfix func ≈(value: Float) -> Float {
    return value.adaptFont()
}

public postfix func ≈(value: Int) -> Int {
    return value.adaptFont()
}

public postfix func ≈(value: UInt) -> UInt {
    return value.adaptFont()
}



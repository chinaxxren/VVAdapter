//
//  Copyright © 2021 chinaxxren. All rights reserved.
//

import UIKit

public class VScreenWrapper<Base> {
    let base: Base

    public private(set) var value: Base

    init(_ base: Base) {
        self.base = base
        self.value = base
    }
}

public protocol VVAdapterScreenCompatible {
    associatedtype ScreenCompatibleType
    var screen: ScreenCompatibleType { get }
}

extension VVAdapterScreenCompatible {

    public var screen: VScreenWrapper<Self> {
        get {
            return VScreenWrapper(self)
        }
    }
}

extension VScreenWrapper {
    public typealias Screen = VScreen

    public func width(_ types: VScreen.Width..., is value: Base) -> Self {
        return width(types, is: value, zoomed: value)
    }

    public func width(_ types: VScreen.Width..., is value: Base, zoomed: Base) -> Self {
        return width(types, is: value, zoomed: zoomed)
    }

    private func width(_ types: [VScreen.Width], is value: Base, zoomed: Base) -> Self {
        for type in types where VScreen.Width.current == type {
            self.value = VScreen.isZoomedMode ? zoomed : value
        }
        return self
    }

    public func height(_ types: VScreen.Height..., is value: Base) -> Self {
        return height(types, is: value, zoomed: value)
    }

    public func height(_ types: VScreen.Height..., is value: Base, zoomed: Base) -> Self {
        return height(types, is: value, zoomed: zoomed)
    }

    private func height(_ types: [VScreen.Height], is value: Base, zoomed: Base) -> Self {
        for type in types where VScreen.Height.current == type {
            self.value = VScreen.isZoomedMode ? zoomed : value
        }
        return self
    }

    public func inch(_ types: VScreen.Inch..., is value: Base) -> Self {
        return inch(types, is: value, zoomed: value)
    }

    public func inch(_ types: VScreen.Inch..., is value: Base, zoomed: Base) -> Self {
        return inch(types, is: value, zoomed: zoomed)
    }

    private func inch(_ types: [VScreen.Inch], is value: Base, zoomed: Base) -> Self {
        for type in types where VScreen.Inch.current == type {
            self.value = VScreen.isZoomedMode ? zoomed : value
        }
        return self
    }

    public func level(_ types: VScreen.Level..., is value: Base) -> Self {
        return level(types, is: value, zoomed: value)
    }

    public func level(_ types: VScreen.Level..., is value: Base, zoomed: Base) -> Self {
        return level(types, is: value, zoomed: zoomed)
    }

    private func level(_ types: [VScreen.Level], is value: Base, zoomed: Base) -> Self {
        for type in types where VScreen.Level.current == type {
            self.value = VScreen.isZoomedMode ? zoomed : value
        }
        return self
    }
}

extension Int: VVAdapterScreenCompatible {
}

extension Bool: VVAdapterScreenCompatible {
}

extension Float: VVAdapterScreenCompatible {
}

extension Double: VVAdapterScreenCompatible {
}

extension String: VVAdapterScreenCompatible {
}

extension CGRect: VVAdapterScreenCompatible {
}

extension CGSize: VVAdapterScreenCompatible {
}

extension CGFloat: VVAdapterScreenCompatible {
}

extension CGPoint: VVAdapterScreenCompatible {
}

extension UIImage: VVAdapterScreenCompatible {
}

extension UIColor: VVAdapterScreenCompatible {
}

extension UIFont: VVAdapterScreenCompatible {
}

extension UIEdgeInsets: VVAdapterScreenCompatible {
}


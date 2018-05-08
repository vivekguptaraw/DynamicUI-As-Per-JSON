

#if os(iOS)
    import UIKit
    typealias View = UIView
#else
    import Cocoa
    typealias View = NSView
#endif

// MARK: UIView implementation of the protocols.
//
extension View : Frameable, Anchorable, Alignable, Groupable {
    public var superFrame: CGRect {
        guard let superview = superview else {
            return CGRect.zero
        }

        return superview.frame
    }

    public func setDimensionAutomatically() {
        #if os(iOS)
            self.sizeToFit()
        #else
            self.autoresizesSubviews = true
            self.autoresizingMask = [.width, .height]
        #endif
    }
}


// MARK: CALayer implementation of the protocols.
//
extension CALayer : Frameable, Anchorable, Alignable, Groupable {
    public var superFrame: CGRect {
        guard let superlayer = superlayer else {
            return CGRect.zero
        }

        return superlayer.frame
    }

    public func setDimensionAutomatically() { /* no-op here as this shouldn't apply to CALayers */ }
}

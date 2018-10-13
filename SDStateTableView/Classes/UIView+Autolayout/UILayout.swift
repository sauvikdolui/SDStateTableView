//
//  UILayout.swift
//  SDStateTableView
//
//  Created by Sauvik Dolui on 13/10/17.
//

import Foundation
import UIKit

public extension UIView {
    
    // UIView class function to create an view with
    // translateAutoResizingMaskIntoConstraints is disabled
    class public func autolayoutView() -> Self {
        let view = self.init()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}

public extension UIEdgeInsets {
    public init(margin: CGFloat) {
        self.init()
        self.top = margin
        self.bottom = margin
        self.left = margin
        self.right = margin
    }
    public init(sidePadding: CGFloat, verticalPadding: CGFloat) {
        self.init()
        self.top = verticalPadding
        self.bottom = verticalPadding
        self.left = sidePadding
        self.right = sidePadding
    }
}

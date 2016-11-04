//
//  UIView+AutoLayout.swift
//  SwiftAutoLayoutHelper
//
//  Created by Hao Zheng on 11/4/16.
//  Copyright © 2016 Planhola. All rights reserved.
//

import UIKit

extension UIView {
    
    /**
     public autolayout helpers
     */
    func constrainEdges(to: UIView) {
        constraintPinToTop(parent: to)
        constraintPinToLeading(parent: to)
        constraintPinToBottom(parent: to)
        constraintPinToTrailing(parent: to)
        
        /* or
         to.addSubview(self)
         self.translatesAutoresizingMaskIntoConstraints = false
         let dict = getSelfDict()
         for format in ["H:|[view]|", "V:|[view]|"] {
         to.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dict))
         }
         */
    }
    
    func widthConstraint(width: CGFloat) {
        widthHeightConstraintHelper(value: width, isWidth: true)
    }
    
    func heightConstraint(height: CGFloat) {
        widthHeightConstraintHelper(value: height, isWidth: false)
    }
    
    func equalWidthToParent(parent: UIView) {
        addSingleConstraintToParent(parent: parent, attr: .width)
    }
    
    func equalHeightToParent(parent: UIView) {
        addSingleConstraintToParent(parent: parent, attr: .height)
    }
    
    func centerXToParent(parent: UIView) {
        addSingleConstraintToParent(parent: parent, attr: .centerX)
    }
    
    func centerYToParent(parent: UIView) {
        addSingleConstraintToParent(parent: parent, attr: .centerY)
    }
    
    func constraintPinToTop(parent: UIView) {
        addSingleConstraintToParent(parent: parent, attr: .top)
    }
    
    func constraintPinToLeading(parent: UIView) {
        addSingleConstraintToParent(parent: parent, attr: .left)
    }
    
    func constraintPinToBottom(parent: UIView) {
        addSingleConstraintToParent(parent: parent, attr: .bottom)
    }
    
    func constraintPinToTrailing(parent: UIView) {
        addSingleConstraintToParent(parent: parent, attr: .trailing)
    }
    
    /**
     private autolayout helpers
     */
    private func addSelfToParent(parent: UIView) {
        if self.isDescendant(of: parent) { return }
        self.translatesAutoresizingMaskIntoConstraints = false
        parent.addSubview(self)
    }
    
    private func addSingleConstraintToParent(parent: UIView, attr: NSLayoutAttribute) {
        addSelfToParent(parent: parent)
        parent.addConstraint(NSLayoutConstraint.init(item: self, attribute: attr, relatedBy: .equal, toItem: parent, attribute: attr, multiplier: 1, constant: 0))
    }
    
    private func getSelfDict() -> Dictionary<String, UIView> {
        return ["view" : self]
    }
    
    private func widthHeightConstraintHelper(value: CGFloat, isWidth: Bool) {
        let dict = getSelfDict()
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: String.init(format: "%@:[view(%f)]", isWidth ? "H" : "V", value), options:NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dict))
    }
    
}

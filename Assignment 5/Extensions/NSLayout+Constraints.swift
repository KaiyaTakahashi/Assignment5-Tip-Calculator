//
//  NSLayout+Constraints.swift
//  Assignment 5
//
//  Created by Kaiya Takahashi on 2022-05-10.
//

import Foundation
import UIKit

extension UITextField {
    
    func setTextFieldWidthAndHeight(_ width: CGFloat, _ height: CGFloat){
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: width),
            self.heightAnchor.constraint(equalToConstant: height)
        ])
    }
    
    func setTextFieldWidthAndHeight(height height: CGFloat, width width: CGFloat, equalTo view: UIView) {
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: width),
            self.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: height),
        ])
    }
    
}

extension UIView{
    
    func setViewWidthAndHeight(_ width: CGFloat, _ height: CGFloat){
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: width),
            self.heightAnchor.constraint(equalToConstant: height)
        ])
    }
    
    func setViewWidthAndHeight(height height: CGFloat, width width: CGFloat, equalTo view: UIView) {
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: width),
            self.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: height),
        ])
    }
    
}

extension UIButton {
    
    func setButtonWidthAndHeight(_ width: CGFloat, _ height: CGFloat){
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: width),
            self.heightAnchor.constraint(equalToConstant: height)
        ])
    }
    
    func setTextFieldWidthAndHeight(height height: CGFloat, width width: CGFloat, equalTo view: UIView) {
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: width),
            self.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: height),
        ])
    }
    
}

extension UILabel {
    
    func setLabelWidthAndHeight(_ width: CGFloat, _ height: CGFloat){
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: width),
            self.heightAnchor.constraint(equalToConstant: height)
        ])
    }
    
    func setTextFieldWidthAndHeight(height height: CGFloat, width width: CGFloat, equalTo view: UIView) {
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: width),
            self.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: height),
        ])
    }
    
}

extension UISlider {
    
    func setSliderWidthAndHeight(_ width: CGFloat, _ height: CGFloat){
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: width),
            self.heightAnchor.constraint(equalToConstant: height)
        ])
    }
    
    func setTextFieldWidthAndHeight(height height: CGFloat, width width: CGFloat, equalTo view: UIView) {
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: width),
            self.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: height),
        ])
    }
}

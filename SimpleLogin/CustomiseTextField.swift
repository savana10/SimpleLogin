//
//  CustomiseTextField.swift
//  HexMask
//
//  Created by Savana on 02/06/16.
//  Copyright © 2016 SH. All rights reserved.
//

import UIKit

extension UITextField
{
    /**
     Image to be displayed as left view
     
     - parameter image: UIImage to be displayed
     */
    func createLeftViewWith(image:UIImage)  {
        let imageView:UIImageView  = UIImageView(frame: CGRectMake(0, 0, 15, 15));
        imageView.contentMode = UIViewContentMode.ScaleAspectFit;
        imageView.image = image;
        let leftView:UIView = UIView(frame:CGRectMake(0,0,30,30));
        imageView.center = leftView.center;
        leftView.addSubview(imageView);
        self.leftView = leftView;
        self.leftViewMode = UITextFieldViewMode.Always;
    }
    
    /**
     By default give bottom border of 1px to UITextField
     */
    func createBottomBorder() {
        let borderLayer:CALayer = CALayer();
        borderLayer.frame = CGRectMake(30, self.bounds.size.height-1, self.bounds.size.width-30, 1);
        borderLayer.backgroundColor = UIColor.init(white: 0.5, alpha: 0.5).CGColor;
        borderLayer.zPosition = 2;
        self.layer.addSublayer(borderLayer);
    }
    /**
     Keep LeftView to UITextField along with Border
     
     - parameter image: UIImage to be displayed
     */
    func  createLeftViewWithBottomBorderImage(image:UIImage)  {
        self.createLeftViewWith(image);
        self.createBottomBorder();
    }
    
}
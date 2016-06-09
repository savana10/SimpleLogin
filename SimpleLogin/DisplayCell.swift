//
//  DisplayCell.swift
//  HexMask
//
//  Created by Savana on 01/06/16.
//  Copyright © 2016 SH. All rights reserved.
//

import UIKit

class DisplayCell: UITableViewCell {

    @IBOutlet var img_CellImage: UIImageView!;
    @IBOutlet var height_ImageConstraint : NSLayoutConstraint!;
    @IBOutlet var width_ImageConstraint : NSLayoutConstraint!;
    override func awakeFromNib() {
        super.awakeFromNib()
        self.img_CellImage.image = generateImage();
        self.img_CellImage.layer.shadowColor = UIColor(colorLiteralRed: 0.698, green: 0.706, blue: 0.737, alpha: 1).CGColor;
        self.img_CellImage.layer.shadowRadius = 2;
        self.img_CellImage.layer.shadowOffset = CGSizeMake(3, 5);
        self.img_CellImage.layer.shadowOpacity = 1;
    }
    
    func generateImage () -> UIImage  {
        var image : UIImage = self.img_CellImage.image!;
        let imageSize = image.size;
        let viewFrame = self.img_CellImage.bounds;
        let imageRef: CGImageRef  = CGImageCreateWithImageInRect(image.CGImage!, CGRectMake((imageSize.width-viewFrame.size.width)/2, (imageSize.height-viewFrame.size.height)/2, self.img_CellImage.bounds.size.width, self.img_CellImage.bounds.size.height))!
        image = UIImage(CGImage: imageRef, scale: 0.0, orientation: image.imageOrientation);
        return image;
    }

}

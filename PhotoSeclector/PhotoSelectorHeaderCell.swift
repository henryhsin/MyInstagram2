//
//  PhotoSelectorHeaderCell.swift
//  Instagram
//
//  Created by 辛忠翰 on 14/01/18.
//  Copyright © 2018 辛忠翰. All rights reserved.
//

import UIKit

class PhotoSelectorHeaderCell: BasicCell {
    var image: UIImage?{
        didSet{
            imageView.image = image
        }
    }
    let imageView: UIImageView = {
       let imgView = UIImageView()
        imgView.backgroundColor = .lightGray
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        return imgView
    }()
    
    override func setupViews() {
        setupImageView()
    }
    
    fileprivate func setupImageView(){
        addSubview(imageView)
        imageView.fullAnchor(super: self)
    }
}

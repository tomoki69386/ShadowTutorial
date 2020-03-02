//
//  ShadowPictureView.swift
//  ShadowSample
//
//  Created by 築山朋紀 on 2020/03/02.
//  Copyright © 2020 tomoki_sun. All rights reserved.
//

import UIKit

class ShadowPictureView: UIView {
    let imageView = UIImageView()
    var image: UIImage? {
        set { imageView.image = newValue }
        get { return imageView.image }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    private func commonInit() {
        backgroundColor = .clear
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

//
//  ShadowPictureViewController.swift
//  ShadowSample
//
//  Created by 築山朋紀 on 2020/03/02.
//  Copyright © 2020 tomoki_sun. All rights reserved.
//

import UIKit

final class ShadowPictureViewController: UIViewController {
    @IBOutlet private weak var shadowPictureView: ShadowPictureView!
    @IBOutlet private weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shadowPictureView.image = UIImage(named: "cat")
        shadowPictureView.layer.shadowColor = UIColor.black.cgColor
        
        let shadowRadiusView = SliderView(title: "shadowRadius") { [weak self] (value) in
            self?.shadowPictureView.layer.shadowRadius = CGFloat(value * 100)
            print("shadowRadius: \(value * 100)")
        }
        let shadowOpacityView = SliderView(title: "shadowOpacity") { [weak self] (value) in
            self?.shadowPictureView.layer.shadowOpacity = value
            print("shadowOpacity: \(value)")
        }
        let cornerRadiusView = SliderView(title: "cornerRadius") { [weak self] (value) in
            self?.shadowPictureView.imageView.layer.cornerRadius = CGFloat(value * 100)
            print("cornerRadius: \(value * 100)")
        }
        let clipsToBoundsView = SwitchView(title: "clipsToBounds") { [weak self] (value) in
            self?.shadowPictureView.imageView.clipsToBounds = value
            print("clipsToBounds: \(value)")
        }
        
        stackView.addArrangedSubview(shadowRadiusView)
        stackView.addArrangedSubview(shadowOpacityView)
        stackView.addArrangedSubview(cornerRadiusView)
        stackView.addArrangedSubview(clipsToBoundsView)
    }
}

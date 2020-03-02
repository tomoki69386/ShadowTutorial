//
//  SliderView.swift
//  ShadowSample
//
//  Created by 築山朋紀 on 2020/03/02.
//  Copyright © 2020 tomoki_sun. All rights reserved.
//

import UIKit

class SliderView: UIView {
    typealias Action = ((Float) -> Void)
    var action: Action
    var title: String
    let titleLabel = UILabel()
    let slider = UISlider()
    
    init(title: String, action: @escaping Action) {
        self.title = title
        self.action = action
        super.init(frame: .zero)
        
        titleLabel.text = title
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(didValueChanged), for: .valueChanged)
        addSubview(slider)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 120),
            slider.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            slider.topAnchor.constraint(equalTo: topAnchor),
            slider.trailingAnchor.constraint(equalTo: trailingAnchor),
            slider.bottomAnchor.constraint(equalTo: bottomAnchor),
            heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    @objc func didValueChanged(_ slider: UISlider) {
        action(slider.value)
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("Invalid coder")
    }
}

//
//  SwitchView.swift
//  ShadowSample
//
//  Created by 築山朋紀 on 2020/03/02.
//  Copyright © 2020 tomoki_sun. All rights reserved.
//

import UIKit

class SwitchView: UIView {
    typealias Action = ((Bool) -> Void)
    var action: Action
    var title: String
    let titleLabel = UILabel()
    let switchButton = UISwitch()
    
    init(title: String, action: @escaping Action) {
        self.title = title
        self.action = action
        super.init(frame: .zero)
        
        titleLabel.text = title
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        switchButton.addTarget(self, action: #selector(didValueChanged), for: .valueChanged)
        addSubview(switchButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 120),
            switchButton.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            switchButton.topAnchor.constraint(equalTo: topAnchor),
            switchButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            switchButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    @objc func didValueChanged(_ sender: UISwitch) {
        action(sender.isOn)
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("Invalid coder")
    }
}

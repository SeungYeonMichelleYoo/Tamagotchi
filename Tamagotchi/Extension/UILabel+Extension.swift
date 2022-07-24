//
//  UILabel+Extension.swift
//  Tamagotchi
//
//  Created by SeungYeon Yoo on 2022/07/24.
//

import UIKit

extension UILabel {
    //라밸 글씨색상, 폰트 크기, 모서리 둥글게 및 두께, 배경 색상
    func labelUIChanged() {
        self.textColor = UIColor.mainColor
        self.font = UIFont.boldSystemFont(ofSize: 13)
        self.backgroundColor = .mainbackgroundColor
    }
    
    func labelBorderChanged() {
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.mainColor.cgColor
    }
}

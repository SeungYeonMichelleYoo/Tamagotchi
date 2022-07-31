//
//  UIButton+Extension.swift
//  Tamagotchi
//
//  Created by SeungYeon Yoo on 2022/07/24.
//
import UIKit

extension UIButton {
    //버튼 글씨색상, 폰트 크기, 모서리 둥글게 및 두께, 배경 색상
    func buttonUIChanged() {
        self.setTitleColor(UIColor.mainColor, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor.mainColor.cgColor
        self.backgroundColor = .mainbackgroundColor
    }
    
    //MARK: - 벼튼UI (글씨, 이미지)
    func btnUI(title: String, image: String) {
        self.setTitle(title, for:.normal)
        self.setImage(UIImage(systemName: image), for:.normal)
    }
}

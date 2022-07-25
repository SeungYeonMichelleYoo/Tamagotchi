//
//  UIViewController+Extension.swift
//  Tamagotchi
//
//  Created by SeungYeon Yoo on 2022/07/23.
//

import UIKit

extension UIViewController {
    //배경색상 설정
    func setBackgroundColor() {
        view.backgroundColor = .mainbackgroundColor
    }

    //얼럿 메시지
    func toomuchwordsAlert() {
        let alert = UIAlertController(title: "글자 수가 많아요", message: "2-6자리 사이의 닉네임을 설정해주세요", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "확인", style: .cancel)
        alert.addAction(cancel)
            
        present(alert, animated: false)
    }
}

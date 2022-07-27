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
        let alert = UIAlertController(title: "글자 수 규칙을 지켜 다시 입력해주세요.", message: "2-6자리 사이의 닉네임을 설정해주세요", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "확인", style: .cancel)
        alert.addAction(cancel)
            
        present(alert, animated: false)
    }
    
    //밥먹기 버튼에서 메시지
    func showAlertatRiceBtn() {
        let alert = UIAlertController(title: "숫자를 잘못 입력하셨습니다.", message: "1-99개의 밥알만 먹일 수 있어요.", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "확인", style: .cancel)
        alert.addAction(cancel)
            
        present(alert, animated: false)
    }
    
    //물먹기 버튼에서 메시지
    func showAlertatWaterBtn() {
        let alert = UIAlertController(title: "숫자를 잘못 입력하셨습니다.", message: "1-49개의 물방울만 먹일 수 있어요.", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "확인", style: .cancel)
        alert.addAction(cancel)
            
        present(alert, animated: false)
    }
}

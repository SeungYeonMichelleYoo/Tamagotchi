//
//  UICollectionViewController+Extension.swift
//  Tamagotchi
//
//  Created by SeungYeon Yoo on 2022/07/23.
//

import UIKit

extension UICollectionViewController {
    //얼럿 메시지
    func noaccessAlert() {
        let alert = UIAlertController(title: "준비중이에요", message: "캐릭터를 다시 선택해주세요", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "확인", style: .cancel)
        alert.addAction(cancel)
            
        present(alert, animated: false)
    }
}

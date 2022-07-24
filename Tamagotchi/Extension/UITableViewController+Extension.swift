//
//  File.swift
//  Tamagotchi
//
//  Created by SeungYeon Yoo on 2022/07/23.
//

import UIKit

extension UITableViewController {
 
    //얼럿 메시지
    func showAlert() {
        let alert = UIAlertController(title: "데이터 초기화", message: "정말 다시 처음부터 시작하실건가용?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "응", style: .default) { (_) in
            // ok버튼 클릭했을 때 처리할 내용 (데이터 초기화 - scenedelegate 이용)

        }
        let cancel = UIAlertAction(title: "아니", style: .cancel)
            
        alert.addAction(cancel)
        alert.addAction(ok)
            
        present(alert, animated: false)
    }
}

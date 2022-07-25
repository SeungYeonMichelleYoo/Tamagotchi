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
            //iOS13+ SceneDelegate 쓸 때 동작하는 코드. 마치 처음 실행하는 것처럼 보여준다. 이렇게 쓰면 기존에 쌓여있던 화면들은 모두 메모리에서 내려가게 된다.
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            let sceneDelegate = windowScene?.delegate as? SceneDelegate
            
            UserDefaults.standard.removeObject(forKey: "rice")
            UserDefaults.standard.removeObject(forKey: "water")
            UserDefaults.standard.removeObject(forKey: "name")
            UserDefaults.standard.removeObject(forKey: "level")
            
            //돌려주고 싶은 화면
            let sb = UIStoryboard(name: "Select", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "SelectCollectionViewController") as! SelectCollectionViewController
            
            sceneDelegate?.window?.rootViewController = vc
            sceneDelegate?.window?.makeKeyAndVisible()
        }
        let cancel = UIAlertAction(title: "아니", style: .cancel)
            
        alert.addAction(cancel)
        alert.addAction(ok)
            
        present(alert, animated: false)
    }
}

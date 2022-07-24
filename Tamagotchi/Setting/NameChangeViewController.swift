//
//  NameChangeViewController.swift
//  Tamagotchi
//
//  Created by SeungYeon Yoo on 2022/07/22.
//

import UIKit

class NameChangeViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        
        navigationItem.title = "님 이름 변경하기"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveBtnClicked))
    }
    @objc func saveBtnClicked() {
        self.navigationController?.popViewController(animated: true)
        
        //레벨, 밥알개수, 물방울개수 유지 + 다마고치 종류 추가해야 됨 !
        let level = UserDefaults.standard.integer(forKey: "level")
        let rice = UserDefaults.standard.integer(forKey: "rice")
        let water = UserDefaults.standard.integer(forKey: "water")
    }
    
    @IBAction func nameTxtFieldChanged(_ sender: UITextField) {
        let textFieldName = nameTextField.text
    }
    
    
    
}

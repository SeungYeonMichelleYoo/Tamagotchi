//
//  NameChangeViewController.swift
//  Tamagotchi
//
//  Created by SeungYeon Yoo on 2022/07/22.
//

import UIKit

class NameChangeViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        
        setBackgroundColor()
        
        let savedname = UserDefaults.standard.string(forKey: "name") ?? ""
        
        navigationItem.title = "\(savedname)님 이름 변경하기"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveBtnClicked))
    }
    @objc func saveBtnClicked() {
        if (nameTextField.text!.count >= 2 && nameTextField.text!.count <= 6) {
            self.navigationController?.popViewController(animated: true)
            
            //레벨, 밥알개수, 물방울개수 유지 + 다마고치 종류 추가해야 됨 !
            let level = UserDefaults.standard.integer(forKey: "level")
            let rice = UserDefaults.standard.integer(forKey: "rice")
            let water = UserDefaults.standard.integer(forKey: "water")
            
            let nickname = nameTextField.text
            UserDefaults.standard.set(nickname, forKey:"name")
            //print(UserDefaults.standard.string(forKey: "name"))
        } else {
            toomuchwordsAlert()
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = nameTextField.text else { return false }
        
        if text.count > 5 {
            return false
        }
        return true
    }
    
    @IBAction func TextFieldChanged(_ sender: UITextField) {
//        if let value = sender.text?.trimmingCharacters(in: .whitespacesAndNewlines), (2...6).contains(value.count) {
//             return
//        } else {
//            toomuchwordsAlert()
//        }
    }


}

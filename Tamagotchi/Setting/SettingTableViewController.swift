//
//  SettingTableViewController.swift
//  Tamagotchi
//
//  Created by SeungYeon Yoo on 2022/07/22.
//

import UIKit


class SettingTableViewController: UITableViewController {

    @IBOutlet weak var changedNameUILabel: UITableViewCell!
    
    @IBOutlet weak var showNameUILabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        
        navigationItem.title = "설정"
        navigationController?.navigationBar.topItem?.title = ""
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showNameUILabel.font = UIFont.systemFont(ofSize: 13)
        showNameUILabel.text = UserDefaults.standard.string(forKey: "name")
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .mainbackgroundColor
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 0){
            //이름 설정 화면 push
            let sb = UIStoryboard(name: "Setting", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "NameChangeViewController")
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if(indexPath.row == 1) {
            //다마고치 변경하기 화면 push
            let sb = UIStoryboard(name: "Select", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "SelectCollectionViewController")
            self.navigationController?.pushViewController(vc, animated: true)
            
            vc.navigationItem.title = "다마고치 변경하기"
        }
        if(indexPath.row == 2) {
            showAlert()
        }
    }
}

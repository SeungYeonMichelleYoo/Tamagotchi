//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by SeungYeon Yoo on 2022/07/22.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var wordsUILabel: UILabel!
    
    
    @IBOutlet weak var levelInfoUILabel: UILabel!
    
    //레벨, 밥알, 물방울 숫자 초기화
    var levelInitArray = [1, 0, 0]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()

        navigationItem.title = "님의 다마고치"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle.fill"), style: .plain, target: self, action: #selector(settingBtnClicked))
    }
    @objc func settingBtnClicked(){
        let sb = UIStoryboard(name: "Setting", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SettingTableViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        wordsUILabel.text = newWordsSetting()
    }
    
    //말풍선 이야기
    func newWordsSetting() -> String {
        let newWords = ["배움은 의무도, 생존도 아니다. -애드워즈 데밍", "행동의 가치는 그 행동을 끝까지 이루는 데 있다. - 칭기즈칸", "아무것도 하지 않으면 아무 일도 일어나지 않는다. -기시미 이치로", "가장 큰 위험은 위험 없는 삶이다. -스티븐 코비", "인내가 최상의 미덕이다. -카토"]
        let select = newWords.randomElement()!
        return select
    }
    
    @IBAction func riceBtnClicked(_ sender: UIButton) {
        levelInitArray[1] += 1
        
        levelInfoUILabel.text = "LV\(levelInitArray[0])ㆍ 밥알\(levelInitArray[1])개 ㆍ 물방울\(levelInitArray[2])개"
    }
    
    @IBAction func waterBtnClicked(_ sender: UIButton) {
        levelInitArray[2] += 1
        
        levelInfoUILabel.text = "LV\(levelInitArray[0])ㆍ 밥알\(levelInitArray[1])개 ㆍ 물방울\(levelInitArray[2])개"
    }
    
    

}

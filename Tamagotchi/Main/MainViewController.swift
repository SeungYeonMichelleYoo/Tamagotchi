//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by SeungYeon Yoo on 2022/07/22.
//

import UIKit

class MainViewController: UIViewController {
   
    //1>> 닉네임, 캐릭터 정보 값 전달을 위한 공간 만듬
    var characterData: Character?
    
    @IBOutlet weak var wordsUILabel: UILabel!
    
    @IBOutlet weak var characterImage: UIImageView!
    
    @IBOutlet weak var nameUILabel: UILabel!
    
    @IBOutlet weak var levelInfoUILabel: UILabel!
    
    @IBOutlet weak var riceTextField: UITextField!
    
    @IBOutlet weak var waterTextField: UITextField!
    
    @IBOutlet weak var riceBtnUI: UIButton!
    
    @IBOutlet weak var waterBtnUI: UIButton!

    //레벨, 밥알, 물방울 숫자 초기화
    var levelInitArray = [1, 0, 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        wordsUILabel.labelUIChanged() //말풍선 UI
        
        nameUILabel.labelUIChanged() //닉네임 UI
        //3>> 전달된 값 표시
//        print(characterData)
        nameUILabel.text = characterData?.initnickname
        characterImage.image = UIImage(named: characterData!.characterImage)
        
        nameUILabel.labelBorderChanged() //닉네임 테두리 UI
        riceBtnUI.buttonUIChanged() //밥먹기 버튼 UI
        waterBtnUI.buttonUIChanged() //물먹기 버튼 UI
        
        //말풍선 폰트 커스텀
        levelInfoUILabel.font = UIFont.boldSystemFont(ofSize: 13)
        levelInfoUILabel.textColor = UIColor.mainColor
        
        //밥먹기 버튼 UI 커스텀
        riceBtnUI.setTitle("밥먹기", for: .normal)
        riceBtnUI.setImage(UIImage(systemName: "drop.circle"), for:.normal)
        
        //물먹기 버튼 UI 커스텀
        waterBtnUI.setTitle("물먹기", for: .normal)
        waterBtnUI.setImage(UIImage(systemName: "leaf.circle"), for:.normal)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle.fill"), style: .plain, target: self, action: #selector(settingBtnClicked))
        
        //레벨, 밥알개수, 물방울개수 유지
        UserDefaults.standard.set(levelInitArray[0], forKey: "level")
        UserDefaults.standard.set(levelInitArray[1], forKey: "rice")
        UserDefaults.standard.set(levelInitArray[2], forKey: "water")
    }
    
    @objc func settingBtnClicked(){
        let sb = UIStoryboard(name: "Setting", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SettingTableViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        wordsUILabel.text = newWordsSetting()
        let savednickname = UserDefaults.standard.string(forKey: "name")!
        //3] 변경된 닉네임 값 전달 받아옴
        navigationItem.title = "\(savednickname)님의 다마고치"
    }
    
    //말풍선 이야기
    func newWordsSetting() -> String {
        let newWords = ["배움은 의무도, 생존도 아니다. -애드워즈 데밍", "행동의 가치는 그 행동을 끝까지 이루는 데 있다. - 칭기즈칸", "아무것도 하지 않으면 아무 일도 일어나지 않는다. -기시미 이치로", "가장 큰 위험은 위험 없는 삶이다. -스티븐 코비", "인내가 최상의 미덕이다. -카토"]
        let select = newWords.randomElement()!
        return select
    }
    
    @IBAction func riceBtnClicked(_ sender: UIButton) {
        let riceTxt = riceTextField.text!
        let riceCount = Int(riceTxt) ?? 1
        if (riceCount > 0 && riceCount < 100) {
            levelInitArray[1] += riceCount
        }
        levelInitArray[0] = ((levelInitArray[1]/5) + (levelInitArray[2]/2))/10
        levelInfoUILabel.text = "LV\(levelInitArray[0])ㆍ 밥알\(levelInitArray[1])개 ㆍ 물방울\(levelInitArray[2])개"
        
        wordsUILabel.text = newWordsSetting()
    }
    
    @IBAction func waterBtnClicked(_ sender: UIButton) {
        let waterTxt = waterTextField.text!
        let waterCount = Int(waterTxt) ?? 1
        if (waterCount > 0 && waterCount < 50) {
            levelInitArray[2] += waterCount
        }
        levelInitArray[0] = ((levelInitArray[1]/5) + (levelInitArray[2]/2))/10
        levelInfoUILabel.text = "LV\(levelInitArray[0])ㆍ 밥알\(levelInitArray[1])개 ㆍ 물방울\(levelInitArray[2])개"
        
        wordsUILabel.text = newWordsSetting()
    }
    
}

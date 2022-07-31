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
    let characters = CharacterInfo().character
    
    @IBOutlet weak var wordsUILabel: UILabel!
    
    @IBOutlet weak var characterImage: UIImageView!
    
    @IBOutlet weak var nameUILabel: UILabel!
    
    @IBOutlet weak var levelInfoUILabel: UILabel!
    
    @IBOutlet weak var riceTextField: UITextField!
    
    @IBOutlet weak var waterTextField: UITextField!
    
    @IBOutlet weak var riceBtnUI: UIButton!
    
    @IBOutlet weak var waterBtnUI: UIButton!

    //레벨, 밥알, 물방울 숫자 초기화
    var levelInitArray: (level: Int, rice: Int, water: Int) = (1, 0, 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.mainColor] //navigationController.navigationBar는 모든 뷰에 적용이 된다.
        self.navigationController?.navigationBar.tintColor = .mainColor
        
        let navigationBar = navigationController?.navigationBar
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.shadowColor = .gray
        navigationBar?.scrollEdgeAppearance = navigationBarAppearance
        navigationBar?.standardAppearance = navigationBarAppearance
        
        //MARK: - UI적 요소
        setBackgroundColor()
        wordsUILabel.labelUIChanged() //말풍선 UI
        
        nameUILabel.labelUIChanged() //닉네임 UI
        //3>> 전달된 값 표시
        print(characterData)
        //selectCollectionView를 안거치고 온 경우 = 기존사용자
        //if (characterData == nil) {
            characterData = characters[UserDefaults.standard.integer(forKey: "index") ?? 0]
            levelInitArray.0 = UserDefaults.standard.integer(forKey: "level")
            levelInitArray.1 = UserDefaults.standard.integer(forKey: "rice")
            levelInitArray.2 = UserDefaults.standard.integer(forKey: "water")
        
        if levelInitArray.0 == 0 {
            levelInitArray.0 = 1
        }
        //}

        nameUILabel.text = characterData?.initnickname
        characterImage.image = UIImage(named: characterData!.characterImage)
        
        nameUILabel.labelBorderChanged() //닉네임 테두리 UI
        riceBtnUI.buttonUIChanged() //밥먹기 버튼 UI
        waterBtnUI.buttonUIChanged() //물먹기 버튼 UI
        
        //말풍선 폰트 커스텀
        levelInfoUILabel.font = UIFont.boldSystemFont(ofSize: 13)
        levelInfoUILabel.textColor = UIColor.mainColor
        levelInfoUILabel.text = "LV\(levelInitArray.0)ㆍ 밥알\(levelInitArray.1)개 ㆍ 물방울\(levelInitArray.2)개"
        
        //MARK: - UIButton+Extension btnUI 함수 이용
        //밥먹기 버튼 UI 커스텀
        riceBtnUI.btnUI(title: "밥먹기", image: "drop.circle")
        
        //물먹기 버튼 UI 커스텀
        waterBtnUI.btnUI(title: "물먹기", image: "leaf.circle")

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle.fill"), style: .plain, target: self, action: #selector(settingBtnClicked))
    }
    
    @objc func settingBtnClicked(){
        let sb = UIStoryboard(name: "Setting", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SettingTableViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        wordsUILabel.text = newWordsSetting()
        let savednickname = UserDefaults.standard.string(forKey: "name") ?? ""
        //3] 변경된 닉네임 값 전달 받아옴
        navigationItem.title = "\(savednickname)님의 다마고치"
       
    }
    
    //MARK: - 말풍선 랜덤으로 변하게
    func newWordsSetting() -> String {
        let newWords = ["배움은 의무도, 생존도 아니다. -애드워즈 데밍", "행동의 가치는 그 행동을 끝까지 이루는 데 있다. - 칭기즈칸", "아무것도 하지 않으면 아무 일도 일어나지 않는다. -기시미 이치로", "가장 큰 위험은 위험 없는 삶이다. -스티븐 코비", "인내가 최상의 미덕이다. -카토"]
        let select = newWords.randomElement()!
        return select
    }
    
    let defaultValue = 1
    
    //MARK: - 밥먹기 버튼 클릭시 실행
    @IBAction func riceBtnClicked(_ sender: UIButton) {
        let riceTxt = riceTextField.text!
        let riceCount = Int(riceTxt) ?? defaultValue
        if (riceCount > 0 && riceCount < 100) {
            levelInitArray.1 += riceCount
        } else {
            showAlertatRiceBtn()
        }
        buttonClicked()
    }
        
    //MARK: - 물먹기 버튼 클릭시 실행
    @IBAction func waterBtnClicked(_ sender: UIButton) {
        let waterTxt = waterTextField.text!
        let waterCount = Int(waterTxt) ?? defaultValue
        if (waterCount > 0 && waterCount < 50) {
            levelInitArray.2 += waterCount
        } else {
            showAlertatWaterBtn()
        }
        buttonClicked()
    }
    
    //MARK: - 밥먹기, 물먹기 버튼 관련 공통 함수
    func buttonClicked() {
        levelCount()
        levelInfoUILabel.text = "LV\(levelInitArray.0)ㆍ 밥알\(levelInitArray.1)개 ㆍ 물방울\(levelInitArray.2)개"
    
        wordsUILabel.text = newWordsSetting()
        imagebyLevel()
        
        saveNumbers()
    }
        
    //MARK: - 레벨 계산(밥먹기, 물먹기에 따라 올라가는 레벨)
    
    func levelCount() {
        levelInitArray.0 = ((levelInitArray.1/5) + (levelInitArray.2/2))/10
        if (levelInitArray.0 == 0) {
            levelInitArray.0 = 1
        } else if (levelInitArray.0 > 10) {
            levelInitArray.0 = 10
        }
    }
    
    //MARK: - 레벨에 따라 변하는 이미지 세팅
    func imagebyLevel() {
        var levelForImage = levelInitArray.0
        if (levelForImage == 10) {
            levelForImage = 9
        }
        if characterImage.image == UIImage(named: "1-6.png") {
            characterImage.image = UIImage(named: "1-\(levelForImage).png")
        } else if characterImage.image == UIImage(named: "2-6.png") {
            characterImage.image = UIImage(named: "2-\(levelForImage).png")
        } else {
            characterImage.image = UIImage(named: "3-\(levelForImage).png")
        }
    }
    
    func saveNumbers() {
    //MARK: - UserDefaults
        //레벨, 밥알개수, 물방울개수 유지
        UserDefaults.standard.set(levelInitArray.0, forKey: "level")
        UserDefaults.standard.set(levelInitArray.1, forKey: "rice")
        UserDefaults.standard.set(levelInitArray.2, forKey: "water")
    }

}

//
//  DetailViewController.swift
//  Tamagotchi
//
//  Created by SeungYeon Yoo on 2022/07/22.
//

import UIKit

class DetailViewController: UIViewController {
    var characterList = CharacterInfo() //인스턴스 생성

    //1] 닉네임, 캐릭터 정보 값 전달을 위한 공간 만듬
    var characterData: Character?
    //1) 캐릭터 위치 정보 공간 만들기
    var characterIndex: Int?
    
    @IBOutlet var detailUIView: UIView!
    @IBOutlet weak var detailUIImage: UIImageView!
    @IBOutlet weak var detailCharacterUILabel: UILabel!
    @IBOutlet weak var detailInfoLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    var mainVCpopedup = false
    
    //1) 값전달 공간(시작하기->변경하기)
    var btnTitle: String? = "시작하기"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        characterData = CharacterInfo().character[characterIndex ?? 0]
        
        //3] 값 전달
        detailUIImage!.image = UIImage(named: characterData!.characterImage)
        detailCharacterUILabel.text = characterData?.initnickname
        detailInfoLabel.text = characterData?.info
        
        //밑 배경 투명 처리
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
        view.isOpaque = true
        
        //detailUIView 모서리 둥글게 만들기
        detailUIView.layer.cornerRadius = 25
        detailUIView.clipsToBounds = true
        
        //3) 전달받은 값 보여주기(시작하기->변경하기)
        startButton.setTitle(btnTitle, for: .normal)
    }
    

//    override func viewWillAppear(_ animated: Bool) {
//        startButton.setTitle(btnTitle, for: .normal)
//    }
    
    //popup뷰 이외에 클릭시 내려감 (탭제스쳐 효과)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if touch?.view != detailUIView && !mainVCpopedup {
            self.dismiss(animated: true)
        }
    }
    
    @IBAction func cancelBtnClicked(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func startBtnClicked(_ sender: UIButton) {
        UserDefaults.standard.set(characterIndex, forKey: "index")
        //클릭시 메인화면으로 이동
        self.mainVCpopedup = true
        //1. 스토리보드 파일찾기
        let sb = UIStoryboard(name: "Main", bundle: nil) //nil:기본 위치로 가져옴
        //2. 스토리보드 내에 있는 팝업뷰 컨트롤러 가져오기
        let vc = sb.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
//        vc.characterData = characterData
        //2.5 Navigation controller embed
        let nav = UINavigationController(rootViewController: vc)
        //2.5. present할 때의 화면 전환 방식 설정 (옵션) 기억해두면 좋음!
        nav.modalPresentationStyle = .fullScreen
        //3. 팝업 띄우기
        self.present(nav, animated: false)
    }
}

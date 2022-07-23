//
//  DetailViewController.swift
//  Tamagotchi
//
//  Created by SeungYeon Yoo on 2022/07/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var detailUIView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //밑 배경 투명 처리
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
        view.isOpaque = true
        
        //detailUIView 모서리 둥글게 만들기
        detailUIView.layer.cornerRadius = 25
        detailUIView.clipsToBounds = true
        }   

    @IBAction func tapGestureClicked(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: false)
    }
    
    @IBAction func cancelBtnClicked(_ sender: UIButton) {
        self.dismiss(animated: false)
    }
    
    @IBAction func startBtnClicked(_ sender: UIButton) {
        //클릭시 메인화면으로 이동
        //1. 스토리보드 파일찾기
        let sb = UIStoryboard(name: "Main", bundle: nil) //nil:기본 위치로 가져옴
        //2. 스토리보드 내에 있는 팝업뷰 컨트롤러 가져오기
        let vc = sb.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        //2.5 Navigation controller embed
        let nav = UINavigationController(rootViewController: vc)
        //2.5. present할 때의 화면 전환 방식 설정 (옵션) 기억해두면 좋음!
        nav.modalPresentationStyle = .fullScreen
        //3. 팝업 띄우기
        self.present(nav, animated: true)
    }
}
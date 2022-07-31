//
//  SelectCollectionViewController.swift
//  Tamagotchi
//
//  Created by SeungYeon Yoo on 2022/07/22.
//

import UIKit

private let reuseIdentifier = "Cell"

class SelectCollectionViewController: UICollectionViewController {
    
    var characterList = CharacterInfo() //인스턴스 생성
    
//    var imageSetting: [UIImage] = []
//    var characterSetting: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        initImageSetting()
//        initCharacterSetting()
        
        //컬렉션뷰의 셀 크기, 셀 사이 간격 등 설정.
        let layout = UICollectionViewFlowLayout() //인스턴스 생성(초기화)
        let spacing: CGFloat = 8
        let width = UIScreen.main.bounds.width - (spacing * 4)//여백 없이 디바이스 전체를 3으로 나눈다.
        layout.itemSize = CGSize(width: width / 3, height: width / 3)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        collectionView.collectionViewLayout = layout //설정된 값 제공해야 위에서 넣은 수치들이 반영되어 화면에 뜬다.
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 27
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectCollectionViewCell", for: indexPath) as? SelectCollectionViewCell else {
            return UICollectionViewCell()
        }
        
//        cell.circleImageView.image = imageSetting[indexPath.row]
//        cell.characterUILabel.text = characterSetting[indexPath.row]
        cell.circleImageView.image = UIImage(named: characterList.character[indexPath.item].characterImage)
        cell.characterUILabel.text = characterList.character[indexPath.item].initnickname
        cell.characterUILabel.labelUIChanged()
        cell.characterUILabel.labelBorderChanged()
        return cell
    }

    //팝업창 띄우기 (present방식으로)
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        if (indexPath.item < 3) {
            //1. 스토리보드 파일찾기
            let sb = UIStoryboard(name: "Select", bundle: nil) //nil:기본 위치로 가져옴
            //2. 스토리보드 내에 있는 팝업뷰 컨트롤러 가져오기
            let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
                //2] 값 전달
//            vc.characterData = characterList.character[indexPath.item]
            //2) character 클릭된 위치 값 전달 (디테일뷰에서 변경하기/시작하기 클릭 시에 선택된 캐릭터 위치 값을 저장하기 위함)
            vc.characterIndex = indexPath.item
            
            
           //2) 값 전달(시작하기->변경하기)
            let changeTama = "변경하기"
            if navigationItem.title == "다마고치 \(changeTama)" {
                print("should be changed")
                vc.btnTitle = "\(changeTama)"
            }
            //3. 팝업 띄우기
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true, completion: nil)
        } else {
            noaccessAlert()
        }
            
    }
    
//    //컬렉션뷰 이미지 가져오기(초기 세팅)
//    func initImageSetting() {
//        for j in 1...3 {
//            print("\(j)-6")
//            let image123 = UIImage(named: "\(j)-6")!
//            imageSetting.append(image123)
//        }
//        for i in 3...27 {
//            let noimage = UIImage(named: "noImage")!
//            imageSetting.append(noimage)
//        }
//    }
//
//    func initCharacterSetting() {
//        for k in 1...3 {
//            let label123 = ["따끔따끔 다마고치", "방실방실 다마고치", "반짝반짝 다마고치"]
//            let labelSetting = label123[k-1]
//            characterSetting.append(labelSetting)
//        }
//        for i in 3...27 {
//            let nocharacter = "준비중이에요"
//            characterSetting.append(nocharacter)
//        }
//    }

}

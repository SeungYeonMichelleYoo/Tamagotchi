//
//  SelectCollectionViewController.swift
//  Tamagotchi
//
//  Created by SeungYeon Yoo on 2022/07/22.
//

import UIKit

private let reuseIdentifier = "Cell"

class SelectCollectionViewController: UICollectionViewController {
    var imageSetting: [UIImage] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initImageSetting()
        
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
        
        cell.circleImageView.image = imageSetting[indexPath.row]
        return cell
    }

    //팝업창 띄우기 (present방식으로)
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        //1. 스토리보드 파일찾기
        let sb = UIStoryboard(name: "Select", bundle: nil) //nil:기본 위치로 가져옴
        //2. 스토리보드 내에 있는 팝업뷰 컨트롤러 가져오기
        let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        //3. 팝업 띄우기
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: false, completion: nil)
    }
    
    //컬렉션뷰 이미지 가져오기(초기 세팅)
    func initImageSetting() {
        for j in 1...3 {
            print("\(j)-6")
            let image123 = UIImage(named: "\(j)-6")!
            imageSetting.append(image123)
        }
        for i in 3...27 {
            let noimage = UIImage(named: "noImage")!
            imageSetting.append(noimage)
        }
    }

}

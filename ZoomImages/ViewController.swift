//
//  ViewController.swift
//  ZoomImages
//
//  Created by KULDEP KUMAR PRAJAPATI on 03/09/20.
//  Copyright © 2020 KULDEP KUMAR PRAJAPATI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var imgData = [#imageLiteral(resourceName: "vashnodevi3"),#imageLiteral(resourceName: "vashnodevi1"),#imageLiteral(resourceName: "vashnodevi2"),#imageLiteral(resourceName: "vashnodevi4"),#imageLiteral(resourceName: "vashnodevi3"),#imageLiteral(resourceName: "vashnodevi1"),#imageLiteral(resourceName: "vashnodevi2"),#imageLiteral(resourceName: "vashnodevi3"),#imageLiteral(resourceName: "vashnodevi1"),#imageLiteral(resourceName: "vashnodevi2"),#imageLiteral(resourceName: "vashnodevi4"),#imageLiteral(resourceName: "vashnodevi3"),#imageLiteral(resourceName: "vashnodevi1"),#imageLiteral(resourceName: "vashnodevi2"),#imageLiteral(resourceName: "vashnodevi4")]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.image.layer.borderWidth = 1
        cell.image.layer.masksToBounds = false
        cell.image.layer.borderColor = UIColor.black.cgColor
        cell.image.layer.cornerRadius = cell.image.frame.height/2
        cell.image.clipsToBounds = true
        cell.image.image = imgData[indexPath.row]
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let imageInfo = GSImageInfo(image: imgData[indexPath.row], imageMode: .aspectFit)
        let transitionInfo = GSTransitionInfo(fromView: collectionView)
        let imageViewer = GSImageViewerController(imageInfo: imageInfo, transitionInfo: transitionInfo)
        imageViewer.dismissCompletion = {
            print("dismiss called")
        }
        present(imageViewer,animated: true)
    }
    
}


//below extension is if you want to show single row multiple item
extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth = collectionView.bounds.width
        return CGSize(width: collectionWidth/2, height: collectionWidth/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}


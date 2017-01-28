//
//  ArticlesViewController.swift
//  EdBinx
//
//  Created by Tushar Sharma on 11/08/16.
//  Copyright © 2016 edbinx. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ArticlesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, IndicatorInfoProvider {

    fileprivate var itemInfo:IndicatorInfo = "ALL"
    fileprivate let nib = UINib(nibName: "ArticlesCollectionViewCell", bundle: nil)
    fileprivate var flag = true
    fileprivate var cellToColor = Int()
    fileprivate let totalNumberOfItems = 13
    var array = [0]
    
    @IBOutlet weak var collection: UICollectionView!
    
    convenience init(itemInfo: IndicatorInfo) {
        self.init()
        self.itemInfo = itemInfo
        self.turnTables(itemInfo)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateIndexes()
        collection.register(ArticlesCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collection.register(nib, forCellWithReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
    }
    
    func calculateIndexes() {
        var indexValue = 0
        while indexValue < totalNumberOfItems {
            if indexValue%2 == 0 {
                indexValue = indexValue+3
                array.append(indexValue)
            } else {
                indexValue = indexValue+1
                array.append(indexValue)
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ArticlesCollectionViewCell
        cell.articleImage.image = UIImage(named:"")
        
        let indexPathNew = IndexPath(row: indexPath.row - 1, section:indexPath.section)
        let secondIndexPathNew = IndexPath(row:indexPath.row - 2, section:indexPath.section)
            print(indexPath.row, indexPathNew.row, secondIndexPathNew.row)
        
        if array.contains(indexPath.row) {
            cell.backgroundColor = getRandomColor()
            
        } else {
            cell.backgroundColor = .clear
            cell.articleTitle.textColor = .black
            cell.authorName.textColor = .black
            cell.articleImage.image = UIImage(named: "")
        }
        
        cell.articleCategory.backgroundColor = getRandomColor()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalNumberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        let numberOfCell: CGFloat = 2   //you need to give a type as CGFloat
        let cellWidth = UIScreen.main.bounds.size.width / numberOfCell
        return CGSize(width:cellWidth, height:cellWidth)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        updateCollectionViewLayout(with: size)
    }
    
    fileprivate func updateCollectionViewLayout(with size: CGSize) {
        if let layout = collection.collectionViewLayout as? UICollectionViewFlowLayout {
            let cellWidth = UIScreen.main.bounds.size.width / 2
            layout.itemSize = (size.width < size.height) ? CGSize(width:cellWidth, height:cellWidth): CGSize(width:cellWidth, height:cellWidth)
            layout.invalidateLayout()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func indicatorInfoForPagerTabStrip(_ pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
    
    func getRandomColor() -> UIColor{
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
    
    func turnTables(_ value:IndicatorInfo) {

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

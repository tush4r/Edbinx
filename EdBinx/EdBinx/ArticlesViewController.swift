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

    private var itemInfo:IndicatorInfo = "ALL"
    private let nib = UINib(nibName: "ArticlesCollectionViewCell", bundle: nil)
    private var flag = true
    private var cellToColor = Int()
    
    @IBOutlet weak var collection: UICollectionView!
    
    convenience init(itemInfo: IndicatorInfo) {
        self.init()
        self.itemInfo = itemInfo
        self.turnTables(value: itemInfo)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.register(ArticlesCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collection.register(nib, forCellWithReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = getRandomColor()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let items = 13
        return items
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let numberOfCell: CGFloat = 2   //you need to give a type as CGFloat
        let cellWidth = UIScreen.main.bounds.size.width / numberOfCell
        return CGSize(width:cellWidth, height:cellWidth)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        updateCollectionViewLayout(with: size)
    }
    
    private func updateCollectionViewLayout(with size: CGSize) {
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
    
    func turnTables(value:IndicatorInfo) {
        print("TURN THE TABLES", value.title)
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

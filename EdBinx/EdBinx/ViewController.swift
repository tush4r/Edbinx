//
//  ViewController.swift
//  EdBinx
//
//  Created by Tushar Sharma on 05/08/16.
//  Copyright © 2016 edbinx. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ViewController: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        settings.style.buttonBarItemTitleColor = .white
        buttonBarView.backgroundColor = UIColor(hex: ColorCodes().barColor())
        settings.style.buttonBarBackgroundColor = UIColor(hex: ColorCodes().navColor())
        settings.style.buttonBarItemLeftRightMargin = 20
        settings.style.buttonBarMinimumLineSpacing = 20
        settings.style.buttonBarItemLeftRightMargin = 20
        settings.style.buttonBarItemFont = UIFont(name: "Montserrat-Regular", size: 17)!
        buttonBarView.selectedBar.backgroundColor = UIColor(hex: ColorCodes().sliderColor())
    }

    override func viewControllersForPagerTabStrip(_ pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        return [ArticlesViewController(itemInfo:"ALL"), ArticlesViewController(itemInfo:"WORLD"), ArticlesViewController(itemInfo:"TECHNOLOGY"), ArticlesViewController(itemInfo: "SCIENCE")]
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

class NavController: UINavigationController {
}



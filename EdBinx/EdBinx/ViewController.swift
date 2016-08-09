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
        settings.style.buttonBarItemTitleColor = .white
        buttonBarView.backgroundColor = UIColor(hex: ColorCodes().barColor())
        settings.style.buttonBarBackgroundColor = UIColor(hex: ColorCodes().navColor())
        buttonBarView.selectedBar.backgroundColor = UIColor(hex: ColorCodes().sliderColor())
        super.viewDidLoad()
    }

    override func viewControllersForPagerTabStrip(_ pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        return [Base1ViewController(), Base2ViewController(), Base1ViewController(), Base2ViewController(), Base2ViewController(), Base1ViewController(), Base2ViewController()]
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

class NavController: UINavigationController {
}



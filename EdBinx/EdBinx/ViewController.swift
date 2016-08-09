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
        buttonBarView.selectedBar.backgroundColor = .orange
        buttonBarView.backgroundColor = UIColor(red: 7/255, green: 185/255, blue: 155/255, alpha: 1)
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



//
//  ViewController.swift
//  EdBinx
//
//  Created by Tushar Sharma on 05/08/16.
//  Copyright © 2016 edbinx. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ViewController: BarPagerTabStripViewController {

    override func viewDidLoad() {
        settings.style.selectedBarBackgroundColor = .orange
        super.viewDidLoad()
        navigationController?.navigationBar.addSubview(buttonBarView)
    }

    override func viewControllersForPagerTabStrip(_ pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        return [Base1ViewController(), Base2ViewController()]
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


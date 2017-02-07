//
//  Test1ViewController.swift
//  OCAndJavaScriptInteraction
//
//  Created by jointsky on 2017/2/7.
//  Copyright © 2017年 陈帆. All rights reserved.
//

import UIKit

class Test1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let nextButton = UIButton.init(frame: CGRect(x: 100, y: 100, width: 70, height: 30))
        nextButton.setTitle("下一个界面", for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonClick(sender:)), for: .touchUpInside)
        
        self.view.addSubview(nextButton)
    }
    
    @objc func nextButtonClick(sender: UIButton) {
        let viewController = UIViewController.init()
        viewController.view.backgroundColor = UIColor.green
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

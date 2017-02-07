//
//  ViewController.swift
//  OCAndJavaScriptInteraction
//
//  Created by jointsky on 2017/2/7.
//  Copyright © 2017年 陈帆. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    // MARK: 懒加载 web View
    fileprivate var webView: UIWebView = {
        let webViewTemp = UIWebView.init()
        
        webViewTemp.backgroundColor = UIColor.white
        
        return webViewTemp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setViewUI()
    }
    
    
    // MARK: - UIWebView delegate
    // MARK: did finish load
    func webViewDidFinishLoad(_ webView: UIWebView) {
        // 禁止用户选择
        webView.stringByEvaluatingJavaScript(from: "document.documentElement.style.webkitUserSelect='none';")
        
        // 禁止长按弹出选择框
        webView.stringByEvaluatingJavaScript(from: "document.documentElement.style.webkitTouchCallout='none';")
    }
    
    
    // MARK: should start load
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        let url = request.url
        let urlScheme = url?.scheme
        let host = url?.host
        
        if urlScheme == "action" && host == "jump"{
            let viewController = Test1ViewController.init()
            viewController.view.backgroundColor = UIColor.red
            
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController {
    fileprivate func setViewUI() {
        // webView
        self.webView.frame = self.view.frame
        self.webView.delegate = self
        self.view.addSubview(self.webView)
        
        // 加载自定义的网页
//        let url = Bundle.main.url(forResource: "index.html", withExtension: nil)
//        self.webView.loadRequest(URLRequest.init(url: url!))
        
        let resourcePath = Bundle.main.bundlePath.appending("") as NSString?
        
        let filePath = resourcePath?.appendingPathComponent("index.html")
        do {
            let htmlString = try String.init(contentsOfFile: filePath!, encoding: String.Encoding.utf8)
            
            self.webView.loadHTMLString(htmlString, baseURL: URL.init(fileURLWithPath: resourcePath as! String))
        } catch {}
        
        
        // navigation
        let rightBarBtnItem = UIBarButtonItem.init(title: "获取H5中内容", style: .plain, target: self, action: #selector(rightBarBtnItemClick(sender:)))
        self.navigationItem.rightBarButtonItem = rightBarBtnItem
        
    }
    
    
    @objc func rightBarBtnItemClick(sender: UIBarButtonItem) {
        let body = self.webView.stringByEvaluatingJavaScript(from: "getStringForEmail();")
        
        let alertController = UIAlertController.init(title: "提示", message: body, preferredStyle: .alert)
        
        let alertAction = UIAlertAction.init(title: "OK", style: .destructive) { (alertAction) in
            print("fhwhhwfw")
        }
        alertController.addAction(alertAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
}


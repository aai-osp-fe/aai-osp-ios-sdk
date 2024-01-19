//
//  ViewController.swift
//  osp_selfie
//
//  Created by loong on 01/17/2024.
//  Copyright (c) 2024 loong. All rights reserved.
//

import UIKit
import onestopSDK
class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var key_tf: UITextField!
    
    @IBOutlet weak var jid_tf: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        key_tf.delegate = self
        jid_tf.delegate = self
        
        OneStopManager.default.registerNode(name: .selfie, node: SelfieNode())
        
    }
    
    @IBAction func startBtnClick(_ sender: UIButton) {
        if let key = key_tf.text, !key.isEmpty, let id = jid_tf.text, !id.isEmpty {
            self.request_sdk_token(key: key, id: id)
        }
    }
    
    func request_sdk_token(key: String, id: String) {
        // 定义一个 URL
        let url = URL(string: "https://sandbox-oop-api.advai.net/intl/openapi/sdk/v2/trans/start")!
        // 创建一个任务
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        // 设置请求体
        request.allHTTPHeaderFields = [
            "X-ADVAI-KEY": key,
            "journeyId": id
        ]
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // 处理请求结果
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                // 如果请求成功，data 包含了返回的数据
                do {
                    if let dict = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                       let data = dict["data"] as? [String: Any],
                       let token = data["sdkToken"] as? String {
                        print("JSON Dictionary: \(token)")
                        DispatchQueue.main.async {
                            OneStopManager.default.ex_start(token: token, context: self)
                        }
                        
                    }
                    
                } catch {
                    print(error)
                }
                
            }
        }
        // 启动任务
        task.resume()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}


//
//  ViewController.swift
//  OSPSDK
//
//  Created by loong on 02/23/2024.
//  Copyright (c) 2024 loong. All rights reserved.
//

import UIKit
import Selfie

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var key_tf: UITextField!
    
    @IBOutlet weak var jid_tf: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        key_tf.delegate = self
        jid_tf.delegate = self
        
        key_tf.text = "d9eafc7f557afaf4"
        jid_tf.text = "55057"
        
        OneStopManager.default.registerNode(name: .selfie, node: SelfieNode())
//        OneStopManager.default.registerNode(name: .document, node: DocumentNode())
        OneStopManager.default.register(callbacker: CallBacker(onFinish: { status, para in
            print("work finish --- \(status), \(para)")
        }, onExit: { code, para in
            print("work exit --- \(code), \(para)")
        }))
        
        OneStopManager.default.ready()
        
    }
    
    @IBAction func startBtnClick(_ sender: UIButton) {
        guard let key = key_tf.text, !key.isEmpty else {
            tipLabel.text = "please input key..."
            return
        }
        
        guard let jid = jid_tf.text, !jid.isEmpty else {
            tipLabel.text = "please input journeyId...."
            return
        }
        
        if let key = key_tf.text, !key.isEmpty, let id = jid_tf.text, !id.isEmpty {
            sender.isEnabled = false
            self.request_sdk_token(key: key, id: id, completion: {
                sender.isEnabled = true
            })
        }
    }
    
    func request_sdk_token(key: String, id: String, completion: @escaping () -> Void) {
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
            DispatchQueue.main.async {
                completion()
            }
            // 处理请求结果
            if let error = error {
                print("Error: \(error)")
                DispatchQueue.main.async {
                    self.tipLabel.text = error.localizedDescription
                }
                
                
            } else if let data = data {
                // 如果请求成功，data 包含了返回的数据
                do {
                    let dict = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    if dict?["code"] as? String != "SUCCESS" {
                        DispatchQueue.main.async {
                            self.tipLabel.text = dict?["message"] as? String
                        }
                        return
                    }
                    
                    
                    if let data = dict?["data"] as? [String: Any],
                       let token = data["sdkToken"] as? String {
                        print("JSON Dictionary: \(token)")
                        DispatchQueue.main.async {
                            OneStopManager.default.ex_start(token: token, context: self)
                        }
                    }
                    
                } catch {
                    print(error)
                    DispatchQueue.main.async {
                        self.tipLabel.text = error.localizedDescription
                    }
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



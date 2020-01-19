//
//  ViewController.swift
//  ARDemo1(Swift)
//
//  Created by Anmo on 2020/1/17.
//  Copyright © 2020 com.Cingjin. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        // 设置 ARSCNViewDelegate 代理获取sceneView的渲染状态
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        // 性能统计属性
        sceneView.showsStatistics = true
        
        // Create a new scene
        // 从art.scnassets资源文件中读取资源文件ship.scn，把这个文件转换成一个名为scene的SCNScene实例
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
        // 将上面这个SCNScene实例设置为sceneView的scene，这样就加载了包含飞机的场景到真实世界中
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        // 初始化一个ARWorldTrackingConfiguration实例configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        // 用configuration实例运行ARSession对象
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        // 视图将要消失的时候停止这个session，pause和rung是成对出现
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}

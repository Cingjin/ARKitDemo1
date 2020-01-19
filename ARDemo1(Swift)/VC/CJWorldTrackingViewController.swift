//
//  CJWorldTrackingViewController.swift
//  ARDemo1(Swift)
//
//  Created by Anmo on 2020/1/19.
//  Copyright © 2020 com.Cingjin. All rights reserved.
//

import UIKit
import ARKit

class CJWorldTrackingViewController: UIViewController {
    
    // MARK: - 属性
    
    var sceneView : ARSCNView!    // 展示AR视图
    

    // MARK: - LiveCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.cj_addSubView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.cj_configuration()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        // 页面将要消失的时候暂时AR Session
        self.sceneView.session.pause()
        
    }
    
    // MARK: View
    
    func cj_addSubView() {
        
        // 初始化 sceneView
        sceneView = ARSCNView(frame: view.bounds)
        sceneView.delegate = self
        view.addSubview(sceneView)
    
    }
    
    // MARK: - Config
    
    func cj_configuration() {
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        // 创建ARWorldTrackingConfiguration实例运行AR Session
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        sceneView.session.run(configuration)
    }
}

extension CJWorldTrackingViewController: ARSCNViewDelegate {
 
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        
        // 1、判断当前新增的锚点类型
        guard anchor is ARPlaneAnchor else {return}
        // 2、检测到平面处添加box
        let box = SCNBox(width: 0.08, height: 0.08, length: 0.08, chamferRadius: 0.0)
        let boxNode = SCNNode(geometry: box)
        node.addChildNode(boxNode)
    
    }
    
}

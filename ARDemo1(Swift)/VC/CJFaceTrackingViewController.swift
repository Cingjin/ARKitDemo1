//
//  CJFaceTrackingViewController.swift
//  ARDemo1(Swift)
//
//  Created by Anmo on 2020/1/19.
//  Copyright © 2020 com.Cingjin. All rights reserved.
//

import UIKit
import ARKit

class CJFaceTrackingViewController: UIViewController {

    var sceneView : ARSCNView!
    
    // MARK: -LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sceneView = ARSCNView(frame: view.bounds)
        sceneView.delegate = self
        self.view.addSubview(sceneView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARFaceTrackingConfiguration()
        sceneView.session.run(configuration)
        
    }
}

extension CJFaceTrackingViewController: ARSCNViewDelegate {
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        
        // 1、判断anchor是否为ARFaceAnchor
        guard anchor is ARFaceAnchor else {return}
        
        // 2、在检测到人脸处添加 box
        let box = SCNBox(width: 0.08, height: 0.08, length: 0.08, chamferRadius: 0.0)
        let boxNode = SCNNode(geometry: box)
        
        node.addChildNode(boxNode)
    }
    
}

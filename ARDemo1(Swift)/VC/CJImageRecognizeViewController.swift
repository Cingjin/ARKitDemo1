//
//  CJImageRecognizeViewController.swift
//  ARDemo1(Swift)
//
//  Created by Anmo on 2020/1/19.
//  Copyright © 2020 com.Cingjin. All rights reserved.
//

import UIKit
import ARKit

class CJImageRecognizeViewController: UIViewController {
    
    var sceneView : ARSCNView!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sceneView = ARSCNView(frame: view.bounds)
        sceneView.delegate = self
        self.view.addSubview(sceneView)
 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else {
            fatalError("AR Resources 资源文件不存在。")
        }
        
         let configuration = ARWorldTrackingConfiguration()
        configuration.detectionImages = referenceImages
        // 进行AR会话
        sceneView.session.run(configuration)
    }
}

extension CJImageRecognizeViewController: ARSCNViewDelegate {
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
    
        // 1、判断anchor是否为ARImageAnchor
        guard let imageAnchor = anchor as? ARImageAnchor  else {return}
        
        // 2、在检测到的物体图像添加plane
        let referenceImage = imageAnchor.referenceImage
        let plane = SCNPlane(width: referenceImage.physicalSize.width,
                             height: referenceImage.physicalSize.height)
        
        let planeNode = SCNNode(geometry: plane)
        planeNode.eulerAngles.x = -.pi / 2
        
        // 3、将plane添加到检测的图像锚点处
        node.addChildNode(planeNode);
    }
}

//
//  ViewController.swift
//  ARDicee
//
//  Created by SAMUEL SAMPENE AMPOFO on 26/08/2020.
//  Copyright © 2020 Neos Innovations. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    var diceArray = [SCNNode]()
    
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        
        // Set the view's delegate
        sceneView.delegate = self
        
//        //let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
//        let sphere = SCNSphere(radius: 0.2)
//        let  material = SCNMaterial()
//
//        material.diffuse.contents = UIImage(named: "art.scnassets/8k_moon.jpg")
//        sphere.materials = [material]
//
//        let node = SCNNode()
//        node.position = SCNVector3(x: 0, y: 0.1, z: -0.5)
//        node.geometry = sphere
//        sceneView.scene.rootNode.addChildNode(node)
        
        sceneView.autoenablesDefaultLighting = true
        
        // Create a new scene
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    
   
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            let touchLocation = touch.location(in: sceneView)
            let results = sceneView.hitTest(touchLocation, types: .existingPlaneUsingExtent)
            
            if let hitResult = results.first {
               addDice(atLocation : hitResult)
        }
        
    }
}
    
func addDice(atLocation location : ARHitTestResult){
            
            let diceScene = SCNScene(named: "art.scnassets/diceCollada.scn")!

            if let diceNode = diceScene.rootNode.childNode(withName: "Dice", recursively: true){
            diceNode.position = SCNVector3(
                x: location.worldTransform.columns.3.x,
                y: location.worldTransform.columns.3.y + diceNode.boundingSphere.radius,
                z: location.worldTransform.columns.3.z)
                
              diceArray.append(diceNode)
                
            // Set the scene to the view
            sceneView.scene.rootNode.addChildNode(diceNode)
                roll(dice: diceNode)
        }
    }
    
    func roll(dice: SCNNode){
           
               let randomX = Float(arc4random_uniform(4) + 1) * (Float.pi/2)
               let randomZ = Float(arc4random_uniform(4) + 1) * (Float.pi/2)
               
               dice.runAction(SCNAction.rotateBy(x: CGFloat(randomX * 5),
                                                     y: 0,
                                                     z: CGFloat(randomZ * 5),
                                                     duration: 0.5)
               )
           }
    
    func rollAll() {
        if !diceArray.isEmpty {
            for dice in diceArray {
                roll(dice:dice)
            }
        }
    }
    
    
    
    @IBAction func rollAgain(_ sender: UIBarButtonItem) {
        rollAll()
    }
    
    
    
    @IBAction func removeALLDice(_ sender: UIBarButtonItem) {
        
        if !diceArray.isEmpty {
            for dice in diceArray {
                dice.removeFromParentNode()
            }
        }
       
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        rollAll()
    }
    
    
    //MARK: - did  ARC View delegate
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchore = anchor as? ARPlaneAnchor else{return}
        let planNode = createPlane(withARPlaneAnchor: planeAnchore)
        node.addChildNode(planNode)
        }
    

    func createPlane(withARPlaneAnchor planAnchore: ARPlaneAnchor) -> SCNNode {
        
        let plane = SCNPlane(width: CGFloat(planAnchore.extent.x) , height: CGFloat(planAnchore.extent.z))

        let planNode = SCNNode()
        planNode.position = SCNVector3(x: planAnchore.center.x, y: 0, z: planAnchore.center.z)
        planNode.transform = SCNMatrix4MakeRotation(-Float.pi/2, 1, 0, 0)

        let gridMaterial = SCNMaterial()
        gridMaterial.diffuse.contents = UIImage(named: "art.scnassets/grid.png")
        plane.materials = [gridMaterial]

        planNode.geometry = plane
        
        return planNode
        
    }

    
  
}
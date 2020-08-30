//
//  ViewController.swift
//  newSeeFood
//
//  Created by SAMUEL SAMPENE AMPOFO on 02/08/2020.
//  Copyright © 2020 Neos Innovations. All rights reserved.
//

import UIKit
import CoreML
import Vision
import Social

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
    }

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let userPickedImage  = info[UIImagePickerController.InfoKey.originalImage ] as? UIImage {
            imageView.image = userPickedImage
            guard let ciimage =  CIImage(image: userPickedImage) else {
                fatalError("loading Could not convert to aciImage")
            }
            detect(image: ciimage)
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }

    func detect(image: CIImage){
        guard let model =  try? VNCoreMLModel(for: Inceptionv3().model) else {
            fatalError("loading Core Model fata error")
        }
        let request = VNCoreMLRequest(model: model) { (request, error) in
           guard let results = request.results as? [VNClassificationObservation] else {
            fatalError("model failed to process image")
            }
            if let firstResult = results.first {
                if firstResult.identifier.contains("hotdog !!"){
                    self.navigationItem.title = "HotDog"
                }
                else {
                   self.navigationItem.title = "Not HotDog!"
                }
            }
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        do {
            try handler.perform([request]) }
        catch {
            print(error)
        }
    }
    
    
    
    @IBAction func cameraTaped(_ sender: UIBarButtonItem) {
         present( imagePicker, animated: true, completion: nil)
        
    }
    
    
    

}


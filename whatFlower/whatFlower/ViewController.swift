//
//  ViewController.swift
//  whatFlower
//
//  Created by SAMUEL SAMPENE AMPOFO on 04/08/2020.
//  Copyright © 2020 Neos Innovations. All rights reserved.
//

import UIKit
import Vision
import CoreML
import Social
import Alamofire
import SwiftyJSON
import SDWebImage


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    let wikipediaURl = "https://en.wikipedia.org/w/api.php"
    let imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
          imagePicker.delegate = self
          imagePicker.sourceType = .camera
          imagePicker.allowsEditing = true
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        if let userPickedImage  = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
       
            guard let ciimage =  CIImage(image: userPickedImage) else {
                fatalError("loading Could not convert to aciImage")
            }
            
            //print(ciimage)
            detect(image: ciimage)
            
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
    func detect(image: CIImage){
        guard let model =  try? VNCoreMLModel(for: FlowerClassifier().model) else {
            fatalError("loading Core Model fata error")
        }
        let request = VNCoreMLRequest(model: model) { (request, error) in
           guard let results = request.results as? [VNClassificationObservation] else {
            fatalError("model failed to process image")
            }
            if let firstResult = results.first {
                print(firstResult.identifier)
                if firstResult.identifier != ""{
                    self.navigationItem.title = firstResult.identifier.capitalized
                    self.requestInfo(flowerName: firstResult.identifier)
        
                }
                else {
                   self.navigationItem.title = "None Classified "
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
    
    
    func requestInfo(flowerName: String){
       
        let parameters : [String:String] = [
        "format" : "json",
        "action" : "query",
        "prop" : "extracts|pageimages",
        "exintro" : "",
        "explaintext" : "",
        "titles" : flowerName,
        "indexpageids" : "",
        "redirects" : "1",
        "pithumbsize": "500"
        ]

        
        Alamofire.request(wikipediaURl, method: .get, parameters: parameters).responseJSON
            { (response) in
                if response.result.isSuccess {
                    print("go the wikipedia infor")
                    
                    print(response)
                    
                    let flowerJSON : JSON = JSON(response.value!)
                    let pageid = flowerJSON["query"]["pageids"][0].stringValue
                    let flowerDescription = flowerJSON["query"]["pages"][pageid]["extract"].stringValue
                    
                    let floerImageURL = flowerJSON["query"]["pages"][pageid]["thumbnail"]["source"].stringValue
                    
                    self.imageView.sd_setImage(with: URL(string: floerImageURL))
                    self.label.text = flowerDescription
                }
        }
    }
    
    
    
    
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        present(imagePicker, animated: true, completion: nil)
    }
    
}


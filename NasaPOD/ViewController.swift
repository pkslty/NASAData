//
//  ViewController.swift
//  NasaPOD
//
//  Created by Denis Kuzmin on 09.03.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textview: UITextView!
    
    
    //var data: NasaData?
    //var image: UIImage?
    
    @objc func handleTapGesture(){
            performSegue(withIdentifier: "showSecondController", sender: nil)
        }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTapGesture))
        drawimage.addGestureRecognizer(tap)
        
        
        
        let JSON = #"{"date":"2021-02-27","explanation":"Seen from orbit a day after a dramatic arrival on the martian surface, the Perseverance landing site is identified in this high-resolution view from the Mars Reconnaissance Orbiter. The orbiter's camera image also reveals the location of the Mars 2020 mission descent stage, heat shield, and parachute and back shell that delivered Perseverance to the surface of Mars.  Each annotated inset box spans 200 meters (650 feet) across the floor of Jezero Crater. Perseverance is located at the center of the pattern created by rocket exhaust as the descent stage hovered and lowered the rover to the surface. Following the sky crane maneuver, the descent stage itself flew away to crash at a safe distance from the rover, its final resting place indicated by a dark V-shaped debris pattern. Falling to the surface nearby after their separation in the landing sequence, heat shield, parachute and back shell locations are marked in the high-resolution image from Mars orbit.","hdurl":"https://apod.nasa.gov/apod/image/2102/PIA24333_fig1.jpg","media_type":"image","service_version":"v1","title":"Perseverance Landing Site from Mars Reconnaissance Orbiter","url":"https://apod.nasa.gov/apod/image/2102/PIA24333_fig1_1035c.jpg"}"#

        let jsonData = JSON.data(using: .utf8)!
        //let data: NasaData = try! JSONDecoder().decode(NasaData.self, from: jsonData)

        /*print(data.date)
        print(data.explanation)
        print(data.hdurl)
        print(data.title)
        print(data.url)
        let decoder = JSONDecoder()*/
        print(jsonData)
        let urls = URL(string: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY")!
        let jsndatd = try! Data(contentsOf: URL(string: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY")!)

        //let data: NasaData
        
        NasaData.sharedInstance = try! JSONDecoder().decode(NasaData.self, from: jsndatd)
        print(jsndatd)
        print(NasaData.sharedInstance.date)
        print(NasaData.sharedInstance.explanation)
        print(NasaData.sharedInstance.hdurl)
        print(NasaData.sharedInstance.title)
        print(NasaData.sharedInstance.url)

        let urld = URL(string: "https://apod.nasa.gov/apod/image/2102/PIA24333_fig1_1035c.jpg")!
        let imdata = try! Data(contentsOf: NasaData.sharedInstance.url!)
        let image1 = UIImage(data: imdata)
        drawimage.image = image1
        textview.text = NasaData.sharedInstance.explanation!
        textview.textColor = UIColor.red
        
        let task = URLSession.shared.dataTask(with: urls) { ddata, response, error in
            if let error = error {
                print("ERROR")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                //self.handleServerError(response)
                print("BAD RESPONSE")
                return
            }
            /*if let mimeType = httpResponse.mimeType, mimeType == "text/html",
                let data = data,
                let string = String(data: data, encoding: .utf8) {
                DispatchQueue.main.async {
                    //self.webView.loadHTMLString(string, baseURL: url)
                    
                }
            }*/
            //DispatchQueue.main.async {
            NasaData.sharedInstance = try! JSONDecoder().decode(NasaData.self, from: ddata!)
                print(NasaData.sharedInstance)
            
            
        }
        task.resume()
        
    }
    

    @IBOutlet weak var drawimage: UIImageView!
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowImage"
        {
            if let destinationVC = segue.destination as? SecindViewController {
                //destinationVC.image = image
            }
        }
    }*/
    
}


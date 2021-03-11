//
//  SecondController.swift
//  NasaPOD
//
//  Created by Denis Kuzmin on 11.03.2021.
//

import UIKit

class SecondController: UIViewController {

    @IBOutlet weak var bigImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let imdata = try! Data(contentsOf: NasaData.sharedInstance.url!)
        let image1 = UIImage(data: imdata)
        bigImage.image = image1
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  DetailVC.swift
//  Task6p
//
//  Created by Usha Juttu on 26/5/19.
//  Copyright © 2019 Usha Juttu. All rights reserved.
//

import UIKit

    

class DetailVC: UIViewController {
    
    
    @IBOutlet weak var alpha3: UILabel!
    

    @IBOutlet weak var region: UILabel!
    
    
    @IBOutlet weak var subregion: UILabel!
    
    var saplha3 = ""
    var sregion = ""
    var ssub = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alpha3.text = saplha3
        region.text = sregion
        subregion.text = ssub

        // Do any additional setup after loading the view.
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

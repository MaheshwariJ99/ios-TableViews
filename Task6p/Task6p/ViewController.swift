//
//  ViewController.swift
//  Task6p
//
//  Created by Usha Juttu on 26/5/19.
//  Copyright © 2019 Usha Juttu. All rights reserved.
//

import UIKit
struct jsonstruct:Decodable{
    let name: String
    let alpha2Code:String
    let alpha3Code:String
    let region:String
    let subregion:String
}
class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    var arraydata = [jsonstruct]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getdata()
    }
    func getdata(){
        let url = URL(string: "https://restcountries.eu/rest/v2/all")
        URLSession.shared.dataTask(with: url!) { (data, resp, error) in
            do{if error == nil {
                
                self.arraydata = try JSONDecoder().decode([jsonstruct].self, from: data!)
                for firstArray in self.arraydata{
                    print(firstArray.name,":", firstArray.alpha2Code,":")
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        
                    }
                }
                }
            }
            catch{
                print("Error found")
            }
            }
            .resume()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arraydata.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:firstTVC = tableView.dequeueReusableCell(withIdentifier: "cell") as! firstTVC
        cell.Lable1.text = "Name :\(arraydata[indexPath.row].name)"
        cell.Lable2.text = "alpha2 :\(arraydata[indexPath.row].alpha2Code)"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = self.storyboard?.instantiateViewController(withIdentifier: "detail") as! DetailVC
        detail.saplha3 = "alpha3:\(arraydata[indexPath.row].alpha3Code)"
       detail.sregion = "Subregion:\(arraydata[indexPath.row].region)"
       detail.ssub = "Code2:\(arraydata[indexPath.row].subregion)"
    self.navigationController?.pushViewController(detail, animated:true)

        //performSegue(withIdentifier: "seg1", sender: self)
    }
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      //  if (segue?.identifier == "seg1") {
            //let nav = segue?.destinationViewController as! UINavigationController
            //let svc = nav.topViewController as! SearchViewController
            //svc.toPassSearchKeyword = searchKeyword;
        //if let dest = segue.destination as? DetailVC {
            //dest.saplha3 = arraydata[(tableView.indexPathForSelectedRow?.row)!]
           
            //dest.sregion = "region:\(arraydata[indexPath.row].region)"
           //dest.ssub = "alpha3:\(arraydata[indexPath.row].subregion)"
            
       // tableView.deselectRow(at: arraydata.indexPathForSelectedRow!, animated: true)
     //  }
//}
}


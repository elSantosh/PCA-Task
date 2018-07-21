//
//  accountsViewController.swift
//  PCA-Task
//
//  Created by Santosh Guruju | MACROKIOSK on 17/07/18.
//  Copyright © 2018 workstreak. All rights reserved.
//

import UIKit

class accountsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var resultArray = NSMutableArray()
    var transactionAPI = String()
    var accName = String()
    var accNum = String()
    var accAmount = String()
    
    let tableView: UITableView = UITableView()
    let prefs = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //hide back button
        navigationItem.hidesBackButton = true
        
        
        
        //tableview setup
        
        tableView.frame = self.view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        
        // receive head data with Userdefaults
        self.accName = (prefs.value(forKey: "accName") as! String?)!
        self.accNum = (prefs.value(forKey: "accNum") as! String?)!
        self.accAmount = (prefs.value(forKey: "accAmount") as! String?)!
        // receive body data
        let dataFromSummaryDict:NSDictionary = prefs.value(forKey: "summaryArrayData") as! NSDictionary
        self.transactionAPI =  dataFromSummaryDict.value(forKey: "transactions") as! String
        
        
        //call remote API
        self.getRequest(urlString: self.transactionAPI)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //table view protocol methods setup
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultArray.count+1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row == 0)
        {
            return 150
        }
        else{
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "accCell")
        cell.selectionStyle = .none
        
        if indexPath.row==0 {
            //Header cell UI setup
            let randomImgArray = ["sampleAccountImage01", "sampleAccountImage02", "sampleAccountImage03", "sampleAccountImage04","sampleAccountImage05"]
            //            let randowOrientation  = [".up",".upMirrored",".down",".downMirrored",".left",".leftMirrored",".right",".rightMirrored"]
            let randomIndex = Int(arc4random_uniform(UInt32(randomImgArray.count)))
            let imgStr:String = randomImgArray[randomIndex]
            //            let orientationStr:UIImageOrientation  = randowOrientation[randomIndex] as UIImageOrientation
            let backgroundImage = UIImageView()
            let image = UIImage(named: imgStr)
            backgroundImage.image = UIImage(cgImage: (image?.cgImage!)!, scale: (image?.scale)!, orientation: .downMirrored)
            cell.backgroundView = backgroundImage
            //overlay setup
            let ovelayFrame = CGRect(x: 0, y: 50, width: UIScreen.main.bounds.size.width, height: 100)
            let overlay = UIView(frame: ovelayFrame)
            overlay.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
            //labels setup
            let accLbl1Frame = CGRect(x: 40, y: 60, width: 350, height: 50)
            let accLbl1 = UILabel(frame: accLbl1Frame)
            accLbl1.font = UIFont.systemFont(ofSize: 18)
            accLbl1.textColor = UIColor.white
            accLbl1.text = "On Call Savings"
            
            let accLbl2Frame = CGRect(x: 40, y: 80, width: 100, height: 50)
            let accLbl2 = UILabel(frame: accLbl2Frame)
            accLbl2.font = UIFont.systemFont(ofSize: 14)
            accLbl2.textColor = UIColor.white
            accLbl2.text = "30755S1"
            
            let accLbl3Frame = CGRect(x: 40, y: 100, width: 100, height: 50)
            let accLbl3 = UILabel(frame: accLbl3Frame)
            accLbl3.font = UIFont.systemFont(ofSize: 18)
            accLbl3.textColor = UIColor.white
            accLbl3.text = "$541.12"
            
            let accLbl4Frame = CGRect(x: accLbl3.frame.size.width+20, y: 100, width: 100, height: 50)
            let accLbl4 = UILabel(frame: accLbl4Frame)
            accLbl4.font = UIFont.systemFont(ofSize: 14)
            accLbl4.textColor = UIColor.white
            accLbl4.text = "Available"
            //arrow images setup
            let arw1Frame = CGRect(x: 10, y: 90, width: 30, height: 40)
            let arwImage1 = UIImageView(frame: arw1Frame)
            arwImage1.image = UIImage(named: "TopRot_arrowLeft")
            arwImage1.image = arwImage1.image?.imageWithColor(color: .white)
            
            let arw2Frame = CGRect(x: UIScreen.main.bounds.width-30, y: 90, width: 30, height: 40)
            let arwImage2 = UIImageView(frame: arw2Frame)
            arwImage2.image = UIImage(named: "TopRot_arrowRight")
            arwImage2.image = arwImage2.image?.imageWithColor(color: .white)
            
            //add info button or accessory button
            let infoBtnFrame = CGRect(x: UIScreen.main.bounds.width-40, y: 10, width: 30, height: 30)
            let infoBtn = UIButton(type: .infoDark)
            infoBtn.tintColor = UIColor.white
            infoBtn.frame = infoBtnFrame
            
            //set remote data
            accLbl1.text = self.accName
            accLbl2.text = self.accNum
            accLbl3.text = self.accAmount
            
            //addinng subviews to the cell
            backgroundImage.addSubview(infoBtn)
            cell.addSubview(overlay)
            cell.addSubview(accLbl1)
            cell.addSubview(accLbl2)
            cell.addSubview(accLbl3)
            cell.addSubview(accLbl4)
            cell.addSubview(arwImage1)
            cell.addSubview(arwImage2)
            
            return cell
        }
        else{
            //rest of the cell UI setup
            
            //labels setup
            let trnLbl1Frame = CGRect(x: 15, y: -5, width: 350, height: 50)
            let trnLbl1 = UILabel(frame: trnLbl1Frame)
            trnLbl1.font = UIFont.systemFont(ofSize: 12)
            trnLbl1.textColor = UIColor.gray
            trnLbl1.text = ""
            
            let trnLbl2Frame = CGRect(x: 17, y: 10, width: 280, height: 100)
            let trnLbl2 = UILabel(frame: trnLbl2Frame)
            trnLbl2.font = UIFont.systemFont(ofSize: 16)
            trnLbl2.textColor = UIColor.black
            trnLbl2.text = "TFR TO 012345 12345678\nMOB To-TEST DES BSB Ref-Testing Testing [Eff Date: 26 MAR 18]"
            trnLbl2.lineBreakMode = NSLineBreakMode.byWordWrapping
            trnLbl2.numberOfLines = 3
            
            let trnLbl3Frame = CGRect(x: UIScreen.main.bounds.width-80, y: 30, width: 100, height: 50)
            let trnLbl3 = UILabel(frame: trnLbl3Frame)
            trnLbl3.font = UIFont.systemFont(ofSize: 18)
            trnLbl3.textColor = UIColor.black
            trnLbl3.text = "-$12.00"
            
            //assign remote data
            if (resultArray.count > 0){
                
                var dict = NSDictionary()
                dict = resultArray.object(at: indexPath.row-1) as! NSDictionary
                var checkDict = NSDictionary()
                
                //check previous cell date
                if (indexPath.row >= 2)
                {
                    
                    checkDict = resultArray.object(at: indexPath.row-2) as! NSDictionary
                    let previousCellDate = self.formatDate(dateString: checkDict.value(forKey: "date") as! String)
                    let thisCellDate = self.formatDate(dateString: dict.value(forKey: "date") as! String)
                    let isEqual = (previousCellDate == thisCellDate)
                    if isEqual
                    {
                        trnLbl1.text = ""
                    }
                    else
                    {
                        trnLbl1.text = self.formatDate(dateString: dict.value(forKey: "date") as! String)
                    }
                }
                else{
                    trnLbl1.text = self.formatDate(dateString: dict.value(forKey: "date") as! String)
                }
                trnLbl2.text = dict.value(forKey: "description") as? String
                
                //calling objective c method from summaryViewController.h
                let summVarIni = summaryViewController()
                trnLbl3.text = summVarIni.format(toDollars: String(format: "%@", dict.value(forKey: "amount") as! CVarArg));
                
            }
            
            //add subviews to the cell
            cell.addSubview(trnLbl1)
            cell.addSubview(trnLbl2)
            cell.addSubview(trnLbl3)
            
            return cell
        }
        
    }
    //date format medthod
    func formatDate(dateString : String) -> String{
        var resultDate = String ()
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd MMMM yyyy"
        
        if let date = dateFormatterGet.date(from: dateString){
            resultDate = dateFormatterPrint.string(from: date)
        }
        else {
            print("There was an error decoding the string")
        }
        return resultDate
    }
    
    //remote API get request method
    func getRequest(urlString : String) -> Void {
        
        let getUrl = URL(string: urlString)
        let request = NSURLRequest(url: getUrl!)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {                // the data is returned in JSON format and needs to be converted into something that swift can work with
                // we are converting it into a dictionary of type [String: Any]
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    self.resultArray = json["transactions"] as! NSMutableArray
                    
                }
            } catch let error {
                print(error.localizedDescription)
            }
            DispatchQueue.main.sync {
                self.tableView.reloadData()
            }
        })
        self.tableView.reloadData()
        task.resume()
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
}
//Image tint color extension 
@objc extension UIImage {
    func imageWithColor(color: UIColor) -> UIImage? {
        var image = withRenderingMode(.alwaysTemplate)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        color.set()
        image.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}





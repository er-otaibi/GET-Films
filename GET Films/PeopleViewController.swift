//
//  ViewController.swift
//  GET Films
//
//  Created by Mac on 16/05/1443 AH.
//

import UIKit

class PeopleViewController: UITableViewController {
    
    var people : People?
    
    var person = [String]()
    var name = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        gatData()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return  person.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PeopleCell" , for: indexPath)
        // set the default cell label to the corresponding element in the people array
        cell.textLabel?.text = person[indexPath.row]
        // return the cell so that it can be rendered
        return cell
        
    }
    
    
    func gatData() {
        
        for i in 1...9 {
            
            // specify the url that we will be sending the GET request to
            
            let url = URL(string: "https://swapi.dev/api/people/?page=\(i)&format=json")
            
            let session = URLSession.shared
                        
            let task = session.dataTask(with: url!, completionHandler: {
                // see: Swift closure expression syntax
                data, response, error in
                print("in here")
                
                // see: Swift nil coalescing operator (double questionmark)
                print(data ?? "no data") // the "no data" is a default value to use if data is nil
                
                guard let myData = data else { return }
                do {
                    
                    let decoder = JSONDecoder()
                    let jsonResult = try decoder.decode(People.self, from: myData)
                    self.people = jsonResult
                    
                    let num = self.people?.results.count
                    for i in 0...num! - 1  {
                        print(self.people!.results[i].name)
                        self.name = self.people!.results[i].name
                        self.person.append(self.name)
                        
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    print(error)
                }
            })
            // execute the task and then wait for the response
            // to run the completion handler. This is async!
            task.resume()
            tableView.dataSource = self
            
        }// for loop
    } // end func
}



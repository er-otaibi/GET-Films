//
//  FilmTableViewController.swift
//  GET Films
//
//  Created by Mac on 16/05/1443 AH.
//

import UIKit

class FilmTableViewController: UITableViewController {

    var film : Film?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gatData()
      
    }

 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
         return film?.results.count ?? 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmCell" , for: indexPath)
        // set the default cell label to the corresponding element in the people array
        cell.textLabel?.text = film?.results[indexPath.row].title
        // return the cell so that it can be rendered
        return cell
        
    }
    
    
    func gatData() {
      
            // specify the url that we will be sending the GET request to
            
            let url = URL(string: "https://swapi.dev/api/films/?format=json")
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
                                    let jsonResult = try decoder.decode(Film.self, from: myData)
                                    self.film = jsonResult
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
        }
        
    
}

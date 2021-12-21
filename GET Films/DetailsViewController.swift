//
//  DetailsViewController.swift
//  GET Films
//
//  Created by Mac on 17/05/1443 AH.
//

import UIKit

class DetailsViewController: UIViewController {

    var film: ResultFilm?
    var people : ResultPeople?
    
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Label3: UILabel!
    @IBOutlet weak var Label4: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

       
        if let film = film {
            
            Label1.text = film.title
            Label2.text = film.releaseDate
            Label3.text = film.director
            Label4.text = film.openingCrawl
        }
        
        if let people = people {
            
            Label1.text = people.name
            Label2.text = people.gender
            Label3.text = people.birthYear
            Label4.text = people.mass
        }
    }
    
}

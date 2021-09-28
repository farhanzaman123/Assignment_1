//
//  MovieDetailViewController.swift
//  flixster
//
//  Created by farhan zaman on 9/27/21.
//

import UIKit
import AlamofireImage
class MovieDetailViewController: UIViewController {
    
   
    @IBOutlet weak var backdropview: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    
    var movie:[String:Any]!

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text=movie["title"] as? String
        synopsisLabel.text=movie["overview"] as? String
        synopsisLabel.sizeToFit()
        
        let baseUrl="https://image.tmdb.org/t/p/w185/"
        let poster_path=movie["poster_path"] as! String
        let posterUrl=URL(string: baseUrl+poster_path)
        posterView.af.setImage(withURL: posterUrl!)
        
        let backdropPath=movie["backdrop_path"] as! String
        let backdropUrl=URL(string:"https://image.tmdb.org/t/p/w780/"+backdropPath)
        backdropview.af.setImage(withURL: backdropUrl!)
        

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

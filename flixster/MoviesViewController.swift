//
//  MoviesViewController.swift
//  flixster
//
//  Created by farhan zaman on 9/15/21.
//

import UIKit
import AlamofireImage

class MoviesViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    
    @IBOutlet weak var TableView: UITableView!
    var Movies=[[String:Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.rowHeight = 150
        TableView.dataSource=self
        TableView.delegate=self
        

        // Do any additional setup after loading the view.
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { [self] (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                self.Movies=dataDictionary["results"] as! [[String:Any]]
                print(dataDictionary)
                self.TableView.reloadData()

                    // TODO: Get the array of movies
                    // TODO: Store the movies in a property to use elsewhere
                    // TODO: Reload your table view data

             }
        }
        task.resume()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        let movie=Movies[indexPath.row]
        let title=movie["title"] as! String
        let synopsis=movie["overview"] as! String
        cell.titleLabel.text=title
        cell.synopsisLabel.text=synopsis
        let baseUrl="https://image.tmdb.org/t/p/w185/"
        let poster_path=movie["poster_path"] as! String
        let posterUrl=URL(string: baseUrl+poster_path)
        cell.posterView.af.setImage(withURL:posterUrl!)
        return cell
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

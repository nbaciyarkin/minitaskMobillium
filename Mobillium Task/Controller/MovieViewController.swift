//
//  ViewController.swift
//  Mobillium Task
//
//  Created by Yarkın Gazibaba on 11.05.2022.
//

import UIKit

class MovieViewController: UIViewController {
    
    private var movies = ["HARRY POTTER 1","MOCKING BIRD","LOST","CHUCK","SUPERNATURAL","SONIC","SONIC 2","WHITE FOOTBALL","RED KIT","3 IDIOTS"]
   
    private let movieFeedTable : UITableView = {
       let table  = UITableView(frame: .zero, style: .grouped)
       table.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
       return table
    }()

    override func viewDidLoad() {
       super.viewDidLoad()
       
       view.backgroundColor = .systemBackground
       title = "Movies"
       
       view.addSubview(movieFeedTable)
       
       movieFeedTable.delegate = self
       movieFeedTable.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        movieFeedTable.frame = view.bounds
    }
}

extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return movies.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as? MovieTableViewCell else {
           return UITableViewCell()
       }
       let movieName = movies[indexPath.row]
       cell.configure(with: movieName)
       return cell
   }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        let alertController = UIAlertController(title: movie, message: "The movie is" + movie, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Okey", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}




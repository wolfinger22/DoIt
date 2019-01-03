//
//  ViewController.swift
//  DoIt
//
//  Created by Wolf Wittmund on 2019-01-03.
//  Copyright © 2019 Wolf Wittmund. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    tasks = makeTasks()
        
    tableView.dataSource = self
    tableView.delegate = self
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
            cell.textLabel?.text = "❗️\(task.name)"
        } else {
            cell.textLabel?.text = task.name
        }
        return cell
    }
    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.name = "walk the dog"
        task1.important = false

        let task2 = Task()
        task2.name = "go shopping"
        task2.important = true
        
        let task3 = Task()
        task3.name = "buy gift"
        task3.important = false
        
        return [task1, task2, task3]
    }

    @IBAction func addButton(_ sender: Any) {
    performSegue(withIdentifier: "AddSegue", sender: nil)
    }
    
    
}


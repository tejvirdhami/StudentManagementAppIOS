//
//  StudentListViewController.swift
//  testExam
//
//  Created by Tejvir  Dhami on 2021-10-25.
//

import UIKit

class StudentListViewController: UIViewController , UITableViewDelegate, UITableViewDataSource  {
   
    
    @IBOutlet weak var lblUsername: UILabel!
    
    public var data : String = ""
    
    private var selectedRow : Int = 0
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func btnRefresh(_ sender: Any) {
        tableView.reloadData()
    }
    
    
    
    
    
    override func viewDidLoad() {
        lblUsername.text = data
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StudentProvider.allStudents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //index.row
        cell.textLabel!.text = StudentProvider.allStudents[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // This medthod is dispatched when the user clicks a row!
        self.selectedRow = indexPath.row
        
        //Call a segue to open StudentInfoViewController in editMode
        performSegue(withIdentifier: Segues.toEditStudent, sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == Segues.toEditStudent){
            
            //Creating a let to point StudentListViewController Conroller
            let StudentInfoViewController = segue.destination as! StudentInfoViewController
            
            //We will send the object student(selected)
            StudentInfoViewController.selectedStudent = StudentProvider.allStudents[selectedRow]
        }
    }
    

}

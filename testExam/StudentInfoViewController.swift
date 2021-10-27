//
//  StudentInfoViewController.swift
//  testExam
//
//  Created by Tejvir  Dhami on 2021-10-25.
//

import UIKit

class StudentInfoViewController: UIViewController {
    
    public var selectedStudent : Student?
    private var editMode : Bool = false
    
    
    @IBOutlet weak var txtName: UITextField!
    
    
    @IBOutlet weak var btnDelete: UIButton!
    @IBAction func btnDelete(_ sender: Any) {
        StudentProvider.removeStudent(id: selectedStudent!.id)
                
                navigationController?.popViewController(animated: true)
    }
    @IBAction func btnDone(_ sender: Any) {
        if let name = txtName.text {
            
            if(name.count < 3){
                print("Please enter a name with at least three characters.")
                return
            }
            
            if editMode {
                //Updating a student
                selectedStudent?.name = name
                StudentProvider.updateStudent(updatedStudent: selectedStudent!)
                
            } else {
                //Insert Mode
                let newStudent = Student()
                newStudent.id = Student.getNextId()
                newStudent.name = name
                
                StudentProvider.addNewStudent(student: newStudent)
            }
            
            
            
            
            //Going back to previous controller
            navigationController?.popViewController(animated: true)
        }
        
        
        
        
        
    }
    
    
    
    func setupTextFields() {
               let toolbar = UIToolbar()
               let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                               target: nil, action: nil)
               let doneButton = UIBarButtonItem(title: "Done", style: .done,
                                                target: self, action: #selector(doneButtonTapped))
               
               toolbar.setItems([flexSpace, doneButton], animated: true)
               toolbar.sizeToFit()
               
               txtName.inputAccessoryView = toolbar
           }

       @objc func doneButtonTapped() {
           view.endEditing(true)
       }
       
    
    

    override func viewDidLoad() {
        if let student = selectedStudent{
            editMode = true
            btnDelete.isHidden = false
            txtName.text = student.name
        } else {
            editMode = false
            btnDelete.isHidden = true
        }
        setupTextFields()
        super.viewDidLoad()

    }

}

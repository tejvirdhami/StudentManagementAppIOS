//
//  ViewController.swift
//  testExam
//
//  Created by Tejvir  Dhami on 2021-10-25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnLogin: UIButton!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBAction func txtEmail(_ sender: Any) {
        txtEmail.backgroundColor = UIColor.white
    }
    
    @IBAction func txtPassword(_ sender: Any) {
        txtPassword.backgroundColor = UIColor.white
    }
    
    
    
    
    
    
    @IBAction func btnLogin(_ sender: Any) {
        
        guard let email : String = txtEmail.text else {
            return
        }
        guard let password : String = txtPassword.text else {
            return
        }
        
        if(email.count == 0 || password.count == 0){
            txtEmail.backgroundColor = UIColor.cyan
            txtPassword.backgroundColor = UIColor.cyan
            return
        }
        
    }
    
    
    
    
    
    
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == Segues.toStudentList {
            
            guard let email : String = txtEmail.text else {
                return false
            }
            guard let password : String = txtPassword.text else {
                return false
            }
            
            if(email.count == 0 || password.count == 0){
                txtEmail.backgroundColor = UIColor.red
                txtPassword.backgroundColor = UIColor.red
                Toast.ok(view: self, title: "Information", message: "Kindly enter the username and password!", handler: nil)
                return false
            }
            if(email == "admin@int4fc.com" && password == "Lasalle2000"){
                return true
            }
            else
            {
                Toast.ok(view: self, title: "Information", message: "Incorrect username or password!", handler: nil)
                return false
            }
        }
        return true
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == Segues.toStudentList){
            
            //Creating a let to point SecondView Conroller
            let StudentListViewController = segue.destination as! StudentListViewController
            
            guard let email = txtEmail.text else {
                return
            }
            StudentListViewController.data = email
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
               
               txtEmail.inputAccessoryView = toolbar
               txtPassword.inputAccessoryView = toolbar
           }

       @objc func doneButtonTapped() {
           view.endEditing(true)
       }
       
    
    
    
    
    
    
    override func viewDidLoad() {
        setupTextFields()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


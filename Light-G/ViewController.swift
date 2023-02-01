//
//  ViewController.swift
//  Light-G
//
//  Created by James Au on 30/1/2023.
//

import UIKit

class ViewController: UIViewController {
    var username: String = ""
    @IBOutlet var UserNameField: UITextField!
    @IBOutlet var PasswordField: UITextField!
    @IBOutlet var EnterButton: UIButton!
    
    override func viewDidLoad() {
        UserNameField.returnKeyType = .done
        PasswordField.returnKeyType = .done
        UserNameField.becomeFirstResponder()
        UserNameField.delegate = self
        PasswordField.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func EnterPressed(_ sender: Any) {
        UserNameField.resignFirstResponder()
        PasswordField.resignFirstResponder()
        username = UserNameField.text ?? ""
        let password = PasswordField.text ?? ""
        //print("Username: ",username ," Password: ",password )
        if username == "HongYu" && password == "LingXuan" {
            self.performSegue(withIdentifier: "entermenu", sender: sender)
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let controller = segue.destination as? MenuViewController else { return  }
        controller.username = self.username
    }
    

}
extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        let text = textField.text
        print(text ?? "")
        
        return true
    }
    
}


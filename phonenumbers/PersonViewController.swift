//
//  PersonViewController.swift
//  phonenumbers
//
//  Created by Bekzat on 4/10/24.
//

import UIKit

class PersonViewController: UIViewController {
    
    @IBOutlet weak var nameChanged: UITextField!
    
    @IBOutlet weak var surnameChanged: UITextField!
    
    @IBOutlet weak var numberChanged: UITextField!
    
    var arrayPerson:[Person] = []
    
    var person = Person(name: "", surname: "", number: "")
    
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameChanged.text = person.name
        surnameChanged.text = person.surname
        numberChanged.text = person.number
    
    }
    
    @IBAction func changeData(_ sender: Any) {
        var newPerson = Person(name: nameChanged.text!, surname: surnameChanged.text!, number: numberChanged.text!)
        
        arrayPerson[index] = newPerson
        
        do {
                    
                    let encodedata = try JSONEncoder().encode(arrayPerson)
                    
                    UserDefaults.standard.set(encodedata, forKey: "personArray")
                    
                } catch {
                    print("unable to encode \(error)")
                }
        
        navigationController?.popViewController(animated: true)
    
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

//
//  ViewController.swift
//  phonenumbers
//
//  Created by Bekzat on 30/9/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    
    
    @IBOutlet weak var surname: UITextField!
    
    
    @IBOutlet weak var number: UITextField!
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addPerson(_ sender: Any) {
        
        let namePerson = name.text!
        let surnamePerson = surname.text!
        let numberPerson = number.text!
        
        var newPerson = Person(name: namePerson, surname: surnamePerson, number: numberPerson)
        
        
        do {
            if let data = UserDefaults.standard.data(forKey: "personArray") {  //data  - простой тип данных
                var array = try JSONDecoder().decode([Person].self, from: data)  //decode  расшифровывает данные в массив TaskItem из data
                array.append(newPerson)
                let encodedata = try JSONEncoder().encode(array) //обратно зашифровываем массив
                UserDefaults.standard.set(encodedata, forKey: "personArray")
            } else {
                let encodedata = try JSONEncoder().encode([newPerson])  //если нет данных создаем новый массив
                UserDefaults.standard.set(encodedata, forKey: "personArray")
            }
            
        } catch {
            print("unable to encode \(error)")
        }
        
        name.text = ""
        surname.text = ""
        number.text = ""
                
    }
    
}



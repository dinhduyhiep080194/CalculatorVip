//
//  ViewController.swift
//  calculator_practice1
//
//  Created by Dinh Duy Hiep on 4/14/17.
//  Copyright © 2017 Dinh Duy Hiep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var lblShow: UILabel!
    @IBOutlet var lblOperation: UILabel!
    

    var currentNumber:Double = 0
    var previousNumber:Double = 0
    var operation:Int = 0
    var count:Int = 0
    
    var complete = false
    var performedMath = false
    var isInteger:Bool = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblShow.text = "0"
        lblOperation.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //ham xu ly khi nguoi dung nhap vao
    @IBAction func numbers(_ sender: UIButton) {
        //xu ly dau thap phan
        if sender.tag == 19 {
            if lblShow.text == "0" {
                lblShow.text = "0."
            }
            else{
                let countdots = lblShow.text!.components(separatedBy: ".").count - 1
                if countdots == 0 {
                    lblShow.text = lblShow.text! + "."
                }
            }
        }else if performedMath || complete || lblShow.text == "0"{             lblShow.text = String(sender.tag-1)
            performedMath = false
            complete = false
        }
        else {
            lblShow.text = lblShow.text! + String(sender.tag-1)
        }
        currentNumber = Double(lblShow.text!)!
    }
    
    func calculation() {
        if (currentNumber.isNaN || previousNumber.isNaN) {             lblShow.text = "NOT A NUMBER"
        } else {
            if operation == 12 { //phep chia
                if currentNumber == 0 { //chia cho 0
                    lblShow.text = "NOT A NUMBER"
                } else {
                    isInteger = floor(previousNumber / currentNumber) == previousNumber / currentNumber
                    if isInteger { //kiem tra phai so nguyen hay khong
                        lblShow.text = String(Int(previousNumber / currentNumber))
                    } else{
                        lblShow.text = String(previousNumber / currentNumber)
                    }
                }
            }
            else if operation == 13 { //phep nhan
                isInteger = floor(previousNumber * currentNumber) == previousNumber * currentNumber
                if isInteger {
                    lblShow.text = String(Int(previousNumber * currentNumber))
                } else{
                    lblShow.text = String(previousNumber * currentNumber)
                }
            }
            else if operation == 14 { //phep tru
                isInteger = floor(previousNumber - currentNumber) == previousNumber - currentNumber
                if isInteger {
                    lblShow.text = String(Int(previousNumber - currentNumber))
                } else{
                    lblShow.text = String(previousNumber - currentNumber)
                }
            }
            else if operation == 15 { //phep cong
                isInteger = floor(previousNumber + currentNumber) == previousNumber + currentNumber
                if isInteger {
                    lblShow.text = String(Int(previousNumber + currentNumber))
                } else{
                    lblShow.text = String(previousNumber + currentNumber)
                }
            }
            else {
                currentNumber = Double(lblShow.text!)!
                isInteger = floor(currentNumber) == currentNumber
                if isInteger {
                    lblShow.text = String(Int(currentNumber))
                } else{
                    lblShow.text = String(currentNumber)
                }
            }
            complete = true
        }
    }
    
    //Xu ly khi nguoi dung nhan cac button con lai
    @IBAction func operations(_ sender: UIButton) {
        
        switch sender.tag {
        case 11:
            lblShow.text = "0"
            lblOperation.text = ""
            currentNumber = 0
            previousNumber = 0
            count = 0
            break
        case 12: //Xu li phep chia
            if count >= 1 && performedMath == false { //kiem tra de xem co thuc hien lien tuc cac phep tinh khong
                calculation()
            }
            previousNumber = Double(lblShow.text!)!
            if !performedMath {
                count += 1
            }
            lblOperation.text = "/"
            operation = sender.tag
            performedMath = true
            break
        case 13: //phep nhan
            if count >= 1 && performedMath == false {
                calculation()
            }
            previousNumber = Double(lblShow.text!)!
            if !performedMath {
                count += 1
            }
            lblOperation.text = "x"
            operation = sender.tag
            performedMath = true
            break
        case 14: //Xu li phep tru
            if count >= 1 && performedMath == false {
                calculation()
            }
            previousNumber = Double(lblShow.text!)!
            if !performedMath {
                count += 1
            }
            lblOperation.text = "-"
            operation = sender.tag
            performedMath = true
            break
        case 15: //Xu li phep cong
            if count >= 1 && performedMath == false {
                calculation()
            }
            previousNumber = Double(lblShow.text!)!
            if !performedMath {
                count += 1
            }
            lblOperation.text = "+"
            operation = sender.tag
            performedMath = true
            break
        case 16:
            lblOperation.text = "="
            count = 0
            calculation()
            break
        case 17: // Am/ Duong
            if (currentNumber.isNaN || previousNumber.isNaN) {
                lblShow.text = "NOT A NUMBER"
            } else {
                if Double(lblShow.text!)! != 0 && performedMath != true {
                    lblShow.text = String(Double(lblShow.text!)! * (-1))
                    currentNumber = Double(lblShow.text!)!
                    count = 0
                }
            }
            break
               default:
            break
        }
        
    }
    
    
    
}


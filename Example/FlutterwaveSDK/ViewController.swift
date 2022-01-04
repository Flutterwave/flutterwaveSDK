//
//  ViewController.swift
//  FlutterwaveSDK
//
//  Created by texyz on 10/02/2020.
//  Copyright (c) 2020 texyz. All rights reserved.
//

import FlutterwaveSDK
import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController, FlutterwavePayProtocol {
    func onDismiss() {
        print("View controller was dimissed ")
    }
    
    
    func tranasctionSuccessful(flwRef: String?, responseData: FlutterwaveDataResponse?) {
        print("DATA Returned \(responseData?.flwRef ?? "Failed to return data")")
        
        
    }
    
    func tranasctionFailed(flwRef: String?, responseData: FlutterwaveDataResponse?) {
        print( "Failed to return data with FlwRef \(flwRef.orEmpty())")
    }
    
    let flutterLabel = UILabel()
    let exampleLabel = UILabel()
    let underLineView = UIView()
    let launchButton = UIButton(type: .system)
    
    
    
    @objc func showExample(){
                   
                   let config = FlutterwaveConfig.sharedConfig()
                   config.paymentOptionsToExclude = []
                   config.currencyCode = "NGN" // This is the specified currency to charge in.
                   config.email = "[USER'S EMAIL]" // This is the email address of the customer
                   config.isStaging = true // Toggle this for staging and live environment
                   config.phoneNumber = "[USER'S PHONE_NUMBER]" //Phone number
                   config.transcationRef = "[TRANSACTION REF]" // This is a unique reference, unique to the particular transaction being carried out. It is generated when it is not provided by the merchant for every transaction.
                   config.firstName = "[USER'S FIRST NAME]" // This is the customers first name.
                   config.lastName = "[USER'S SECOND NAME]" //This is the customers last name.
                   config.meta = [["metaname":"iOS-SDK-v3", "metavalue": MetaValueDetails(paymentDetails: "", recieptId: "")]] //This is used to include additional payment information
                   config.narration = "simplifying payments for endless possibilities"
                   config.publicKey = "[PUB_KEY]" //Public key
                   config.encryptionKey = "[ENCRYPTION_KEY]" //Encryption key
                   config.isPreAuth = false  // This should be set to true for preauthoize card transactions
                   let controller = FlutterwavePayViewController()
                   let nav = UINavigationController(rootViewController: controller)
                   controller.amount = "[AMOUNT]" // This is the amount to be charged.
                   controller.delegate = self
                   self.present(nav, animated: true)
                   
               }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpConstraintsAndProperties()
    }
    
}


struct MetaValueDetails  {
    var paymentDetails:String
    var recieptId:String
}





//
//  ViewController.swift
//  ValidateKanna109
//
//  Created by Atsushi Kiwaki on 10/9/16.
//  Copyright © 2016 Atsushi Kiwaki. All rights reserved.
//

import UIKit
import Kanna

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        guard let filePath = Bundle(for:self.classForCoder).path(forResource: "example", ofType:"xml") else {
            return
        }

        let xml = NSData(contentsOfFile: filePath) as! Data
        if let doc = XML(xml: xml, encoding: String.Encoding.utf8) {
            let current = doc.xpath("//ROOT/*").map({ $0 })
            for c in current {
                let siteMatches = c.xpath("./MATCHES/*").map({ $0 })
                for siteMatch in siteMatches {
                    print(siteMatch.toXML)
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


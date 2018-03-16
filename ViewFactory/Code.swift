//
//  Code.swift
//  ViewFactory
//
//  Created by Ethan Hardacre on 3/15/18.
//  Copyright © 2018 Ethan Hardacre. All rights reserved.
//

import Foundation

class Code {
    
    var finalized_code : String = ""
    
    var code_class : String = ""
    var code_init : String = ""
    var code_param : String = ""
    
    var params : [String] = []
    var initializers : [String] = []
    var classes : [String] = []
    var elements : [String] = []
    
    let code_setup = "Heading for View Controller   "
    let code_intermediate = "Between Parameters and ViewDidLoad     "
    let code_end = "Ends the ViewController Class       "
    
    init() {}
    
    func add(elmt : Element){
        code_param = elmt.get_Param()
        code_class = elmt.get_Class()
        code_init = elmt.get_Init()
        params = params + [code_param]
        initializers = initializers + [code_init]
        classes = classes + [code_class]
        elements = elements + [elmt.className()]
    }
    
    func remove(elmt : String){
        var index =  elements.index(of: elmt)
        if index != nil {
            params.remove(at: index!)
            initializers.remove(at: index!)
            classes.remove(at: index!)
            elements.remove(at: index!)
        }
    }
    
    func finalize() -> String{
        finalized_code = code_setup
        for p in params {
            finalized_code = finalized_code +
                             p
        }
        finalized_code = finalized_code +
                         code_intermediate
        for i in initializers {
            finalized_code = finalized_code +
                             i
        }
        finalized_code = finalized_code +
                         code_end
        for c in classes {
            finalized_code = finalized_code +
                             c
        }
        return finalized_code
    }
    
}

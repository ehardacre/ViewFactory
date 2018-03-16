//
//  Categorical_Chooser.swift
//  ViewFactory
//
//  Created by Ethan Hardacre on 3/13/18.
//  Copyright © 2018 Ethan Hardacre. All rights reserved.
//

import Foundation
import UIKit

class Categorical_Chooser : UIView , UITableViewDataSource , UITableViewDelegate {
    
    var fixed_data : [String] = []
    var acting_data : [String] = []
    
    var table = UITableView()
    
    var manager = Manager()
    
    init(){ super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))}
    
    init(frame : CGRect , data : [String]) {
        
        super.init(frame: frame)
        
        init_Data(data: data)
        init_Table()
        
    }
    
    func set_manager(mngr: Manager){
        manager = mngr
    }
    
    func init_Data(data : [String]){
        fixed_data = data
        acting_data = fixed_data
    }
    
    func init_Table() {
        table.delegate = self
        table.dataSource = self
        table.frame = self.frame
        table.register(Categorical_Cell.self, forCellReuseIdentifier: "cell")
        table.allowsSelection = false
        table.separatorStyle = .none
        self.addSubview(table)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return acting_data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Categorical_Cell
        cell.init_cell(label: acting_data[indexPath.row])
        cell.init_pos(n: indexPath.row, in: self)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func add_Element(n : Int) {
        manager.addElement(item_name: acting_data[n])
        //add code to remove all other items with appropriate tags
    }
    
    func remove_Element(n : Int) {
        manager.removeElement(item_name: acting_data[n])
    }
    
}

class Categorical_Cell : UITableViewCell {
    
    var label : String = ""
    var button : UIButton = UIButton()
    var index : Int = -1
    var parent : Categorical_Chooser = Categorical_Chooser()
    
    var active = false
    
    func init_cell(label : String){
        button = UIButton(frame: CGRect(x: 10,
                                        y: 10,
                                        width: self.frame.width - 20,
                                        height: self.frame.height - 20))
        button.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        button.layer.cornerRadius = 5
        let labelField = UILabel(frame: CGRect(x: 0,
                                               y: 0,
                                               width: button.frame.width,
                                               height: button.frame.height))
        labelField.text = label
        labelField.textColor = UIColor.white
        labelField.textAlignment = .center
        
        button.addTarget(self, action: #selector(selfSelected), for: .touchUpInside)
        
        button.addSubview(labelField)
        self.addSubview(button)
    }
    
    func init_pos(n : Int, in table: Categorical_Chooser){
        index = n
        parent = table
    }
    
    func selfSelected(){
        if !active {
            parent.add_Element(n: index)
            button.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            active = true
        }else{
            parent.remove_Element(n: index)
            button.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            active = false
        }
        
    }
    
}

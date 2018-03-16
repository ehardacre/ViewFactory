
import UIKit

class Manager: NSObject {
    
    var main : UIView = UIView()
    var mock : UIView = UIView()
    var data : [String] = []
    var code : Code = Code()
    var added_views : [Element] = []
    
    override init() {}
    
    init(interface : Interface){
        self.main = interface.main
        self.mock = interface.mock
        data = interface.element_types
    }
    
    func addElement(item_name : String){
        //statement not removing the space from the string...
        let name = item_name.replacingOccurrences(of: " ", with: "")
        let myClass = createClassFrom(name: name) as! Element.Type
        var instance = myClass.init(mock: self.mock)
        added_views.append(instance)
        mock.addSubview(instance)
        code.add(elmt: instance)
    }
    
    func removeElement(item_name: String){
        let name = item_name.replacingOccurrences(of: " ", with: "")
        for i in 0..<added_views.count{
            var e = added_views[i]
            if e.className() == name {
                e.removeFromSuperview()
                added_views.remove(at: i)
                code.remove(elmt: name)
                return
            }
        }
    }
    
    func createClassFrom(name: String) -> AnyClass{
        let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        let cls : AnyClass = NSClassFromString("\(namespace).\(name)")!
        return cls
    }
    
}

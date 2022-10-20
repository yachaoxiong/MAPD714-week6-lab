

import UIKit

class MuitiComponentPickerViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    @IBOutlet weak var multiPickerControl: UIPickerView!
    
    let Red = ColorChannel.Red
    let Green = ColorChannel.Green
    let Blue = ColorChannel.Blue
    
    var ValueArray: [String] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        buildValueArray()
        
        multiPickerControl.selectRow(255, inComponent: Red.rawValue, animated: true)
        multiPickerControl.selectRow(255, inComponent: Green.rawValue, animated: true)
        multiPickerControl.selectRow(255, inComponent: Blue.rawValue, animated: true)
        
    }
    
    func buildValueArray()
    {
        for index in stride(from: 255, through:0, by: -1)
        {
            ValueArray.append(String(index))
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return 256
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return ValueArray[row]
    }

    @IBAction func SelectButton_Pressed(_ sender: Any)
    {
        
       
        let RedChannelIndex = multiPickerControl.selectedRow(inComponent: Red.rawValue)
        let GreenChannelIndex = multiPickerControl.selectedRow(inComponent: Green.rawValue)
        let BlueChannelIndex = multiPickerControl.selectedRow(inComponent: Blue.rawValue)
        
        let RedChannel = CGFloat((ValueArray[RedChannelIndex] as NSString).floatValue)/255.0
        let GreenChannel = CGFloat((ValueArray[GreenChannelIndex]  as NSString).floatValue)/255.0
        let BlueChannel = CGFloat(( ValueArray[BlueChannelIndex]  as NSString).floatValue)/255.0
        
        
        let picker = UIColorPickerViewController()
        
        picker.selectedColor = UIColor(red: RedChannel, green: GreenChannel, blue: BlueChannel, alpha: 1.0)
        
        self.present(picker, animated: true, completion: nil)
        
        
        
       
    }
}

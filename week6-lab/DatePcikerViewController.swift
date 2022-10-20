

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var DatePickerControl: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let date = NSDate()
        DatePickerControl.setDate(date as Date, animated: false)
    }

    
    @IBAction func SelectButton_Pressed(_ sender: Any)
    {
       print(DatePickerControl.date)
        
    }
    
}


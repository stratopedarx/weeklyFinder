import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var dateTextField: UITextField!
    @IBOutlet private weak var monthTextField: UITextField!
    @IBOutlet private weak var yearTextField: UITextField!
    @IBOutlet private weak var resultLabel: UILabel!
    
    @IBAction private func findDay(_ sender: UIButton) {
        guard let day = dateTextField.text, let month = monthTextField.text, let year = yearTextField.text else  { return }
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.locale = Locale(identifier: "ru_Ru")
            
        let date = calendar.date(from: dateComponents)
        guard let date = date else { return }
        let weekDay = dateFormatter.string(from: date).capitalized
        resultLabel.text = weekDay
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

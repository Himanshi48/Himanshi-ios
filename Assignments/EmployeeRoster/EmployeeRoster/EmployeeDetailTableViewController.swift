
import UIKit

protocol EmployeeDetailTableViewControllerDelegate: AnyObject {
    func employeeDetailTableViewController(_ controller: EmployeeDetailTableViewController, didSave employee: Employee)
}


class EmployeeDetailTableViewController: UITableViewController, UITextFieldDelegate, EmployeeTypeTableViewControllerDelegate {
    
    
    
    var employeeType: EmployeeType?
 
    
    
    @IBOutlet weak var dobDatePicker: UIDatePicker!
    
    
    
    var isEditingBirthday: Bool = false {
        didSet {
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBOutlet var dobLabel: UILabel!
    @IBOutlet var employeeTypeLabel: UILabel!
    @IBOutlet var saveBarButtonItem: UIBarButtonItem!
    
    weak var delegate: EmployeeDetailTableViewControllerDelegate?
    var employee: Employee?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Employee Type"
        updateView()
        updateSaveButtonState()
        
        configureDatePicker()
    }
    
    func updateView() {
        if let employee = employee {
            navigationItem.title = employee.name
            nameTextField.text = employee.name
            
            dobLabel.text = employee.dateOfBirth.formatted(date: .abbreviated, time: .omitted)
            dobLabel.textColor = .label
            employeeTypeLabel.text = employee.employeeType.description
            employeeTypeLabel.textColor = .label
        } else {
            navigationItem.title = "New Employee"
        }
    }
    
    private func updateSaveButtonState() {
        let isNameValid = !(nameTextField.text?.isEmpty ?? true)
        let isTypeSelected = (employeeType != nil)
        
        saveBarButtonItem.isEnabled = isNameValid && isTypeSelected
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty else { return }
           guard let employeeType = employeeType else { return } // Unwrap the type
           
           let birthday = dobDatePicker.date
           
        let newEmployee = Employee(name: name, dateOfBirth: birthday, employeeType: employeeType)
        
        
        
        
        
        
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        let datePickerIndexPath = IndexPath(row: 2, section: 0)
        if indexPath == datePickerIndexPath && !isEditingBirthday {
            return 190 // hide cell
        }
        return UITableView.automaticDimension
    
    }
    override func tableView(_ tableView: UITableView,
                            heightForRowAt indexPath: IndexPath) -> CGFloat {
        let datePickerIndexPath = IndexPath(row: 2, section: 0)
           
           if indexPath == datePickerIndexPath && !isEditingBirthday {
               return 0 // hide cell
           }
           return UITableView.automaticDimension
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        
        tableView.deselectRow(at: indexPath, animated: true)
           
           // Assuming the Birthday label cell is Section 0, Row 1
           let birthdayLabelIndexPath = IndexPath(row: 1, section: 0)
           
           if indexPath == birthdayLabelIndexPath {
               // Toggle the picker’s visibility
               isEditingBirthday.toggle()
               
               // Update dobLabel’s text color (active state)
               dobLabel.textColor = .label
               
               // Update dobLabel with currently selected date on picker
               dobLabel.text = dobDatePicker.date.formatted(date: .abbreviated, time: .omitted)
           }
        
        
        
        // Assuming Birthday label cell is Row 1 in Section 0
    }
    
    
    
    
    @IBAction func dobDateChanged(_ sender: UIDatePicker) {
        
        dobLabel.text = sender.date.formatted(date: .abbreviated, time: .omitted)
    }
    
    
    @IBSegueAction func showEmployeeTypes(_ coder: NSCoder) -> EmployeeTypeTableViewController? {
        let controller = EmployeeTypeTableViewController(coder: coder)
            controller?.delegate = self  // <-- crucial
            controller?.employeeType = self.employeeType  // pass current selection
            return controller
    }

    
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        employee = nil
    }

    @IBAction func nameTextFieldDidChange(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    
    func configureDatePicker() {
        let calendar = Calendar.current
        
        // Default date ~30 years ago
        let thirtyYearsAgo = calendar.date(byAdding: .year, value: -30, to: Date())!
        dobDatePicker.date = thirtyYearsAgo
        
        // Minimum: 65 years ago, Maximum: 16 years ago
        let sixteenYearsAgo = calendar.date(byAdding: .year, value: -16, to: Date())!
        let sixtyFiveYearsAgo = calendar.date(byAdding: .year, value: -65, to: Date())!
        
        dobDatePicker.minimumDate = sixtyFiveYearsAgo
        dobDatePicker.maximumDate = sixteenYearsAgo
    }
    
    func employeeTypeTableViewController(_ controller: EmployeeTypeTableViewController, didSelect type: EmployeeType) {
        
        print("Selected type:", type.description)
        self.employeeType = type
        employeeTypeLabel.text = type.description
        employeeTypeLabel.textColor = .black
        updateSaveButtonState()
    }
    

}

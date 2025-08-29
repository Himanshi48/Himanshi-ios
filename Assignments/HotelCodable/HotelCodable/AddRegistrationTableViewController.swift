//
//  AddRegistrationTableViewController.swift
//  HotelCodable
//
//  Created by Himanshi Godara on 27/08/25.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController, SelectRoomTypeTableViewControllerDelegate {
    
    
    
    var roomType: RoomType?
    
    @IBOutlet weak var roomTypeLabel: UILabel!
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var checkInDatePicker: UIDatePicker!
    
    
    
    @IBOutlet weak var numberOfAdultsLabel: UILabel!
    
    
    
    @IBOutlet weak var numberOfChildrenSteper: UIStepper!
    @IBOutlet weak var numberOfChildrenLabel: UILabel!
    
    @IBOutlet weak var numberOfAdultsSteper: UIStepper!
    
    
    
    @IBOutlet weak var wifiSwitch: UISwitch!
    
    
    
    
    
    @IBOutlet weak var checkOutDatePicker: UIDatePicker!
    
    
    
    
    @IBOutlet weak var checkInLabel: UILabel!
    
    
    
    @IBOutlet weak var checkOutLabel: UILabel!
    
    
    
    
    var registration: Registeration? {
        guard let roomType = roomType else { return nil }
    let firstName = firstNameTextField.text ?? ""
    let lastName = lastNameTextField.text ?? ""
    let email = emailTextField.text ?? ""
    let checkInDate = checkInDatePicker.date
    let checkOutDate = checkOutDatePicker.date
    let numberOfAdults = Int (numberOfAdultsSteper.value)
    let numberOfChildren = Int(numberOfChildrenSteper.value)
    let hasWifi = wifiSwitch.isOn
    return Registeration (firstName: firstName,
                          lastName: lastName, emailAddress: email, checkOutDate: checkOutDate, checkInDate: checkInDate, numberOfAdult: numberOfAdults, numberOfChildren: numberOfChildren, wifi: hasWifi,
    roomType: roomType)
    }
    
    let checkInDateLabelCellIndexPath = IndexPath(row: 0, section: 1)
    let checkOutDateLabelCellIndexPath = IndexPath(row: 2, section: 1)
    
    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    let checkOutDatePickerCellIndexPath = IndexPath (row: 3, section: 1)
    var isCheckInDatePickerVisible: Bool = false {
        didSet {
            checkInDatePicker.isHidden = !isCheckInDatePickerVisible}}
    var isCheckOutDatePickerVisible: Bool = false {
        didSet {
            checkOutDatePicker.isHidden = !isCheckOutDatePickerVisible
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let midnightToday = Calendar.current.startOfDay(for: Date())
        checkInDatePicker.minimumDate = midnightToday
        checkInDatePicker.date = midnightToday
        checkOutDatePicker.minimumDate = Calendar.current.date (byAdding:
                .day, value: 1, to: checkInDatePicker.date)
        
        
        
        // Fill UI if editing existing registration
         if let registration = registration {
             firstNameTextField.text = registration.firstName
             lastNameTextField.text = registration.lastName
             emailTextField.text = registration.emailAddress
             checkInDatePicker.date = registration.checkInDate
             checkOutDatePicker.date = registration.checkOutDate
             numberOfAdultsSteper.value = Double(registration.numberOfAdult)
             numberOfChildrenSteper.value = Double(registration.numberOfChildren)
             wifiSwitch.isOn = registration.wifi
             roomType = registration.roomType
         }
        
        
        
        updateDateViews()
        updateNumberOfGuests()
        updateRoomType()
        updateDoneButtonState() // Step 3
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func updateDoneButtonState() {
        navigationItem.rightBarButtonItem?.isEnabled = registration != nil
    }

    func updateDateViews(){
        checkInLabel.text = checkInDatePicker.date.formatted(date: .abbreviated, time: .omitted)
        checkOutLabel.text = checkOutDatePicker.date.formatted(date: .abbreviated, time: .omitted)
        
    }
    
    @IBAction func datePickerTapped(_ sender: Any) {
        
        updateDateViews()
        updateDoneButtonState()
    }
    
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath == checkInDateLabelCellIndexPath &&
            isCheckOutDatePickerVisible == false {
            isCheckInDatePickerVisible.toggle()
        } else if indexPath == checkOutDateLabelCellIndexPath &&
                    isCheckInDatePickerVisible == false {
            isCheckOutDatePickerVisible.toggle()
        } else if indexPath == checkInDateLabelCellIndexPath ||
                    indexPath == checkOutDateLabelCellIndexPath {
            // Either label was selected, previous conditions failed meaning at least one picker is visible, toggle both
            isCheckInDatePickerVisible.toggle()
            isCheckOutDatePickerVisible.toggle()
        } else {
            return
        }
        tableView.beginUpdates ()
        tableView.endUpdates ()
    }
    
    
    @IBAction func doneBarButtonTapped(_ sender: UIBarButtonItem) {
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
        
        let numberOfAdult=Int(numberOfAdultsSteper.value)
        let numberOfChildren=Int(numberOfChildrenSteper.value)
        
        let haswifi=wifiSwitch.isOn
        
        let roomChoise = roomType?.name ?? "Not Set"
        
        
        print("done tapped")
        print("firstname: \(firstName), lastname: \(lastName), email: \(email)")
        print("dateIn: \(checkInDate), dateOut: \(checkOutDate)")
        print("number of adults \(numberOfAdult)")
        print("number of children \(numberOfChildren)")
        print("wifi \(haswifi)")
        print("Room Choise: \(roomChoise)")
    }
    
    override func tableView(_ tableView: UITableView,
                            heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkInDatePickerCellIndexPath where
            isCheckInDatePickerVisible == false:
            return 0
        case checkOutDatePickerCellIndexPath where
            isCheckOutDatePickerVisible == false:
            return 0
        default:
            return UITableView.automaticDimension
        }}
    
    
    
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat{
        switch indexPath {
        case checkInDatePickerCellIndexPath:
            return 190
        case checkOutDatePickerCellIndexPath:
            return 190
        default:
            return UITableView.automaticDimension
        }}
    
    
    func updateNumberOfGuests () {
        
        
        numberOfAdultsLabel.text =
        
        " \(Int (numberOfAdultsSteper.value))"
        
        numberOfChildrenLabel.text =
        
        "\(Int(numberOfChildrenSteper.value))"
    }
    
    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        updateDoneButtonState()
    }
    
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updateNumberOfGuests()
        updateDoneButtonState()
    }
    
    
    
    
    
    
    @IBAction func wifiSwitchChanged(_ sender: UISwitch) {
        updateDoneButtonState()
    }
    
    
    func updateRoomType() {
    if let roomType = roomType {
        roomTypeLabel.text = roomType.name
    } else {
        roomTypeLabel.text = "Not Set"}}
    
    func selectRoomTypeTableViewController (_ controller:
    SelectRoomTypeTableViewController, didSelect roomType:
    RoomType) {
    self.roomType = roomType
    updateRoomType ()
    }
    
    @IBSegueAction func selectRoomType(_ coder: NSCoder) -> SelectRoomTypeTableViewController? {
        let selectRoomTypeController =
        SelectRoomTypeTableViewController(coder: coder)
        selectRoomTypeController?.delegate = self
        selectRoomTypeController?.roomType = roomType
        return selectRoomTypeController
    }
    
    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 3
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

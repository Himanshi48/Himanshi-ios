import UIKit

class AthleteTableViewController: UITableViewController {
    
    struct PropertyKeys {
        static let athleteCell = "AthleteCell"
    }

    var athletes: [Athlete] = []

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return athletes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.athleteCell, for: indexPath)
        
        let athlete = athletes[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = athlete.name
        content.secondaryText = athlete.description
        cell.contentConfiguration = content
        
        return cell
    }
    
    
    @IBSegueAction func addAthlete(_ coder: NSCoder) -> AthleteFormViewController? {
           return AthleteFormViewController(coder: coder, athlete: nil)
    }
    
    
    @IBSegueAction func editAthlete(_ coder: NSCoder, sender: Any?) -> AthleteFormViewController? {
        let athleteToEdit: Athlete?
            
            if let cell = sender as? UITableViewCell,
               let indexPath = tableView.indexPath(for: cell) {
                athleteToEdit = athletes[indexPath.row]
                // ✅ Select this row so indexPathForSelectedRow is not nil later
                tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
            } else {
                athleteToEdit = nil
            }
            
            return AthleteFormViewController(coder: coder, athlete: athleteToEdit)
    }
    @IBAction func unwindToAthleteTableView(_ segue: UIStoryboardSegue) {
        // Get the source view controller and the athlete it created/edited
        guard
                let athleteFormViewController = segue.source as? AthleteFormViewController,
                let athlete = athleteFormViewController.athlete
            else {
                return
            }
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // ✅ Editing an existing athlete
                athletes[selectedIndexPath.row] = athlete
                tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
            } else {
                // ➕ Adding a new athlete
                athletes.append(athlete)
                let newIndexPath = IndexPath(row: athletes.count - 1, section: 0)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
    }


}

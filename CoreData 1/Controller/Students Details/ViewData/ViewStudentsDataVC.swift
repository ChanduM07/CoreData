//
//  ViewStudentsDataVC.swift
//  CoreData 1
//
//  Created by Chandan Mondal on 24/11/24.
//

import UIKit

class ViewStudentsDataVC: UIViewController, ReloadSaveData {
    
    //Protocall function...
    func reloadTableViewData() {
        //MARK: get students data...
        studentData = DatabaseManager.shared.fetchData()
        if studentData.isEmpty {
            noDataLBL.isHidden = false
        } else {
            noDataLBL.isHidden = true
        }
        tableView.reloadData()
    }
    
    @IBOutlet weak var noDataLBL: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var studentData = [Students]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: get students data...
        studentData = DatabaseManager.shared.fetchData()
        if studentData.isEmpty {
            noDataLBL.isHidden = false
        } else {
            noDataLBL.isHidden = true
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "StudentDataCell", bundle: nil), forCellReuseIdentifier: "StudentDataCell")
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationItem.hidesBackButton = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    deinit{
       print("Memori Relise!!")
    }
    

    @IBAction func didTapRerturn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnTapAddData(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Students", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SaveStudentaDetailsVC") as! SaveStudentaDetailsVC
        vc.reloadDelegate = self
        vc.isEdit = false
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
    

}

extension ViewStudentsDataVC : UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentDataCell", for: indexPath) as! StudentDataCell
        cell.lblName.text = studentData[indexPath.row].name
        cell.selectionStyle = .none
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Students", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailsViewVC") as! DetailsViewVC
        vc.studentsData = studentData[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: Delet data....
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            studentData = DatabaseManager.shared.deletData(indx: indexPath.row)
//            self.tableView.deleteRows(at: [indexPath], with: .automatic)
//        }
//    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        //MARK: Edit data....
        let editAction = UIContextualAction(style: .normal, title: nil) { [weak self] (action, view, completionHandler) in
            self?.editRow(at: indexPath)
            completionHandler(true)
        }
        editAction.backgroundColor = .blue
        editAction.image = UIImage(systemName: "square.and.pencil")

        //MARK: Delet data....
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { [weak self] (action, view, completionHandler) in
            self?.deleteRow(at: indexPath)
            completionHandler(true)
        }
        deleteAction.image = UIImage(systemName: "trash")
        return UISwipeActionsConfiguration(actions: [editAction, deleteAction])
    }

    //MARK: Edit data....
    private func editRow(at indexPath: IndexPath) {
        print("Edit row at \(indexPath.row)")
        let storyboard = UIStoryboard(name: "Students", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SaveStudentaDetailsVC") as! SaveStudentaDetailsVC
        vc.reloadDelegate = self
        vc.isEdit = true
        vc.editIDX = indexPath.row
        vc.editdData = studentData[indexPath.row]
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    
    }

    //MARK: Delet data....
    private func deleteRow(at indexPath: IndexPath) {
        studentData = DatabaseManager.shared.deletData(indx: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        if studentData.isEmpty {
            noDataLBL.isHidden = false
        } else {
            noDataLBL.isHidden = true
        }
        tableView.reloadData()
    }

    
}

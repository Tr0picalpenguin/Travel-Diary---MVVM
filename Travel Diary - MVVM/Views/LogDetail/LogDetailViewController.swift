//
//  LogDetailViewController.swift
//  Travel Diary - MVVM
//
//  Created by Scott Cox on 6/6/22.
//

import UIKit

class LogDetailViewController: UIViewController {


    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var entryTextView: UITextView!
    
    
    var viewModel: LogDetailViewModel!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        
    }
    
    private func updateViews() {
        guard let log = viewModel.log else {return}
        nameTextField.text = log.name
        entryTextView.text = log.entry
    }
    
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        guard let name = nameTextField.text,
              let entry = entryTextView.text else {return}
        
        // save
        viewModel.saveLog(with: name, entry: entry)
        navigationController?.popViewController(animated: true)
    }
    
} // End of class

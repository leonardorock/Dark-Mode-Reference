//
//  DarkModeSummaryTableViewController.swift
//  SystemColors
//
//  Created by Leonardo Oliveira on 17/10/19.
//  Copyright © 2019 Leonardo Oliveira. All rights reserved.
//

import UIKit

final class DarkModeSummaryTableViewController: UITableViewController, UIToolbarDelegate {
    
    lazy var preferredInterfaceSegmentControl: UISegmentedControl = {
        let segmentControl = UISegmentedControl(items: ["Light", "Dark"])
        segmentControl.addTarget(self, action: #selector(preferredInterfaceSegmentControlValueChanged(_:)), for: .valueChanged)
        segmentControl.selectedSegmentIndex = self.traitCollection.containsTraits(in: UITraitCollection(userInterfaceStyle: .light)) ? 0 : 1
        return segmentControl
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toolbarItems = [UIBarButtonItem(customView: preferredInterfaceSegmentControl)]
    }
    
    // MARK: - Actions
    
    @objc func preferredInterfaceSegmentControlValueChanged(_ sender: UISegmentedControl) {
        navigationController?.overrideUserInterfaceStyle = sender.selectedSegmentIndex == 0 ? .light : .dark
        tableView.reloadData()
    }
    
    // MARK: - Navigation
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        destination.toolbarItems = toolbarItems
    }

}

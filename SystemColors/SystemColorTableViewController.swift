//
//  SystemColorTableViewController.swift
//  SystemColors
//
//  Created by Leonardo Oliveira on 23/07/19.
//  Copyright © 2019 Leonardo Oliveira. All rights reserved.
//

import UIKit

final class SystemColorTableViewController: UITableViewController {
    
    struct ColorSection {
        let title: String
        let colors: [SystemColor]
    }
    
    lazy var sections: [ColorSection] = {
        var sections: [ColorSection] = []
        sections.append(ColorSection(title: "Backgrounds", colors: backgroundColors))
        sections.append(ColorSection(title: "Grouped Backgrounds", colors: groupedBackgroundColors))
        sections.append(ColorSection(title: "Labels", colors: labelColors))
        sections.append(ColorSection(title: "Fills", colors: fillColors))
        sections.append(ColorSection(title: "Separators", colors: separatorColors))
        sections.append(ColorSection(title: "Colors", colors: systemColors))
        sections.append(ColorSection(title: "Grays", colors: systemGrayColors))
        return sections
    }()
    
    lazy var backgroundColors: [SystemColor] = {
        var colors: [SystemColor] = []
        colors.append(SystemColor(name: "System Background", color: .systemBackground))
        colors.append(SystemColor(name: "Secondary System Background", color: .secondarySystemBackground))
        colors.append(SystemColor(name: "Tertiary System Background", color: .tertiarySystemBackground))
        return colors
    }()
    
    lazy var groupedBackgroundColors: [SystemColor] = {
        var colors: [SystemColor] = []
        colors.append(SystemColor(name: "System Grouped Background", color: .systemGroupedBackground))
        colors.append(SystemColor(name: "Secondary System Grouped Background", color: .secondarySystemGroupedBackground))
        colors.append(SystemColor(name: "Tertiary System Grouped Background", color: .tertiarySystemGroupedBackground))
        return colors
    }()
    
    lazy var labelColors: [SystemColor] = {
        var colors: [SystemColor] = []
        colors.append(SystemColor(name: "Label", color: .label))
        colors.append(SystemColor(name: "Secondary Label", color: .secondaryLabel))
        colors.append(SystemColor(name: "Tertiary Label", color: .tertiaryLabel))
        colors.append(SystemColor(name: "Quaternary Label", color: .quaternaryLabel))
        return colors
    }()
    
    lazy var fillColors: [SystemColor] = {
        var colors: [SystemColor] = []
        colors.append(SystemColor(name: "System Fill", color: .systemFill))
        colors.append(SystemColor(name: "Secondary System Fill", color: .secondarySystemFill))
        colors.append(SystemColor(name: "Tertiary System Fill", color: .tertiarySystemFill))
        colors.append(SystemColor(name: "Quaternary System Fill", color: .quaternarySystemFill))
        return colors
    }()
    
    lazy var separatorColors: [SystemColor] = {
        var colors: [SystemColor] = []
        colors.append(SystemColor(name: "Separator", color: .separator))
        colors.append(SystemColor(name: "Opaque Separator", color: .opaqueSeparator))
        return colors
    }()
    
    lazy var systemColors: [SystemColor] = {
        var colors: [SystemColor] = []
        colors.append(SystemColor(name: "System Blue", color: .systemBlue))
        colors.append(SystemColor(name: "System Green", color: .systemGreen))
        colors.append(SystemColor(name: "System Indigo", color: .systemIndigo))
        colors.append(SystemColor(name: "System Orange", color: .systemOrange))
        colors.append(SystemColor(name: "System Pink", color: .systemPink))
        colors.append(SystemColor(name: "System Purple", color: .systemPurple))
        colors.append(SystemColor(name: "System Red", color: .systemRed))
        colors.append(SystemColor(name: "System Teal", color: .systemTeal))
        colors.append(SystemColor(name: "System Yellow", color: .systemYellow))
        return colors
    }()
    
    lazy var systemGrayColors: [SystemColor] = {
        var colors: [SystemColor] = []
        colors.append(SystemColor(name: "System Gray", color: .systemGray))
        colors.append(SystemColor(name: "System Gray 2", color: .systemGray2))
        colors.append(SystemColor(name: "System Gray 3", color: .systemGray3))
        colors.append(SystemColor(name: "System Gray 4", color: .systemGray4))
        colors.append(SystemColor(name: "System Gray 5", color: .systemGray5))
        colors.append(SystemColor(name: "System Gray 6", color: .systemGray6))
        return colors
    }()
    
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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].colors.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        let systemColor = sections[indexPath.section].colors[indexPath.row]
        if cell.accessoryView == nil {
            let colorView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 20, height: 20)))
            colorView.layer.cornerRadius = 10
            colorView.clipsToBounds = true
            cell.accessoryView = colorView
        }
        cell.textLabel?.text = systemColor.name
        cell.detailTextLabel?.text = systemColor.rgba
        cell.accessoryView?.backgroundColor = systemColor.color
        return cell
    }

}

//
//  Copyright © 2021 chinaxxren. All rights reserved.
//

import UIKit
import VVAdapter

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var dataList = [String]()

    // MARK: - Subviews

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        dataList.append("Multiplier")
        dataList.append("Edge")
        dataList.append("Relations")
        dataList.append("SafeArea")
        dataList.append("Center")
        dataList.append("TextSize")
        dataList.append("Relation")
        dataList.append("Container")
        dataList.append("Stack")

        view.addSubview(tableView)

        print("this is " +
                "default".screen
                        .width(.w320, is: "width 320")
                        .width(.w375, is: "width 375")
                        .height(.h844, is: "height 844")
                        .height(.h812, is: "height 812")
                        .inch(.i47, is: "4.7 inches")
                        .inch(.i58, is: "5.8 inches")
                        .inch(.i65, is: "6.5 inches")
                        .level(.compact, is: "screen 3: 2")
                        .level(.regular, is: "screen 16: 9")
                        .level(.full, is: "screen 19.5: 9")
                        .value
        )
        let f = CGFloat(10)
        let val = f.zoom()

        let value2 = 0.screen.width(.w320, is: 1).width(.w375, is: 2).value
        print(val)
        print(val2)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataList[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var controller: UIViewController;
        if indexPath.row == 0 {

        } else if (indexPath.row == 1) {

        } else if (indexPath.row == 2) {

        } else if (indexPath.row == 3) {

        } else if (indexPath.row == 4) {

        } else if (indexPath.row == 5) {

        } else if (indexPath.row == 6) {

        } else if (indexPath.row == 7) {

        } else if (indexPath.row == 8) {

        } else {
            controller = UIViewController()
        }
        controller = UIViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}


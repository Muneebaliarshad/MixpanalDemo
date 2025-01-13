//
//  ViewController.swift
//  MixpanalDemo
//
//  Created by Muneeb Ali on 10/31/23.
//

import UIKit
import Mixpanel

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Variables
    var eventsData = ["Onboarding", "Sign Up User", "Sign In User", "Screen View", "Search", "Property Listed", "Property Open", "Property Sold", "Filter", "Logout"]
    var  mixpanelInstance =  Mixpanel.mainInstance()

    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = eventsData[indexPath.row]
        return cell
    }

    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            var properties: [String: MixpanelType] = ["onboarding_done": false,
                                                      "onboarding_screen": 2,
                                                      "skip_tapped": false]
            mixpanelInstance.track(event: "Onboarding", properties: properties)
            break

        case 1:
            var userId = "54jhfs24jhv"
            let properties: [String: MixpanelType] = ["$first_name":"Muneeb",
                                                      "$last_name": "Ali",
                                                      "$email": "muneeb.arshad@7peakssoftware.com",
                                                      "$phone": "66957048744",
                                                      "user_type": "Buyer"]
            mixpanelInstance.identify(distinctId: userId)
            mixpanelInstance.track(event: "Sign Up User", properties: properties)
            mixpanelInstance.people.set(properties: properties)
            break

        case 2:
            let properties: [String: MixpanelType] = ["$email": "muneeb.arshad@7peakssoftware.com",
                                                      "last_signin_date": Date.now]
            mixpanelInstance.track(event: "Sign In User", properties: properties)
            break

        case 3:
            let properties: [String: MixpanelType] = ["user_id":"54jhfs24jhv",
                                                      "screen_name": "Home"]
            mixpanelInstance.track(event: "Screen View", properties: properties)
            break

        case 4:
            let properties: [String: MixpanelType] = ["keyword": "Lumpani"]
            mixpanelInstance.track(event: "Search", properties: properties)
            break

        case 5:
            let properties: [String: MixpanelType] = ["property_id": "rd24346",
                                                      "property_title": "Lumpani Place",
                                                      "property_type": "Apartment",
                                                      "property_added_date": Date.now]
            mixpanelInstance.track(event: "Property Listed", properties: properties)
            break

        case 6:
            let properties: [String: MixpanelType] = ["property_id": "rd24346",
                                                      "property_title": "Lumpani Place",
                                                      "property_type": "Apartment"]
            mixpanelInstance.track(event: "Property Open", properties: properties)
            break

        case 7:
            let properties: [String: MixpanelType] = ["property_id": "rd24346",
                                                      "property_title": "Lumpani Place",
                                                      "property_type": "Apartment",
                                                      "property_sold_date": Date.now]
            mixpanelInstance.track(event: "Property Sold", properties: properties)
            break

        case 8:
            let properties: [String: MixpanelType] = ["property_type": "Apartment",
                                                      "price_low": "10000",
                                                      "price_max": "30000"]
            mixpanelInstance.track(event: "Filter", properties: properties)
            break

        case 9:
            let properties: [String: MixpanelType] = ["logout_time": Date.now]
            mixpanelInstance.track(event: "Logout", properties: properties)
            break

        default:
            break
        }
    }
}

//
//  ViewController.swift
//  SensorRx
//
//  Created by Ray on 2022/9/21.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        tableView.rx.itemSelected.subscribe(onNext: {[weak self] idx in
            guard let `self` = self else {return}
            print(idx)
        })
        
        self.rx.methodInvoked(#selector(viewWillAppear(_:)))
            .subscribe(onNext: {[weak self] _ in
                guard let `self` = self else {return}
                print("viewWillAppear")
            })
        
        
        
    }

    @IBAction func onBtnClick(_ sender: UIButton) {
        print("click")
        
    }
    
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
}

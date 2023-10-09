//
//  MemberListViewController.swift
//  MemberList
//
//  Created by Bowon Han on 10/8/23.
//

import UIKit

class MemberListViewController:UIViewController{
    var memberList = [
        Member(memberImage: "배트맨.png",memberNumber: "0", memberName: "배트맨", memberAge: "20", memberPhoneNumber: "010-8030-2020", memberAddress: "광주광역시"),
        Member(memberImage: "임꺽정.png",memberNumber: "1", memberName: "임꺽정", memberAge: "20", memberPhoneNumber: "010-2345-2634", memberAddress: "서울특별시"),
        Member(memberImage: "홍길동.png",memberNumber: "2", memberName: "홍길동", memberAge: "20", memberPhoneNumber: "010-5645-8678", memberAddress: "광주광역시")
    ]
    
    private lazy var myTableView:UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setConstraint()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationButton()
        myTableView.reloadData()
    }
    
    private func setConstraint(){
        let safeArea = view.safeAreaLayoutGuide

        myTableView.register(MemberListViewCell.self, forCellReuseIdentifier: MemberListViewCell.identifier)

        self.view.addSubview(myTableView)
        
        myTableView.translatesAutoresizingMaskIntoConstraints = false
                
        myTableView.rowHeight = UITableView.automaticDimension
        myTableView.estimatedRowHeight = UITableView.automaticDimension

        NSLayoutConstraint.activate([
            myTableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            myTableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            myTableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            myTableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
    }
    
    private func setNavigationButton(){
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onTapAdd))
        self.navigationItem.rightBarButtonItem = addButton
        self.navigationItem.title = "회원 목록"
    }
    
    @objc func onTapAdd(_:UIBarButtonItem){
        let AddMemberVC = AddMemberViewController()
        self.navigationController?.pushViewController(AddMemberVC, animated: true)
    }
}

extension MemberListViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MemberListViewCell.identifier, for: indexPath) as? MemberListViewCell else { return UITableViewCell() }
        
        guard indexPath.row < memberList.count else { return UITableViewCell() }

        let data = memberList[indexPath.row]
        
        cell.memberNameLabel.text = data.memberName
        cell.memberPicturesImageView.image = UIImage(named:data.memberImage)
        cell.memberAddressLabel.text = data.memberAddress
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberList.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
        } else if editingStyle == .insert {

        }
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
    
    //cell 위치 움직이는 함수
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let memberData = memberList[indexPath.row]
        let UpdateMemberVC = UpdateMemberViewController(member: memberData)
        
        UpdateMemberVC.UpdateMemberImageView.image = UIImage(named: memberData.memberImage)
        UpdateMemberVC.UpdateMemberNumberTextField.text = memberData.memberNumber
        UpdateMemberVC.UpdateMemberNameTextField.text = memberData.memberName
        UpdateMemberVC.UpdateMemberAgeTextField.text = memberData.memberAge
        UpdateMemberVC.UpdateMemberAddressTextField.text = memberData.memberAddress
        UpdateMemberVC.UpdateMemberPhoneNumberTextField.text = memberData.memberPhoneNumber
        
        self.navigationController?.pushViewController(UpdateMemberVC, animated: true)
    }

}



// MARK: - for canvas
import SwiftUI

struct ViewControllerRepresentable: UIViewControllerRepresentable{
    typealias UIViewControllerType = MemberListViewController
    
    func makeUIViewController(context: Context) -> MemberListViewController {
        return MemberListViewController()
    }
    
    func updateUIViewController(_ uiViewController: MemberListViewController, context: Context) {
        
    }
}

@available(iOS 13.0.0, *)
struct ViewPreview: PreviewProvider{
    static var previews: some View{
        ViewControllerRepresentable()
    }
}


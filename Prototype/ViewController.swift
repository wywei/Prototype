//
//  ViewController.swift
//  Prototype
//
//  Created by 王亚威 on 2022/11/15.
//

import UIKit

class Resume {
    private var name = ""
    private var sex = ""
    private var age = ""
    private var timeArea = ""
    private var company = ""
    
    init(name: String) {
        self.name = name
    }
    
    func setPersonalInfo(sex: String, age: String) {
        self.sex = sex
        self.age = age
    }
    
    func setWorkExperience(timeArea: String, company: String) {
        self.timeArea = timeArea
        self.company = company
    }
    
    func display() {
        print("\(self.name) \(self.sex) \(self.age) \(self.timeArea) \(self.company)")
    }
    
}


protocol ICloneable {
    init(original: Self)
    func setPersonalInfo(sex: String, age: String)
    func setWorkExperience(timeArea: String, company: String)
    func display()
}

extension ICloneable {
    func clone() -> Self {
        return Self.init(original: self)
    }
}


class Resume1: ICloneable {
    private var name = ""
    private var sex = ""
    private var age = ""
    private var timeArea = ""
    private var company = ""
    
    init(name: String) {
        self.name = name
    }
    
    required init(original: Resume1) {
        name = original.name
    }
    
    func setPersonalInfo(sex: String, age: String) {
        self.sex = sex
    }
    
    func setWorkExperience(timeArea: String, company: String) {
        self.timeArea = timeArea
        self.company = company
    }
    
    func display() {
        print("\(self.name) \(self.sex) \(self.age) \(self.timeArea) \(self.company)")
    }
    
}

class WorkExperience: ICloneable {
     var workDate = ""
     var company = ""
     init() {
     }
    required init(original: WorkExperience) {
        workDate = original.workDate
        company = original.company
    }
    
    func setPersonalInfo(sex: String, age: String) {
        
    }
    
    func setWorkExperience(timeArea: String, company: String) {
        
    }
    
    func display() {
        
    }

}
 
class Resume2: ICloneable {
    
    required init(original: Resume2) {
        name = original.name
    }
    
    private var name = ""
    private var sex = ""
    private var age = ""
  
    private var work: WorkExperience?
    
    init(name: String) {
        self.name = name
        work = WorkExperience()
    }
    
    init(work: WorkExperience) {
        self.work = work.clone()
    }
    
    func setPersonalInfo(sex: String, age: String) {
        self.sex = sex
    }
    
    func setWorkExperience(timeArea workDate: String, company: String) {
        work?.workDate = workDate
        work?.company = company
    }
    
    func display() {
        print("\(self.name) \(self.sex) \(self.age) \(work?.workDate ?? "") \(work?.company ?? "")")
    }
    
    func clone() -> Resume2 {
        let r = Resume2(work: self.work!)
        r.name = name
        r.sex = sex
        r.age = age
        return r
    }

}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let resume = Resume2(name: "andy")
        print("wyw--0-", resume)
        resume.setPersonalInfo(sex: "男", age: "30")
        resume.setWorkExperience(timeArea: "上海", company: "毒厂")
        resume.display()
        
//        let resume1 = Resume(name: "zs")
//        resume1.setPersonalInfo(sex: "男", age: "18")
//        resume1.setWorkExperience(timeArea: "上海", company: "毒厂")
//        resume1.display()
        
//        let resume1 = resume.clone()
//        print("wyw--1-", resume1)
//        resume1.setPersonalInfo(sex: "男", age: "25")
//        resume1.setWorkExperience(timeArea: "北京", company: "sina")
//        resume1.display()
        
        
        let resume3 = resume.clone()
        resume3.setPersonalInfo(sex: "女", age: "18")
        resume3.setWorkExperience(timeArea: "成都", company: "logic")
        resume3.display()
    }


}


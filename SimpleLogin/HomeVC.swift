//
//  HomeVC.swift
//  HexMask
//
//  Created by Savana on 02/06/16.
//  Copyright © 2016 SH. All rights reserved.
//

import UIKit

class HomeVC: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var btn_trailingConstraint: NSLayoutConstraint!
    @IBOutlet var btn_leadingConstraint: NSLayoutConstraint!
    @IBOutlet var btn_bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var vw_logIn: UIView!
    @IBOutlet weak var vw_bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var fly_topConstraint: NSLayoutConstraint!
    @IBOutlet weak var img_CenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var btn_high: UIButton!
    @IBOutlet weak var tf_email: UITextField!
    @IBOutlet weak var tf_password: UITextField!
    @IBOutlet weak var im_upArrow: UIImageView!
    @IBOutlet weak var btn_forgotPassword: UIButton!
    var lastTest:String?;
    //MARK:- UIViewController life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.vw_bottomConstraint.constant = -350;
        self.vw_logIn.hidden = false;
        // Do any additional setup after loading the view.
        self.tf_email.createLeftViewWithBottomBorderImage(UIImage(named: "mail")!);
        self.tf_password.createLeftViewWithBottomBorderImage(UIImage(named: "password")!);
        let image:UIImage = im_upArrow.image!.imageWithRenderingMode(.AlwaysTemplate);
        im_upArrow.tintColor = UIColor.init(red: 239/255.0, green: 247/255.0, blue: 253/255.0, alpha: 1.0);
        im_upArrow.image = image;
        self.navigationController?.navigationBar.hidden = true;
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController?.navigationBar.hidden = true;
    }
    
    //MARK:- IBAction
    @IBAction func btn_Click(sender: UIButton) {
        
        let constantValue:CGFloat = (sender.selected) ? 50.0 : 0.0;
        let viewConstant:CGFloat = (sender.selected) ? -350.0 : 0.0;
        let flyConstraint:CGFloat = (sender.selected) ? 30 : -150;
        let cornerRadius:CGFloat = (sender.selected) ? sender.frame.size.height/2 : 0;
        self.btn_bottomConstraint.constant = constantValue;
        self.btn_leadingConstraint.constant = constantValue;
        self.btn_trailingConstraint.constant = constantValue;
        self.vw_bottomConstraint.constant = viewConstant;
        self.fly_topConstraint.constant = flyConstraint;
        UIView.animateWithDuration(0.75, animations: {
            
            sender.layer.cornerRadius = cornerRadius;
            self.view.layoutIfNeeded();
        }) { (finished) in
            if finished && (cornerRadius != 0 )
            {
                self.vw_logIn.hidden = sender.selected;
            }
        }
        sender.selected = !sender.selected;
    }
    
    @IBAction func signIn_UpClicked(sender: UIButton) {
        
        let otherTag:Int = (sender.tag == 1) ? 2 :1 ;
        self.btn_high.setTitle(sender.titleLabel?.text?.uppercaseString, forState: UIControlState.Selected);
        sender.selected = true;
        self.img_CenterConstraint.constant = CGFloat(sender.tag-1)*sender.frame.size.width;
        for v in self.vw_logIn.subviews
        {
            if v.isKindOfClass(UIView) && v.tag != 3
            {
                let but = v.viewWithTag(otherTag) as! UIButton;
                but.selected = false;
            }
        }
        UIView.animateWithDuration(0.5) {
            self.vw_logIn.layoutIfNeeded();
        }
    }
    
    @IBAction func forgotPassword_Clicked(sender: UIButton) {
        if !sender.selected {
            lastTest = self.btn_high.titleLabel?.text;
        }
        let text = (sender.selected) ? lastTest : sender.titleLabel?.text;
        self.tf_password.hidden = !sender.selected;
        sender.selected = !sender.selected;
        self.btn_high.setTitle(text, forState: .Selected);
        
        
    }
    //MARK:- UIStatusBarStyle
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent;
    }
    
    // MARK:- UITextFieldDelegate
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        self.moveBottomConstraint(true);
        self.btn_high.userInteractionEnabled = false;
        return true;
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if  textField == self.tf_email && !self.tf_password.hidden {
            self.tf_password.becomeFirstResponder();
        }else{
            self.btn_forgotPassword.selected = false;
            self.tf_password.hidden = false;
            self.btn_high.userInteractionEnabled = true;
            self.moveBottomConstraint(false);
            textField.endEditing(true);
            self.btn_Click(self.btn_high)
            self.tf_email.text = nil;
            self.tf_password.text = nil;
            self.performSegueWithIdentifier("showFeed", sender: nil);
        }
        return true;
    }
    // MARK: Toggle LoginView Frame
    func moveBottomConstraint(up:Bool) {
        let value:CGFloat = up ? 180 : 0;
        self.btn_bottomConstraint.constant = value;
        UIView.animateWithDuration(0.5) {
            self.view.layoutIfNeeded();
        };
    }
}

//
//  recipeSearchTableViewCell.swift
//  recipesApp
//
//  Created by ahmed elbasha on 29/07/2021.
//  Copyright © 2021 ahmed elbasha. All rights reserved.
//

import UIKit
protocol recipeSearchTableViewCellProtocol {
    func sendDataToViewModel(dataofTheCell:Hit)
    func Configration(recipeImage:UIImage,recipeTitle:String,recipeDescription:String,recipeHealthLabel:String)
}
class recipeSearchTableViewCell: UITableViewCell {

    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeSourceLabel: UILabel!
    @IBOutlet weak var recipeCategoryLabel: UILabel!
    var delegate: recipeSearchTableViewCell?
    var viewModel: recipeSearchTableViewCellViewModelProtocol?
    var callback: ((UITableViewCell) -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        SetUpUILabel()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 3, bottom: 8, right: 3))
        self.viewModel = recipeSearchTableViewCellViewModel(view: self)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension recipeSearchTableViewCell{
   private func configure(recipeImage:UIImage,recipeTitle:String,recipeDescription:String,recipeHealthLabel:String){
        self.recipeImage.image=recipeImage
        self.recipeTitleLabel.text = recipeTitle
        self.recipeSourceLabel.text = recipeDescription
        self.recipeCategoryLabel.text = recipeHealthLabel
    }
}
extension recipeSearchTableViewCell{
    private func SetUpUILabel(){
        recipeTitleLabel.sizeToFit()
         recipeTitleLabel.numberOfLines = 0
    }

}
extension recipeSearchTableViewCell: recipeSearchTableViewCellProtocol{
    func sendDataToViewModel(dataofTheCell: Hit) {
        viewModel?.takeDataFromVC(data: dataofTheCell)
    }
    
    func Configration(recipeImage: UIImage, recipeTitle: String, recipeDescription: String, recipeHealthLabel: String) {
        configure(recipeImage: recipeImage, recipeTitle: recipeTitle, recipeDescription: recipeDescription, recipeHealthLabel: recipeHealthLabel)
    }
    
    
}
extension UIView {
    func shake(_ duration: Double? = 0.6) {
        self.transform = CGAffineTransform(translationX: 10, y: 0)
        UIView.animate(withDuration: duration ?? 0.4, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 100, options: .curveEaseInOut, animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
}

extension UITableViewCell{
    func shadowAndBorderForCell(yourTableViewCell : UITableViewCell){
        let margins = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
        yourTableViewCell.contentView.frame = contentView.frame.inset(by: margins)
        yourTableViewCell.contentView.layer.cornerRadius = 25
        yourTableViewCell.contentView.layer.borderWidth = 2
        yourTableViewCell.contentView.layer.borderColor = UIColor.darkGray.cgColor
        yourTableViewCell.contentView.layer.masksToBounds = true
        yourTableViewCell.layer.shadowColor = UIColor.gray.cgColor
        yourTableViewCell.layer.shadowOffset = CGSize(width: 2, height: 1)
        yourTableViewCell.layer.shadowRadius = 1
        yourTableViewCell.layer.shadowOpacity = 0
        yourTableViewCell.layer.masksToBounds = false
        yourTableViewCell.layer.shadowPath = UIBezierPath(roundedRect:yourTableViewCell.bounds, cornerRadius:yourTableViewCell.contentView.layer.cornerRadius).cgPath
        yourTableViewCell.layer.cornerRadius = 8
         yourTableViewCell.layer.shadowOffset = CGSize(width: 0, height: 3)
         yourTableViewCell.layer.shadowRadius = 3
         yourTableViewCell.layer.shadowOpacity = 0.3
         yourTableViewCell.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 8, height: 8)).cgPath
         yourTableViewCell.layer.shouldRasterize = true
         yourTableViewCell.layer.rasterizationScale = UIScreen.main.scale
    }
}

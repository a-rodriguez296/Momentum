//
//  ApplicationsViewCell.swift
//  Momentum
//
//  Created by Alejandro Rodriguez on 5/11/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import UIKit
import AlamofireImage
import MGSwipeTableCell

class ApplicationsViewCell: MGSwipeTableCell {

    @IBOutlet weak var imgApplication: UIImageView!
    @IBOutlet weak var lblApplication: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgApplication.clipsToBounds = true
        imgApplication.layoutIfNeeded()
    }
    
    
    func initializeCell(withApplication application: CDApplication){
        
        lblApplication.text = application.name!
        
        //If thumbnail is available, use it. Otherwise, donwload it
        if let thumbnail = application.photo?.image(){
            imgApplication.image = thumbnail
        }
        else{
            imgApplication.af_setImage(withURL: URL(string: application.thumbnailURL!)!,
                                        placeholderImage: nil,
                                        filter: nil,
                                        progress: nil,
                                        progressQueue: DispatchQueue.main,
                                        imageTransition: .flipFromLeft(1),
                                        runImageTransitionIfCached: false,
                                        completion: { (response) in
                                            
                                            switch response.result{
                                            case .success(let image):
                                                application.assignPhoto(image: image)
                                            case .failure:
                                                break
                                            }
                                            
            })
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imgApplication.af_cancelImageRequest()
        imgApplication.image = nil
    }
}

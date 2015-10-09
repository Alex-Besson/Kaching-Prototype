//
//  ProgressBarExtension.swift
//  Home Test 4
//
//  Created by Miwand Najafe on 2015-10-09.
//  Copyright © 2015 Alexander Besson. All rights reserved.
//

import Foundation

extension UIProgressView {
    public func ChangeProgressBar(currentCommit:Float,threshold:Float){
        
         let currentBarProgress = currentCommit/threshold
        
        self.setProgress(currentBarProgress, animated: true)
    
    }
    
    
    
}

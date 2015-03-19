//
//  recordedAudio.swift
//  Pitch Perfect
//
//  Created by Florin Tudose on 06.03.15.
//  Copyright (c) 2015 FLO Media. All rights reserved.
//

import Foundation

class RecordedAudio: NSObject{
    var filePathUrl: NSURL!
    var title: String!
    
    init(filePathUrl: NSURL, title: String){
            
            self.filePathUrl = filePathUrl
            self.title = title
    }

    
    

}
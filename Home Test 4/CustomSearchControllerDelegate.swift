//
//  CustomSearchControllerDelegate.swift
//  Home Test 4
//
//  Created by Alexander Besson on 2015-10-01.
//  Copyright © 2015 Alexander Besson. All rights reserved.
//

import Foundation

protocol CustomSearchControllerDelegate {
    func didStartSearching()
    
    func didTapOnSearchButton()
    
    func didTapOnCancellButton()
    
    func didChangeSearchText(searchText: String)
}


//
//  ImagePicker.swift
//  Ten Thousand
//
//  Created by Mikael Weiss on 5/11/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
}

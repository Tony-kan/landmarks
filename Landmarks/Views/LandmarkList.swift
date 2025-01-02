//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Tony on 1/2/25.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        
        NavigationSplitView{
            
            List(landmarks){ landmark in
                
                NavigationLink{
                    
                    LandmarkDetails(landmark: landmark)
                    
                } label:{
                    
                    LandmarkRow(landmark: landmark)
                    
                }
            }
            .navigationTitle("Landmarks")
            
        } detail: {
            
           Text("Select Landmark")
            
        }
    }
}

#Preview {
    LandmarkList()
}

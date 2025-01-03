//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Tony on 1/2/25.
//

import SwiftUI

struct LandmarkList: View {
    
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly: Bool = false
    
    var filteredLandmarks: [Landmark] {
        
        modelData.landmarks.filter { landmark in
            
            (!showFavoritesOnly || landmark.isFavorite)
            
        }
    }
   
    var body: some View {
        
        NavigationSplitView{
            
            List {
                Toggle(isOn: $showFavoritesOnly){
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks){ landmark in
                    
                    NavigationLink{
                        
                        LandmarkDetails(landmark: landmark)
                        
                    } label:{
                        
                        LandmarkRow(landmark: landmark)
                        
                    }
                }
            }
                .animation(.default,value: filteredLandmarks)
                .navigationTitle("Landmarks")
           
                
            } detail: {
                
                Text("Select Landmark")
                
            }
      
    }
}

#Preview {
    LandmarkList()
}

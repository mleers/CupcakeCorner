//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by mitch on 11/7/22.
//  Copyright © 2022 mleers. All rights reserved.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var oo: ObservableOrder
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $oo.order.name)
                TextField("Street Address", text: $oo.order.streetAddress)
                TextField("City", text: $oo.order.city)
                TextField("Zip", text: $oo.order.zip)
            }
            
            Section {
                NavigationLink {
                    CheckoutView(oo: oo)
                } label: {
                    Text("Check out")
                }
            }
            .disabled(oo.order.hasValidAddress == false)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(oo: ObservableOrder(order: Order()))
    }
}

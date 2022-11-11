//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by mitch on 11/4/22.
//  Copyright © 2022 mleers. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var oo = ObservableOrder(order: Order())
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $oo.order.type) {
                        ForEach(Order.types.indices) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(oo.order.quantity)", value: $oo.order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special requests?", isOn: $oo.order.specialRequestEnabled.animation())
                    
                    if oo.order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $oo.order.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $oo.order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(oo: oo)
                    } label: {
                        Text("Delivery details")
                    }
                }
            }
            .navigationTitle("Cupcake corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

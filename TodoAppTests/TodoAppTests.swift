//
//  TodoAppTests.swift
//  TodoAppTests
//
//  Created by Esteban SEMELLIER on 29/04/2023.
//

import XCTest
import SwiftUI
import CoreData
@testable import TodoApp


final class TodoAppTests: XCTestCase {

    // Variables Tests
    let viewContext = PersistenceController(inMemory: true).container.viewContext
    @ObservedObject var vm = TodoViewModel()
    



    func testAddFunction() {
        
        let title = "UnitTestAddFunctionTitle"
        let plot = "UnitTestAddFunctionDescription"
        let expire = Date.now
        let dateToggleSwitch = false
        let categoryPickerSelection: CategoryPickerSelection = .maison
        
        let item = vm.addItem(title: title, plot: plot, expire: expire, categogyPickerSelection: categoryPickerSelection, dateToggleSwitch: dateToggleSwitch, vc: viewContext)

        
        print(item)
        XCTAssertEqual(item.title, title)
        XCTAssertEqual(item.plot, plot)
        if item.dateToggleSwitch {
            XCTAssertEqual(item.expire, expire)
        }
        XCTAssertEqual(item.dateToggleSwitch, dateToggleSwitch)
    }
    func testSaveItem() {
        // Add Item
        Task {
            vm.todos = await vm.loadData(vc: viewContext)
            let item2 = vm.addItem(title: "titleBeforeUpdate", plot: "plotBeforeUpdate", expire: Date.now, categogyPickerSelection: .maison, dateToggleSwitch: false, vc: viewContext)
            vm.saveItem(item: item2, title: "title" , plot: "Description" , categogyPickerSelection: .travail, expire: Date.now , vc: viewContext)
            let todos = await vm.loadData(vc: viewContext)
            print(todos.count)
        }
        
            }
}

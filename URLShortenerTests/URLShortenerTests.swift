//
//  URLShortenerTests.swift
//  URLShortenerTests
//
//  Created by dos Santos, Diego on 24/02/21.
//

import XCTest
@testable import URLShortener

class URLShortenerTests: XCTestCase {
}


//var count_hkmvrnsmx = 0
//
//func computeValue(for index: Int) -> Double {
//    count_hkmvrnsmx += 1
//    return cos(Double(index)) * 9
//}
//
//func getSequence() -> AnySequence<Double> {
//    let yourSequence = [1,2,3,1,2,3]
//    var resultSequence = [Double]()
//
//    for index in 0...yourSequence.count-1 {
//        resultSequence.append(computeValue(for: index))
//    }
//
//    return AnySequence(resultSequence)
//}
//let candidateSequence = getSequence()
//print(candidateSequence)


//let _ourConversionTableToTestOutput = ["abacaxi": 0.0, "morango": 2.0, "banana": 4.0]
//
//
//struct TestElement: CustomDebugStringConvertible {
//    let value: String
//
//    public var debugDescription: String {
//        return (_ourConversionTableToTestOutput[value] ?? -1.0).debugDescription
//    }
//}
//
//
//func flatApply<T, Y>(_ array: [T?], _ function: (T) -> Y) -> [Y] {
//    return array.compactMap{$0}.map{function($0)}
//}
//
//
//let optionalKeys = ["abacaxi", "morango", "banana", nil]
//
//print(flatApply(optionalKeys, { TestElement(value:$0) }))




//struct Person {
//    var name: String
//    var age: Int
//}
//
//var bob = Person(name: "Bob", age: 20)
//
//// Enter your code here. Create a function called `addAge`
//func addAge(_ person: inout Person, _ years: Int) {
//    person.age += years;
//}
//
//let years = Int(readLine()!)!
//let labelErasedFunction = addAge
//labelErasedFunction(&bob, years)
//print(bob.age) // 22





// Enter your code here. Create a protocol with a default implementation
//protocol Worker {
//    func perform<T, Y: Worker>(_ function: @escaping (Y) -> T) -> () -> T
//}
//
//extension Worker {
//    func perform<T, Y: Worker>(_ function: @escaping (Y) -> T) -> () -> T {
//        return {
//            return function as! T
//        }
//    }
//}
//
//
//struct TestStruct {
//    var name: String
//    var age: Int
//}
//
//extension TestStruct: Worker {
//}
//let work = TestStruct(name: "Bob", age: 10).perform { $0.age }
//print(type(of: work))
//print(work())


//import Foundation
//
//protocol VariableValue {
//    var value: Int { get }
//    func increment()
//    func decrement()
//}
//
//
//class Wallet: VariableValue {
//    var value: Int
//    private let serialQueue = DispatchQueue(label: "serial")
//
//    init(value: Int) {
//        self.value = value
//    }
//
//    // Enter your code here.
//    func increment() {
//        serialQueue.sync {
//            self.value = self.value + 1
//        }
//    }
//
//    func decrement() {
//        serialQueue.sync {
//            self.value = self.value - 1
//        }
//    }
//}
//
//let wallet = Wallet(value: 0)
//
//let group = DispatchGroup()
//
//print(wallet.value) // 0
//
//wallet.increment()
//print(wallet.value) // 1
//
//wallet.decrement()
//print(wallet.value) // 0
//
//DispatchQueue(label: "one").async {
//    group.enter()
//    for _ in 0..<50_000 {
//        wallet.increment()
//    }
//    group.leave()
//}
//
//DispatchQueue(label: "two").async {
//    group.enter()
//    for _ in 0..<50_000 {
//        wallet.decrement()
//    }
//    group.leave()
//}
//
//RunLoop.main.run(until: Date())
//
//group.wait()
//
//print(wallet.value) // 0

//
//import Foundation
//
//class SomeViewController: TableViewDelegate {
//    var didLoadWasCalled = false
//    var handleActionCalled = 0
//    let table: TableView
//    let confirmButton: Button
//    let cancelButton: Button
//
//    init(table: TableView,
//         confirmButton: Button,
//         cancelButton: Button) {
//        self.table = table
//        self.confirmButton = confirmButton
//        self.cancelButton = cancelButton
//        viewDidLoad()
//    }
//
//    func handleAction() {
//        handleActionCalled += 1
//    }
//}
//
//// The following code has retain cycles. Fix them.
//protocol TableViewDelegate: class {
//    func handleAction()
//}
//
//class TableView {
//    weak var delegate: TableViewDelegate?
//}
//
//class Button {
//    var onClick: (() -> Void)?
//}
//
//extension SomeViewController  {
//    func viewDidLoad() {
//        table.delegate = self
//        confirmButton.onClick = handleAction
//        cancelButton.onClick = {
//            self.handleAction()
//        }
//    }
//}
//
//weak var viewController: SomeViewController?

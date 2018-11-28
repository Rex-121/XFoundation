//
//  XTestString.m
//  XFoundation_Tests
//
//  Created by Ray on 2018/10/12.
//  Copyright © 2018 Ray. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSString+Mutating.h"

#import "NSArray+String.h"

@interface XTestString : XCTestCase

@end

@implementation XTestString

- (void)setUp {

    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testErase {
    
    NSString *a = @"1a2b3c4d5e6f7g0";
    
    XCTAssertTrue([a.erase(@"1234567") isEqualToString:@"abcdefg0"]);
    
    XCTAssertTrue([a.dropAllDigits isEqualToString:@"abcdefg"]);
    
    XCTAssertTrue([a.leftAllDigits isEqualToString:@"12345670"]);
    
    XCTAssertTrue([a.dropZero isEqualToString:@"1a2b3c4d5e6f7g"]);
    
    XCTAssertFalse(a.isDecimal);
    
    NSString *b = @".1234";
    XCTAssertTrue(b.isDecimal);
    
    NSString *c = @"312lh 321 3j12h3k12h4e";
    XCTAssertTrue([c.dropAllWhiteSpace isEqualToString:@"312lh3213j12h3k12h4e"]);
    
    NSString *d = @" 1 2 345 \n";
    NSString *withNewLine = @"1 2 345 \n";
    NSString *withoutNewLine = @"1 2 345";
    XCTAssertFalse([d isEqualToString:withNewLine]);
    XCTAssertTrue([DropHeadFootSpace(d, NO) isEqualToString:withNewLine]);
    XCTAssertTrue([DropHeadFootSpace(d, YES) isEqualToString:withoutNewLine]);
}

- (void)testFlatString {
    
    NSArray <NSString *>*array = @[@"-9",@"-4",@"-7",@"5",@"1",@"0",@"-3",@"6",@"-1",@"-4"];
    
    NSString *k = [array words:^NSString * _Nonnull(NSString * _Nonnull obj) {
        return obj;
    } joinedBy:@","];
    XCTAssertTrue([k isEqualToString:@"-9,-4,-7,5,1,0,-3,6,-1,-4"]);
    
    
    NSDictionary *dic = @{@"1":@"a", @"2": @"b", @"3": @"c"};
//
//    k = [[dic flatKeyValue:^NSString * _Nonnull(id  _Nonnull obj) {
//        return obj;
//    } joinedBy:@"->"] words:^NSString * _Nonnull(id  _Nonnull obj) {
//        return obj;
//    } joinedBy:@""];
    
    k = [dic flatKeyValue:^NSString * _Nonnull(id  _Nonnull obj) {
        return obj;
    } joinedBy:@"->" pending:@""];
    
     XCTAssertTrue([k isEqualToString:@"1->a2->b3->c"]);
}

@end

//
//  XTestRegex.m
//  XFoundation_Tests
//
//  Created by Ray on 2018/11/7.
//  Copyright © 2018 Ray. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "XRegex.h"

@interface XTestRegex : XCTestCase

/**  */
@property (nonatomic, strong)NSArray <NSString *>*nameArray;
@property (nonatomic, strong)NSArray <NSString *>*ageArray;

@end

@implementation XTestRegex

- (void)setUp {
    self.nameArray = @[
                       @{@"name":@"a"},
                       @{@"name":@"b"},
                       @{@"name":@"c"},
                       @{@"name":@"abcd"},
                       @{@"name":@"abcde"},
                       @{@"name":@"f"},
                       @{@"name":@"g"},
                       @{@"name":@"h"},
                       @{@"name":@"ijklmn"},
                       @{@"name":@"jklmn"},
                       ];
    self.ageArray = @[@{@"age":@1},
                      @{@"age":@12},
                      @{@"age":@13},
                      @{@"age":@14},
                      @{@"age":@3}];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    
    NSString *psw = @"ray1234567890";
    
    XCTAssertTrue([psw match:@"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$"]);
    
    NSArray *arrayY = [self.nameArray matchKey:@"name" way:eRegex_contains value:@"c"];
    NSArray *y = @[@{@"name":@"c"},
                  @{@"name":@"abcd"},
                  @{@"name":@"abcde"}];
    XCTAssertTrue([arrayY isEqualToArray:y]);

    NSArray *arrayZ = [self.nameArray matchKey:@"name" way:eRegex_like value:@"a*d"];
    XCTAssertTrue([arrayZ isEqualToArray:@[@{@"name":@"abcd"}]]);
    
    NSArray *arrayZz = [self.nameArray matchKey:@"name" way:eRegex_like value:@"*k*"];
    NSArray *zz = @[@{@"name":@"ijklmn"},
                    @{@"name":@"jklmn"}];
    XCTAssertTrue([arrayZz isEqualToArray:zz]);

 
    
    
    NSArray *arrayZzz = [self.ageArray matchKey:@"age" operation:@"=" value:@3];
    XCTAssertTrue([arrayZzz isEqualToArray:@[@{@"age": @3}]]);
    
    NSArray *arrayZzzz = [self.ageArray matchKey:@"age" operation:@">=" value:@3];
    NSArray *zzzz = @[@{@"age":@12},
                      @{@"age":@13},
                      @{@"age":@14},
                      @{@"age":@3}];
    XCTAssertTrue([arrayZzzz isEqualToArray:zzzz]);
}


- (void)testR {
    
    BOOL i = X_IsAllInt(@"1235413123");
    XCTAssertTrue(i);
    
    i = X_IsAllInt(@"12354131ggg23");
    XCTAssertFalse(i);
//
    i = X_IsEmail(@"321@163.com");
    XCTAssertTrue(i);
//
    i = X_IsEmail(@"12354131ggg23@133,com");
    XCTAssertFalse(i);
}

@end

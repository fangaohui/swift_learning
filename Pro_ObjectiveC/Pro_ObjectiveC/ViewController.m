//
//  ViewController.m
//  Pro_ObjectiveC
//
//  Created by MichaelFan on 2017/11/9.
//  Copyright © 2017年 MichaelFan. All rights reserved.
//

#import "ViewController.h"
extern void _objc_autoreleasePoolPrint();

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _objc_autoreleasePoolPrint();
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

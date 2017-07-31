//
//  ViewController.m
//  WeatherMonitor
//
//  Created by pradeep gunasekaran on 7/31/17.
//  Copyright © 2017 pradeep gunasekaran. All rights reserved.
//

#import "ViewController.h"
#import "WeatherBuilder.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *city = @"Chennai";
    
    WeatherBuilder *instance = [[WeatherBuilder alloc]init];
    
    [instance getFiveDayForecast:city
                     sucessBlock:^(NSDictionary *responce) {
                         
                        // NSLog(@"%@", responce);
                         
                   }failureBlock:^(NSError *error) {
        
                     //  NSLog(@"%@", error);
            }];
    
}


@end

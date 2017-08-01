//
//  ViewController.m
//  WeatherMonitor
//
//  Created by pradeep gunasekaran on 7/31/17.
//  Copyright © 2017 pradeep gunasekaran. All rights reserved.
//

#import "ViewController.h"
#import "WeatherNetworkManager.h"
#import "WeatherBuilder.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // calling Weather Builder
    [WeatherBuilder buildWeatherObjectsWithSuccessBlock:^(NSArray *weatherArray) {
        
        NSLog(@"%@", weatherArray);
        
    } failureBlock:^(NSError *error) {
        
        NSLog(@"%@", error.localizedDescription);
    }];
    
}


@end

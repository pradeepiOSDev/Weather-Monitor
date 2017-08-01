//
//  Temprature.m
//  WeatherMonitor
//
//  Created by pradeep gunasekaran on 7/31/17.
//  Copyright © 2017 pradeep gunasekaran. All rights reserved.
//

#import "Temprature.h"

@implementation Temprature

- (instancetype)initWithCurrentTemprature:(NSString *)currentTemprature
                            maxTemprature:(NSString *)maxTemprature
                            minTemprature:(NSString *)minTemprature{
    
    self = [super init];
    
    if (self) {
        _currentTemprature = currentTemprature;
        _maxTemprature = maxTemprature;
        _minTemprature = minTemprature;
    }
    
    return self;
}


@end

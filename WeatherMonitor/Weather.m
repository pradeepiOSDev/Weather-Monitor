//
//  Weather.m
//  WeatherMonitor
//
//  Created by pradeep gunasekaran on 7/31/17.
//  Copyright © 2017 pradeep gunasekaran. All rights reserved.
//

#import "Weather.h"

@implementation Weather

- (instancetype)initWithWeatherDescription:(NSString *)weatherDescription
                                    iconID:(NSString *)iconID
                                temprature:(Temprature *)temprature{
    
    self = [super init];
    
    if (self) {
        
        _weatherDescription = weatherDescription;
        _iconID = iconID;
        _temprature = temprature;
    }
    
    return self;
}


@end

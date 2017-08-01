//
//  Weather.h
//  WeatherMonitor
//
//  Created by pradeep gunasekaran on 7/31/17.
//  Copyright © 2017 pradeep gunasekaran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Temprature.h"

@interface Weather : NSObject

@property(strong,nonatomic)NSString *weatherDescription;
@property(strong,nonatomic)NSString *iconID;
@property(strong,nonatomic)UIImage *weatherIcon;
@property(strong,nonatomic)Temprature *temprature;


- (instancetype)initWithWeatherDescription:(NSString *)weatherDescription
                                    iconID:(NSString *)iconID
                                temprature:(Temprature *)temprature;

@end

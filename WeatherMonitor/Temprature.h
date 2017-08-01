//
//  Temprature.h
//  WeatherMonitor
//
//  Created by pradeep gunasekaran on 7/31/17.
//  Copyright © 2017 pradeep gunasekaran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Temprature : NSObject

@property(strong, nonatomic)NSString *currentTemprature;
@property(strong, nonatomic)NSString *maxTemprature;
@property(strong, nonatomic)NSString *minTemprature;

- (instancetype)initWithCurrentTemprature:(NSString *)currentTemprature
                            maxTemprature:(NSString *)maxTemprature
                            minTemprature:(NSString *)minTemprature;

@end

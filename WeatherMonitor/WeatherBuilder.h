//
//  WeatherBuilder.h
//  WeatherMonitor
//
//  Created by pradeep gunasekaran on 7/31/17.
//  Copyright © 2017 pradeep gunasekaran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherBuilder : NSObject


- (void)getFiveDayForecast:(NSString *)cityName
               sucessBlock:(void (^)(NSDictionary *responce))sucess
              failureBlock:(void (^)(NSError *error))failure;

@end

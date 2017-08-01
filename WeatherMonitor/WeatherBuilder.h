//
//  WeatherBuilder.h
//  WeatherMonitor
//
//  Created by pradeep gunasekaran on 7/31/17.
//  Copyright © 2017 pradeep gunasekaran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weather.h"
#import "WeatherNetworkManager.h"

@interface WeatherBuilder : NSObject

+ (void)buildWeatherObjectsWithSuccessBlock:(void(^)(NSArray *weatherDictionary))sucess failureBlock:(void (^)(NSError *error))failureBlock;


@end

//
//  WeatherBuilder.m
//  WeatherMonitor
//
//  Created by pradeep gunasekaran on 7/31/17.
//  Copyright © 2017 pradeep gunasekaran. All rights reserved.
//

#import "WeatherBuilder.h"
#import "WeatherNetworkManager.h"
#import "Temprature.h"
#import "Weather.h"

@implementation WeatherBuilder


+ (void)buildWeatherObjectsWithSuccessBlock:(void(^)(NSArray *weatherDictionary))sucess failureBlock:(void (^)(NSError *error))failureBlock{
    
    //calling Weather Network Manager
    
    [WeatherNetworkManager getFiveDayForecast:@"" sucessBlock:^(NSDictionary *data) {
        
       // NSLog(@"%@", data);
        
        NSMutableArray *weatherArray = [NSMutableArray array];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            NSArray *listArrayFromData = data[@"list"];
            
            for (NSDictionary *dictionaryFromListArrayFromData in listArrayFromData) {
                
                // temprature
                NSString *currentTemp = dictionaryFromListArrayFromData[@"main"][@"temp"];
                NSString *minimumTemp = dictionaryFromListArrayFromData[@"main"][@"temp_min"];
                NSString *maximumTemp = dictionaryFromListArrayFromData[@"main"][@"temp_max"];
                
                // weather
                NSString *weatherDescription = dictionaryFromListArrayFromData[@"weather"][0][@"description"];
                NSString *weatherIconID = dictionaryFromListArrayFromData[@"weather"][0][@"icon"];
                
                Temprature *temp = [[Temprature alloc]initWithCurrentTemprature:currentTemp maxTemprature:maximumTemp minTemprature:minimumTemp];

                Weather *weather = [[Weather alloc]initWithWeatherDescription:weatherDescription iconID:weatherIconID temprature:temp];
                
                [weatherArray addObject:weather];
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                 sucess(weatherArray);
             });
      });

    }failureBlock:^(NSError *error) {
        
        failureBlock(error);
  }];

}


@end

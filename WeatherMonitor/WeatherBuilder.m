//
//  WeatherBuilder.m
//  WeatherMonitor
//
//  Created by pradeep gunasekaran on 7/31/17.
//  Copyright © 2017 pradeep gunasekaran. All rights reserved.
//

#import "WeatherBuilder.h"
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
                
                
[NSString stringWithFormat:@"%f", [dictionaryFromListArrayFromData[@"main"][@"temp"] floatValue]];
                
                
                // temprature
                NSString *currentTemp = [NSString stringWithFormat:@"%.1f", [dictionaryFromListArrayFromData[@"main"][@"temp"] floatValue] -272.15];
                
                NSString *minimumTemp = [NSString stringWithFormat:@"%.1f", [dictionaryFromListArrayFromData[@"main"][@"temp_min"] floatValue]-272.15];
              
                NSString *maximumTemp = [NSString stringWithFormat:@"%.1f", [dictionaryFromListArrayFromData[@"main"][@"temp_max"] floatValue]-272.15];
                
                // weather
                NSString *weatherDescription = dictionaryFromListArrayFromData[@"weather"][0][@"description"];
                NSString *weatherIconID = dictionaryFromListArrayFromData[@"weather"][0][@"icon"];
                
                //Downloading Image

                
                
                Temprature *temp = [[Temprature alloc]initWithCurrentTemprature:currentTemp maxTemprature:maximumTemp minTemprature:minimumTemp];

                Weather *weather = [[Weather alloc]initWithWeatherDescription:weatherDescription iconID:weatherIconID temprature:temp];
                
                
                NSString *iconID = [NSString stringWithFormat:@"http://openweathermap.org/img/w/%@.png", weatherIconID];
                NSURL *imageUrl = [NSURL URLWithString:iconID];
                weather.weatherIcon = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageUrl]];
                
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

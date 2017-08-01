//
//  WeatherNetworkManager.m
//  WeatherMonitor
//
//  Created by pradeep gunasekaran on 7/31/17.
//  Copyright © 2017 pradeep gunasekaran. All rights reserved.
//

#import "WeatherNetworkManager.h"

@implementation WeatherNetworkManager

static NSString *url = @"http://samples.openweathermap.org/data/2.5/forecast?q=London,us&&appid=2ec5676120395f6417a73e7e10c50c3b";


+ (void)getFiveDayForecast:(NSString *)cityName
               sucessBlock:(void (^)(NSDictionary *data))sucess
              failureBlock:(void (^)(NSError *error))failure{

    // Default Inizializations
    
    NSURL *urlForOpenWeather = [NSURL URLWithString:url];
    NSURLRequest *requestForData = [NSURLRequest requestWithURL:urlForOpenWeather];
    NSURLSessionConfiguration *configureService = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configureService];
    
    
    NSURLSessionDataTask *getDataFromOpenWeather = [session dataTaskWithRequest:requestForData completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if(error){
            failure(error);
        }
        else{
            
            NSDictionary *weatherData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            sucess(weatherData);
        }
    }];
    
    [getDataFromOpenWeather resume];
    
}

@end

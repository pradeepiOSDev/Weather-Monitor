//
//  WeatherCell.h
//  WeatherMonitor
//
//  Created by pradeep gunasekaran on 8/1/17.
//  Copyright © 2017 pradeep gunasekaran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Weather.h"
#import "Temprature.h"


@interface WeatherCell : UITableViewCell

- (void)configureWeather:(Weather *)weather;

@end

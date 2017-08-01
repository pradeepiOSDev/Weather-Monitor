//
//  WeatherCell.m
//  WeatherMonitor
//
//  Created by pradeep gunasekaran on 8/1/17.
//  Copyright © 2017 pradeep gunasekaran. All rights reserved.
//

#import "WeatherCell.h"

@interface WeatherCell()

@property (weak, nonatomic) IBOutlet UIImageView *weatherIcomImageView;

@property (weak, nonatomic) IBOutlet UILabel *currentDescriptionLabel;

@property (weak, nonatomic) IBOutlet UILabel *currentTempratureLabel;

@property (weak, nonatomic) IBOutlet UILabel *maxTempratureLabel;

@property (weak, nonatomic) IBOutlet UILabel *minTempratureLabel;

@end

@implementation WeatherCell

- (void)configureWeather:(Weather *)weather{
    
    self.currentTempratureLabel.text = weather.temprature.currentTemprature;
    self.minTempratureLabel.text = weather.temprature.minTemprature;
    self.maxTempratureLabel.text = weather.temprature.maxTemprature;
    self.currentDescriptionLabel.text = weather.weatherDescription;
    self.weatherIcomImageView.image = weather.weatherIcon;
    
}

@end

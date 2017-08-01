//
//  ViewController.m
//  WeatherMonitor
//
//  Created by pradeep gunasekaran on 7/31/17.
//  Copyright © 2017 pradeep gunasekaran. All rights reserved.
//

#import "ViewController.h"
#import "WeatherBuilder.h"
#import "WeatherCell.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    __weak __typeof(self) weakSelf = self;
    
    // calling Weather Builder
    [WeatherBuilder buildWeatherObjectsWithSuccessBlock:^(NSArray *weatherArray) {
        
        weakSelf.weatherArray = weatherArray;
        [weakSelf.tableView reloadData];
                
    } failureBlock:^(NSError *error) {
        
        NSLog(@"%@", error.localizedDescription);
    }];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.weatherArray.count == 0 ? 1 : self.weatherArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.weatherArray.count == 0) {
        
        return [tableView dequeueReusableCellWithIdentifier:@"LoadingCell"];
    }
    
    WeatherCell *cell = (WeatherCell *)[tableView dequeueReusableCellWithIdentifier:@"WeatherCell"];
    [cell configureWeather:self.weatherArray[indexPath.row]];
    return cell;
    
}

@end

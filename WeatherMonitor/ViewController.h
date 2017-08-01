//
//  ViewController.h
//  WeatherMonitor
//
//  Created by pradeep gunasekaran on 7/31/17.
//  Copyright © 2017 pradeep gunasekaran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource>


@property(strong, nonatomic)NSArray *weatherArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end


//
//  ViewController.h
//  tableView1
//
//  Created by Developer on 6/28/13.
//  Copyright (c) 2013 Developer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSDictionary *courses;
@property (nonatomic,strong) NSArray *coursesKeys;

@property (nonatomic,strong) NSDictionary *courses_web;
@property (nonatomic,strong) NSArray *coursesKeys_web;

@end

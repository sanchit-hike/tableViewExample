//
//  ViewController.m
//  tableView1
//
//  Created by Developer on 6/28/13.
//  Copyright (c) 2013 Developer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize courses,coursesKeys;
@synthesize courses_web,coursesKeys_web;



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *mypath=[[NSBundle mainBundle]pathForResource:@"courses" ofType:@"plist"];
    courses=[[NSDictionary alloc]initWithContentsOfFile:mypath];
    coursesKeys=[courses allKeys];
    
    NSString *path2 =[[NSBundle mainBundle]pathForResource:@"courses_web" ofType:@"plist"];
    courses_web=[[NSDictionary alloc]initWithContentsOfFile:path2];
    coursesKeys_web=[courses_web allKeys];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if(section==0){
        return [courses count];
        NSLog(@"section0: %d",section);
    }
    else{ return [courses_web count];
    NSLog(@"section1: %d",section);
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section==0){
        return @"courses";
    }
    else return @"courses web";
}
    

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    
    if(nil==cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    
    }
    
    NSString *currentCourseName;
    
    if ([indexPath section]==0) {
        
        currentCourseName=[coursesKeys objectAtIndex:[indexPath row]];
    }
    else
        currentCourseName = [coursesKeys_web objectAtIndex:[indexPath row]];
    
    
    [[cell textLabel ] setText:currentCourseName];

    NSString *authorName ;
    if([indexPath section]==0){
        authorName = [courses objectForKey:[coursesKeys objectAtIndex:[indexPath row]]];
        
    }
    else
        authorName = [courses_web objectForKey:[coursesKeys_web objectAtIndex:[indexPath row]]];
    [[cell detailTextLabel] setText:authorName];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cellimage" ofType:@"png"];
    UIImage *image = [[UIImage alloc]initWithContentsOfFile:path];
    [[cell imageView] setImage:image];
    
    cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
    
    
    return cell;

}

@end

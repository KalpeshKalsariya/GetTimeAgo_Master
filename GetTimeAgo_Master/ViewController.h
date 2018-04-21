//
//  ViewController.h
//  GetTimeAgo_Master
//
//  Created by Kalpesh on 21/04/18.
//  Copyright © 2018 Kalpesh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *lblyourtime;

-(NSString *)GetTimeAgo:(NSString *)serverdate;
-(NSDate *)currentDateTime;

@end


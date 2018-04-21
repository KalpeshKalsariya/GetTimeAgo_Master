//
//  ViewController.m
//  GetTimeAgo_Master
//
//  Created by Kalpesh on 21/04/18.
//  Copyright © 2018 Kalpesh. All rights reserved.
//

#import "ViewController.h"
#import "GetTimeAgoView.h"

#define kLongDateFormat     @"yyyy-MM-dd HH:mm:ss"
#define kCurrentSortDateFormat  @"yyyy-MM-dd"
#define kCurrentHourDateFormat  @"23:59:59"

@interface ViewController ()
{
    GetTimeAgoView *timeago;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *timeAgoCount = [self GetTimeAgo:@"2018-04-20 20:07:05"];
    
    _lblyourtime.text = [NSString stringWithFormat:@"%@",timeAgoCount];
    // Do any additional setup after loading the view, typically from a nib.
}
-(NSDate *)currentDateTime{
    
    NSDate* currentDate = [NSDate date];
    NSTimeZone* CurrentTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    NSTimeZone* SystemTimeZone = [NSTimeZone systemTimeZone];
    
    NSInteger currentGMTOffset = [CurrentTimeZone secondsFromGMTForDate:currentDate];
    NSInteger SystemGMTOffset = [SystemTimeZone secondsFromGMTForDate:currentDate];
    NSTimeInterval interval = SystemGMTOffset - currentGMTOffset;
    
    NSDate* TodayDate = [[NSDate alloc] initWithTimeInterval:interval sinceDate:currentDate];
    return TodayDate;
}

-(NSString *)GetTimeAgo:(NSString *)serverdate {
    
    NSDateFormatter* dateFormatter1 = [[NSDateFormatter alloc] init];
    [dateFormatter1 setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]]; // Prevent adjustment to user's local time zone.
    [dateFormatter1 setDateFormat:kLongDateFormat];
    NSString *strcurdate = [dateFormatter1 stringFromDate:[self currentDateTime]];
    strcurdate = [NSString stringWithFormat:@"%@",strcurdate];
    [dateFormatter1 setDateFormat:kLongDateFormat];
    NSDate *currentdatestatic = [dateFormatter1 dateFromString:strcurdate];
    
    NSTimeInterval CurrenttimeInMiliseconds = [currentdatestatic timeIntervalSince1970]*1000;
    NSString *CurrentintervalString = [NSString stringWithFormat:@"%f", CurrenttimeInMiliseconds];
    CurrentintervalString = [CurrentintervalString stringByReplacingOccurrencesOfString:@".000000"
                                                                             withString:@""];
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]]; // Prevent adjustment to user's local time zone.
    [dateFormatter setDateFormat:kLongDateFormat];
    NSDate *dateserver = [dateFormatter dateFromString:serverdate];
    NSTimeInterval ServertimeInMiliseconds = [dateserver timeIntervalSince1970]*1000;
    NSString *ServerintervalString = [NSString stringWithFormat:@"%f", ServertimeInMiliseconds];
    ServerintervalString = [ServerintervalString stringByReplacingOccurrencesOfString:@".000000"
                                                                           withString:@""];
    
    long different = [CurrentintervalString doubleValue] - [ServerintervalString doubleValue];
    long secondsInMilli = 1000;
    long minutesInMilli = secondsInMilli * 60;
    long hoursInMilli = minutesInMilli * 60;
    long daysInMilli = hoursInMilli * 24;
    
    long elapsedDays = different / daysInMilli;
    different = different % daysInMilli;
    
    long elapsedHours = different / hoursInMilli;
    different = different % hoursInMilli;
    
    long elapsedMinutes = different / minutesInMilli;
    different = different % minutesInMilli;
    
    long elapsedSeconds = different / secondsInMilli;
    
    NSString *strtime = @"";
    different = different % secondsInMilli;
    if (elapsedDays == 0) {
        if (elapsedHours == 0) {
            if (elapsedMinutes == 0) {
                if (elapsedSeconds < 0) {
                    return @"0 second ago.";
                } else {
                    if (elapsedDays > 0 && elapsedSeconds < 59) {
                        return @"now";
                    }
                }
            } else {
                strtime = [NSString stringWithFormat:@"%ld minutes ago.",elapsedMinutes];
                return strtime;
            }
        } else {
            strtime = [NSString stringWithFormat:@"%ld hour ago.",elapsedHours];
            return strtime;
        }
        return @"Today";
        
    } else {
        if (elapsedDays <= 29) {
            strtime = [NSString stringWithFormat:@"%ld day ago.",elapsedDays];
            return strtime;
        }
        else if (elapsedDays > 29 && elapsedDays <= 58) {
            strtime = @"1 month ago.";
            return strtime;
        }
        else if (elapsedDays > 58 && elapsedDays <= 87) {
            strtime = @"2 month ago.";
            return strtime;
        }
        else if (elapsedDays > 87 && elapsedDays <= 116) {
            strtime = @"3 month ago.";
            return strtime;
        }
        else if (elapsedDays > 116 && elapsedDays <= 145) {
            strtime = @"4 month ago.";
            return strtime;
        }
        else if (elapsedDays > 145 && elapsedDays <= 174) {
            strtime = @"5 month ago.";
            return strtime;
        }
        else if (elapsedDays > 174 && elapsedDays <= 203) {
            strtime = @"6 month ago.";
            return strtime;
        }
        else if (elapsedDays > 203 && elapsedDays <= 232) {
            strtime = @"7 month ago.";
            return strtime;
        }
        else if (elapsedDays > 232 && elapsedDays <= 261) {
            strtime = @"8 month ago.";
            return strtime;
        }
        else if (elapsedDays > 261 && elapsedDays <= 290) {
            strtime = @"9 month ago.";
            return strtime;
        }
        else if (elapsedDays > 290 && elapsedDays <= 319) {
            strtime = @"10 month ago.";
            return strtime;
        }
        else if (elapsedDays > 319 && elapsedDays <= 348) {
            strtime = @"11 month ago.";
            return strtime;
        }
        else if (elapsedDays > 348 && elapsedDays <= 360) {
            strtime = @"12 month ago.";
            return strtime;
        }
        else if (elapsedDays > 360 && elapsedDays <= 720) {
            strtime = @"1 year ago.";
            return strtime;
        }
        
    }
    return 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

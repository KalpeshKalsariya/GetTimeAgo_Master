//
//  GetTimeAgoView.m
//  GetTimeAgo_Master
//
//  Created by Kalpesh on 21/04/18.
//  Copyright © 2018 Kalpesh. All rights reserved.
//

#import "GetTimeAgoView.h"

#define kLongDateFormat     @"yyyy-MM-dd HH:mm:ss"
#define kCurrentSortDateFormat  @"yyyy-MM-dd"
#define kCurrentHourDateFormat  @"23:59:59"

@implementation GetTimeAgoView

#pragma mark - Get Current Date Time
-(NSDate *)currentDateTime{
    
    NSDate* currentDate = [NSDate date];
    NSTimeZone* CurrentTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"IST"];
    NSTimeZone* SystemTimeZone = [NSTimeZone systemTimeZone];
    
    NSInteger currentGMTOffset = [CurrentTimeZone secondsFromGMTForDate:currentDate];
    NSInteger SystemGMTOffset = [SystemTimeZone secondsFromGMTForDate:currentDate];
    NSTimeInterval interval = SystemGMTOffset - currentGMTOffset;
    
    NSDate* TodayDate = [[NSDate alloc] initWithTimeInterval:interval sinceDate:currentDate];
    return TodayDate;
}
#pragma mark

#pragma mark - Get Time Ago
/*https://stackoverflow.com/a/48441016*/
-(int)GetTimeAgo:(NSString *)serverdate {
    
    NSDateFormatter* dateFormatter1 = [[NSDateFormatter alloc] init];
    [dateFormatter1 setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]]; // Prevent adjustment to user's local time zone.
    [dateFormatter1 setDateFormat:kCurrentSortDateFormat];
    NSString *strcurdate = [dateFormatter1 stringFromDate:[self currentDateTime]];
    strcurdate = [NSString stringWithFormat:@"%@ %@",strcurdate,kCurrentHourDateFormat];
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
    
    double diffnow = [CurrentintervalString doubleValue] - [ServerintervalString doubleValue];
    long different = diffnow;
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
                    return (int)elapsedSeconds;
                } else {
                    if (elapsedDays > 0 && elapsedSeconds < 59) {
                        return (int)@"now";
                    }
                    else {
                        return (int)elapsedDays;
                    }
                }
            } else {
                strtime = [NSString stringWithFormat:@"%ld minutes ago.",elapsedMinutes];
                return (int)strtime;
            }
        } else {
            strtime = [NSString stringWithFormat:@"%ld hour ago.",elapsedHours];
            return (int)strtime;
        }
        
    } else {
        if (elapsedDays <= 29) {
            strtime = [NSString stringWithFormat:@"%ld day ago.",elapsedDays];
            return (int)strtime;
        }
        else if (elapsedDays > 29 && elapsedDays <= 58) {
            strtime = @"1 month ago.";
            return (int)strtime;
        }
        else if (elapsedDays > 58 && elapsedDays <= 87) {
            strtime = @"2 month ago.";
            return (int)strtime;
        }
        else if (elapsedDays > 87 && elapsedDays <= 116) {
            strtime = @"3 month ago.";
            return (int)strtime;
        }
        else if (elapsedDays > 116 && elapsedDays <= 145) {
            strtime = @"4 month ago.";
            return (int)strtime;
        }
        else if (elapsedDays > 145 && elapsedDays <= 174) {
            strtime = @"5 month ago.";
            return (int)strtime;
        }
        else if (elapsedDays > 174 && elapsedDays <= 203) {
            strtime = @"6 month ago.";
            return (int)strtime;
        }
        else if (elapsedDays > 203 && elapsedDays <= 232) {
            strtime = @"7 month ago.";
            return (int)strtime;
        }
        else if (elapsedDays > 232 && elapsedDays <= 261) {
            strtime = @"8 month ago.";
            return (int)strtime;
        }
        else if (elapsedDays > 261 && elapsedDays <= 290) {
            strtime = @"9 month ago.";
            return (int)strtime;
        }
        else if (elapsedDays > 290 && elapsedDays <= 319) {
            strtime = @"10 month ago.";
            return (int)strtime;
        }
        else if (elapsedDays > 319 && elapsedDays <= 348) {
            strtime = @"11 month ago.";
            return (int)strtime;
        }
        else if (elapsedDays > 348 && elapsedDays <= 360) {
            strtime = @"12 month ago.";
            return (int)strtime;
        }
        else if (elapsedDays > 360 && elapsedDays <= 720) {
            strtime = @"1 year ago.";
            return (int)strtime;
        }
        
    }
    return 0;
}

@end

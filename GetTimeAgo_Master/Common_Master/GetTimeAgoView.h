//
//  GetTimeAgoView.h
//  GetTimeAgo_Master
//
//  Created by Kalpesh on 21/04/18.
//  Copyright © 2018 Kalpesh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetTimeAgoView : NSObject

#pragma mark - Get Current Date Time
-(NSDate *)currentDateTime;
#pragma mark
    
#pragma mark - Get Time Ago
-(int)GetTimeAgo:(NSString *)serverdate;
#pragma mark


@end

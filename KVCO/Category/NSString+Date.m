#import "NSString+Date.h"

@implementation NSString (Date)

+ (NSString *)dateWithString: (NSDate *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    return [dateFormatter stringFromDate:date];
}

@end

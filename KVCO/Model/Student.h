#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, Gender) {
    GenderMale,
    GenderFemale,
    GenderOther,
};

@interface Student : NSObject

@property (strong, nonatomic) NSString     *name;
@property (strong, nonatomic) NSString     *surname;
@property (strong, nonatomic) NSDate       *dateOfBirth;
@property (assign, nonatomic) Gender        gender;
@property (assign, nonatomic) NSInteger     grade;
@property (weak, nonatomic)   Student      *friend;

- (instancetype)initWithName:(NSString *)name andSurname:(NSString *)surname andBirthDate:(NSDate *)birthDate NS_DESIGNATED_INITIALIZER;
- (NSString *)fullName;
- (void)resetStudent;

@end

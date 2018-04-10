#import "Student.h"
#import "NSString+Random.h"

@implementation Student

- (instancetype)init {
    NSString *name = [[NSString randomAlphanumericString] capitalizedString];
    NSString *surname = [[NSString randomAlphanumericString] capitalizedString];
    NSDate *birthDate = [NSDate dateWithTimeIntervalSince1970:arc4random() % 900000000];
    self = [self initWithName:name
                   andSurname:surname
                 andBirthDate:birthDate];
    return self;
}

- (instancetype)initWithName:(NSString *)name andSurname:(NSString *)surname andBirthDate:(NSDate *)birthDate {
    self = [super init];
    if (self) {
        self.name = name;
        self.surname = surname;
        self.dateOfBirth = birthDate;
    }
    return self;
}

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.name, self.surname];
}

- (void)resetStudent {
    [self willChangeValueForKey:@"name"];
    [self willChangeValueForKey:@"surname"];
    [self willChangeValueForKey:@"gender"];
    [self willChangeValueForKey:@"grade"];
    
    _name = @"ResetName";
    _surname = @"ResetSurname";
    _gender = GenderMale;
    _grade = 5;
    
    [self didChangeValueForKey:@"name"];
    [self didChangeValueForKey:@"surname"];
    [self didChangeValueForKey:@"gender"];
    [self didChangeValueForKey:@"grade"];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ %@ %lu %ld", self.name, self.surname, (unsigned long)self.gender, (long)self.grade];
}

@end

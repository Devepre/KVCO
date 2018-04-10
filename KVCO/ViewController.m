#import "ViewController.h"
#import "Student.h"

@interface ViewController ()

@property (strong, nonatomic) Student                      *student;
@property (strong, nonatomic) NSMutableArray<Student *>    *groupArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
}

#pragma mark UITextViewDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason {
    NSLog(@"text was changed to %@", textField.text);
    
    NSString *key = nil;
    if ([textField isEqual:self.nameText]) {
        key = @"name";
    } else if ([textField isEqual:self.surnameText]) {
        key = @"surname";
    } else if ([textField isEqual:self.gradeText]) {
        key = @"grade";
    }
    
    [self.student setValue:textField.text forKey:key];
    NSLog(@"Student is: %@", self.student);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Actions
- (IBAction)genderActionControl:(UISegmentedControl *)sender {
    [self.student setValue:[NSNumber numberWithInteger:sender.selectedSegmentIndex]
                    forKey:@"gender"];
}
- (IBAction)resetButton:(UIButton *)sender {
    [self.student resetStudent];
    NSLog(@"Reset");
}

#pragma mark - Additional Methods
- (void)initData {
    self.student = [Student alloc];
    
    [self.student addObserver:self
                   forKeyPath:@"name"
                      options:(NSKeyValueObservingOptionNew)
                      context:nil];
    
    [self.student addObserver:self
                   forKeyPath:@"surname"
                      options:(NSKeyValueObservingOptionNew)
                      context:nil];
    
    [self.student addObserver:self
                   forKeyPath:@"gender"
                      options:(NSKeyValueObservingOptionNew)
                      context:nil];
    
    [self.student addObserver:self
                   forKeyPath:@"grade"
                      options:(NSKeyValueObservingOptionNew)
                      context:nil];
    
    self.student = [self.student init];
    self.student.gender = GenderFemale;
    self.student.grade = 3;

    Student *studentTwo = [[Student alloc] init];
    Student *studentThree = [[Student alloc] init];
    self.groupArray = [NSMutableArray new];
    [self.groupArray addObjectsFromArray:@[self.student, studentTwo, studentThree]];
    self.student.friend = studentTwo;
    studentTwo.friend = studentThree;
    studentThree.friend = self.student;
    
    [studentTwo setValue:@"Lol"
              forKeyPath:@"friend.friend.name"];
    
    NSLog(@"Array:%@\n", self.groupArray);
    
    Student *studentFour = [[Student alloc] init];
    Student *studentFive = [[Student alloc] init];
    [self.groupArray addObjectsFromArray:@[studentFour, studentFive]];
    
    NSArray<NSString *> *namesArray = [self.groupArray valueForKeyPath:@"@unionOfObjects.name"];
    NSLog(@"Names are:\n%@", namesArray);
    
    NSUInteger sum = [[self.groupArray valueForKeyPath:@"@sum.grade"] doubleValue];
    CGFloat average = [[self.groupArray valueForKeyPath:@"@avg.grade"] doubleValue];
    NSLog(@"\nsum = %lu\navg = %f\n", (unsigned long)sum, average);
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context {

    UITextField *textField = nil;
    if ([keyPath isEqual:@"name"]) {
        textField = self.nameText;
    } else if ([keyPath isEqual:@"surname"]) {
        textField = self.surnameText;
    } else if ([keyPath isEqualToString:@"grade"]) {
        textField = self.gradeText;
    } else if ([keyPath isEqualToString:@"gender"]) {
        self.genderControl.selectedSegmentIndex = [[change objectForKey:@"new"] integerValue];
    }
    
    textField.text = [[change objectForKey:@"new"] description];
    
    NSLog(@"%@", self.student);
}

@end

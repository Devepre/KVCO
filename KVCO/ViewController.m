#import "ViewController.h"
#import "Student.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
}

#pragma mark UITextViewDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason {
    NSLog(@"text was changed to %@", textField.text);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Additional Methods
- (void)initData {
    Student *student = [[Student alloc] init];
    student.gender = GenderFemale;
    student.grade = 3;
    
    self.nameText.text = [student valueForKey:@"name"];
    self.surnameText.text = [student valueForKey:@"surname"];
    self.gradeText.text = [[student valueForKey:@"grade"] description];
    self.genderControl.selectedSegmentIndex = [[student valueForKey:@"gender"] integerValue];
}

@end

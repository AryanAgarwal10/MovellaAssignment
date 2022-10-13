import java.util.Scanner;

public class PasswordChecker1
{
    public static void main (String args[])
    {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter the password");
        String password = sc.nextLine();
        int length = password.length();
        int digitCount = 0;
        int specialCharCount = 0;
        int score = 0;
        int resultCount = 0;
        String result = "";

        if (length >= 8) {
            score += 25;
        }
        else {
            result = "Password length should be atleast 8 characters \n";
            resultCount++;
        }

        for (int i = 0; i < length; i++) {
            if (Character.isDigit(password.charAt(i))) {
                digitCount++;
            }
            else if (!(Character.isLetter(password.charAt(i))
                || Character.isWhitespace(password.charAt(i))))
            {
                specialCharCount++;
            }
            if (digitCount >= 2 && specialCharCount >= 2) {
                break;
            }

        }
        if (specialCharCount >= 2) {
            score += 25;
        }
        else {
            result += "Password should contain atleast 2 special characters \n";
            resultCount++;
        }
        if (digitCount >= 2) {
            score += 25;
        }
        else if (resultCount < 2) {
            result += "Password should contain atleast 2 numbers \n";
            resultCount++;
        }
        if (!Character.isDigit(password.charAt(0))) {
            score += 25;
        }
        else if (resultCount < 2) {
            result += "Password should not start with a number \n";
        }
        if (score < 50)
            result = "Password Strength: LOW\n" + result;
        else if (score < 75)
            result = "Password Strength: AVERAGE\n" + result;
        else if (score < 90)
            //since printing is needed only when score is less than 75
            result = "Password Strength: GOOD\n";
        else
            result = "Password Strength: VERY GOOD\n";
        System.out.println(result);
    }
}

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;

public class FileParser2
{
    public static void main (String[] args)
    {
        BufferedReader br =
            new BufferedReader((new InputStreamReader(System.in)));
        String line;
        try {
            System.out.println("Enter the file name");
            String fileName = br.readLine();
            BufferedWriter bwInfo =
                new BufferedWriter(new FileWriter("INFOLog.txt"));
            BufferedWriter bwDebug =
                new BufferedWriter(new FileWriter("DEBUGLog.txt"));
            BufferedWriter bwError =
                new BufferedWriter(new FileWriter("ERRORLog.txt"));
            File file = new File(fileName);
            BufferedReader br1 = new BufferedReader(new FileReader(file));
            while ((line = br1.readLine()) != null) {
                if (line.contains("INFO")) {
                    bwInfo.write(line);
                    bwInfo.newLine();
                }
                else if (line.contains("DEBUG")) {
                    bwDebug.write(line);
                    bwDebug.newLine();
                }
                else if (line.contains("ERROR")) {
                    bwError.write(line);
                    bwError.newLine();
                }
            }
            br1.close();
            bwInfo.close();
            bwDebug.close();
            bwError.close();
        }
        catch (FileNotFoundException e) {
            System.out.println("File not found");
            return;
        }
        catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println("Writing done");
    }
}

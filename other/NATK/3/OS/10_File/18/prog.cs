using System;
using System.IO;

class Test 
{
    public static void Main(string[] args) 
    {
//        string path = @"c:\temp\MyTest.txt";
//        string path = @"MyTest.txt";
        Console.WriteLine("�������� ������ ��������.");
        Console.WriteLine("�������� ������ ����� � ����� ��������.");
        Console.WriteLine("����������� ����� ����� � ������� �������.");
//        Console.WriteLine("�������������� ���������� �������� � ��������� �������� �������������� ����� ������ ��� ������.");
        Console.WriteLine("����������� ���������� �������� � �������������� �����.");
        // If a directory is not specified, exit program.
        if(args.Length != 2)
        {
            // Display the proper way to call the program.
            Console.WriteLine("�����������: prog.exe (��� ��������) (��� �����)");
            return;
        }
	if (Directory.Exists(args[0]))
	{
            Console.WriteLine("�������� ����� ������� {0} ��� ����������", args[0]);
            return;
	}
//	string path = args[0] + '\\' + args[1];
	if (File.Exists(args[1]))
	{
            Console.WriteLine("�������� ���� {0} � ������� �������� ��� ����������", args[1]);
            return;
	}
//	if (Directory.Exists(args[2]))
//	{
//            Console.WriteLine("�������� ������� {0} ��� �������������� ��� ����������", args[2]);
//            return;
//	}
//	if (File.Exists(args[3]))
//	{
//            Console.WriteLine("�������� ���� {0} ��� ����������� ��� ����������", args[3]);
//            return;
//	}
/*
        if (!File.Exists(path)) 
        {
            // Create a file to write to.
            using (StreamWriter sw = File.CreateText(path)) 
            {
                sw.WriteLine("Hello");
                sw.WriteLine("And");
                sw.WriteLine("Welcome");
            }	
        }

        // Open the file to read from.
        using (StreamReader sr = File.OpenText(path)) 
        {
            string s = "";
            while ((s = sr.ReadLine()) != null) 
            {
                Console.WriteLine(s);
            }
        }
*/
        try 
        {
//            string path2 = path + "temp";
            // Ensure that the target does not exist.
///            File.Delete(path2);

	    //������� �������
	    Directory.CreateDirectory(args[0]);
            Console.WriteLine("����� ������� {0} ������� ������.", args[0]);

	    //������� ���� ��� ������
	    string path = args[0] + '\\' + args[1];
            using (StreamWriter sw = File.CreateText(path)) 
            {
                sw.WriteLine("Hello");
                sw.WriteLine("And");
                sw.WriteLine("Welcome");
            }	


            //���������� ����
            File.Copy(path, args[1]);
            Console.WriteLine("���� {0} � ������� ������� ������� ����������.", path);

	    //����������� �����
//	    File.Move(path, args[3]);   
//            Console.WriteLine("������������� ���� {0} ��������� � ������� �������, �� � ������ {1}.", args[1], args[3]);

	    //�������������� ��������
//	    Directory.Move(args[0], args[2]);
//          Console.WriteLine("������� {0} ������������ � ������� {1}.", args[0], args[2]);

	    //���������� ������� ����� ������ ��� ������
//	    File.SetAttributes(args[3], FileAttributes.ReadOnly);
//	    FileAttributes fa = File.GetAttributes(args[3]);
//          Console.WriteLine("������� ����� {0} ���������� ������ ��� ������ {1}.", args[3], fa);
	
	    //������� ���� �� ��������
	    File.Delete(path);
            Console.WriteLine("���� {0} �� ������ �������� {1} ������� �����.", path, args[0]);

	    //������� �������
	    Directory.Delete(args[0]);
            Console.WriteLine("������� {0} ������� �����.", args[0]);

	    //���������� ������� ����� ����������
//	    File.SetAttributes(args[3], FileAttributes.Normal);
//	    fa = File.GetAttributes(args[3]);
//          Console.WriteLine("������� ����� {0} ���������� ���������� {1}.", args[3], fa);
	
	    //������� ����
	    File.Delete(args[1]);
            Console.WriteLine("���� {0} �� �������� �������� ������� �����.", args[1]);
/*
	FileAttributes fa = File.GetAttributes(path2);
        Console.WriteLine("�������� ����� {0}: {1}", path2, fa);
	    File.SetAttributes(path2, FileAttributes.Normal);
	fa = File.GetAttributes(path2);
        Console.WriteLine("�������� ����� {0}: {1}", path2, fa);

            // Delete the newly created file.
            File.Delete(path2);
            Console.WriteLine("{0} was successfully deleted.", path2);
*/
        } 
        catch (Exception e)                 
        {
            Console.WriteLine("The process failed: {0}", e.ToString());
        }
/*
        catch (UnauthorizedAccessException e)                  
        {
            Console.WriteLine("The process failed: {0}", e.ToString());
        }
*/
    }
}
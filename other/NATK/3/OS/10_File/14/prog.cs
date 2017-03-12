// For Directory.GetFiles and Directory.GetDirectories
// For File.Exists, Directory.Exists
using System;
using System.IO;
using System.Collections;

public class RecursiveFileProcessor 
{
    public static void Main(string[] args) 
    {
        Console.WriteLine("����������� ��������� ����� �� ��������� �������� � ������ �������:");
        // If a directory is not specified, exit program.
        if(args.Length != 3)
        {
            // Display the proper way to call the program.
            Console.WriteLine("�����������: prog.exe (��� ��������) (��� �����) (��� ������� ��������)");
            return;
        }
	if (!Directory.Exists(args[0]))
	{
            Console.WriteLine("�������� ������� {0} �� ����������", args[0]);
            return;
	}
	string path = args[0] + '\\' + args[1];
	if (!File.Exists(path))
	{
            Console.WriteLine("�������� ���� {0} � �������� �������� {1} �� ����������", args[1], args[0]);
            return;
	}
	if (!Directory.Exists(args[2]))
	{
            Console.WriteLine("�������� ������� {0} �� ����������", args[2]);
            return;
	}
	string path1 = args[2] + '\\' + args[1];
	if (File.Exists(path1))
	{
            Console.WriteLine("�������� ���� {0} � �������� �������� {1} ��� ����������", args[1], args[2]);
            return;
	}
	File.Copy(path, path1);
        Console.WriteLine("�������� ���� {0} ������� ���������� �� �������� {1} � ������� {2}.", args[1], path, path1);
    }

}
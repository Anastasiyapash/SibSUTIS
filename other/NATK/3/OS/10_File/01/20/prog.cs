using System;
using System.IO;

public class Test
{

    public static void Main()
    {
	Run();

    }

    public static void Run()
    {
        string[] args = new string[3];
	args[0] = "�����";
	args[1] = "�������� ";
	args[2] = "���������� ";
	foreach (string a in args)
		Console.WriteLine(a);

    }
}
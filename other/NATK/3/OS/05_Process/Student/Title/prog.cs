using System;
using System.Diagnostics;

/*
 �' �_�>���_�_�_�%���_ п�_и�_���_�� �_���_�_�_�_�'�_и�_�_���'�_�_ зап�_�_к �_кз���_п�>�_�_а п�_�_�_�_а�_�_�< "console1.exe" и из�_�>���+���_и�� за�_�_�>�_�_ка 
    �_�>а�_�_�_�_�_ �_к�_а п�_�_�+���_�_а.
*/

class MainWindowTitleClass
{
    public static void Main()
    {
        try
        {

            // Create an instance of process component.
            Process myProcess = new Process();
            // Create an instance of 'myProcessStartInfo'.
            ProcessStartInfo myProcessStartInfo = new ProcessStartInfo();
            myProcessStartInfo.FileName = "d:\\labC#\\151\\console1.exe";
            myProcess.StartInfo = myProcessStartInfo;
            // Start process.
            myProcess.Start();
            // Allow the process to finish starting.
            myProcess.WaitForInputIdle();
            Console.Write("Main window Title : " + myProcess.MainWindowTitle);

            myProcess.CloseMainWindow();
            myProcess.Close();
        }
        catch (Exception e)
        {
            Console.Write(" Message : " + e.Message);
        }

    }
}
using System;
using System.Threading;

public class WorkParam
{
    //������� ��ਡ��
    private int cnt;

    //���짮��⥫�᪨� ���������
    public WorkParam(int val)
    {
        this.cnt = val;
    }

    // This method will be called when the thread is started.
    public void DoWork()
    {
        while (!_shouldStop)
        {
            Console.WriteLine("worker thread: working...{0}", cnt++);
        }
        Console.WriteLine("worker thread: terminating gracefully.");
    }
    public void RequestStop()
    {
        _shouldStop = true;
    }
    // Volatile is used as hint to the compiler that this data
    // member will be accessed by multiple threads.
    private volatile bool _shouldStop;
}

public class WorkerThreadExample
{
    static void Main()
    {
        // Create the thread object. This does not start the thread.
        WorkParam workerObject = new WorkParam(100);
        Thread workerThread = new Thread(workerObject.DoWork);

        // Start the worker thread.
        workerThread.Start();
        Console.WriteLine("main thread: Starting worker thread...");

        // Loop until worker thread activates.
        while (!workerThread.IsAlive);

        // Put the main thread to sleep for 1 millisecond to
        // allow the worker thread to do some work:
        Thread.Sleep(1);

        // Request that the worker thread stop itself:
        workerObject.RequestStop();

        // Use the Join method to block the current thread 
        // until the object's thread terminates.
        workerThread.Join();
        Console.WriteLine("main thread: Worker thread has terminated.");
        Console.ReadLine();
    }
}
/*
���� �ਢ����� ��室�� �����:

main thread: starting worker thread...
worker thread: working...100
worker thread: working...101
worker thread: working...102
worker thread: working...103
worker thread: working...104
worker thread: working...105
worker thread: working...106
worker thread: working...107
worker thread: working...108
worker thread: working...109
worker thread: working...110
 ...
worker thread: terminating gracefully...
main thread: worker thread has terminated
*/

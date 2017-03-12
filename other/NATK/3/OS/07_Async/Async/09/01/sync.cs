/*
An alternative to locking manually is to lock declaratively. By deriving
 from ContextBoundObject and applying the Synchronization attribute, you
 instruct the CLR to apply locking automatically. For example:
����ୠ⨢�� �����஢�� ������ ���� ������⨢��� �����஢��.
�ᯮ���� �ந������ ����� �� ContextBoundObject � �ਬ���� ��ਡ��
 Synchronization, �� 㪠�뢠�� CLR ���ᯥ��� �����஢�� ��⮬���᪨.
*/
using System;
using System.Threading;
using System.Runtime.Remoting.Contexts;
 
//[Synchronization]
//public class AutoLock : ContextBoundObject
public class AutoLock //: ContextBoundObject
{
  static private Object o = new Object();
  private int cnt;

  public AutoLock(int count)
  {
	this.cnt = count;
  }

  public void Demo()
  {
   lock(o)
   {
    for (int i=0; i<cnt; i++)
    {
//	Console.Write ("Start...{0} ", i);
	Console.Write("Start..."+ Thread.CurrentThread.ManagedThreadId.ToString()+" - "+ Convert.ToString(i));
	Thread.Sleep (1000);           // We can't be preempted here
//	Console.WriteLine ("end {0}", i);     // thanks to automatic locking!
	Console.WriteLine (" end "+ Thread.CurrentThread.ManagedThreadId.ToString()+" - "+ i);
    }
   }
//�� �� ����� ����� ��墠�뢠���� ��㣨�� ��⮪��� ���������
// ��⮬���᪮� �����஢��!
  } 
}
 
public class Test
{
  public static void Main()
  {
    AutoLock safeInstance = new AutoLock(4);
    new Thread (safeInstance.Demo).Start();     // Call the Demo
    new Thread (safeInstance.Demo).Start();     // method 3 times
    safeInstance.Demo();                        // concurrently.
//�맮� ��⮤� Demo ��ࠫ���쭮 3 ࠧ�.
  }
}

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
  public void Demo()
  {
    Console.Write ("Start...");
    Thread.Sleep (1000);           // We can't be preempted here
    Console.WriteLine ("end");     // thanks to automatic locking!
//�� �� ����� ����� ��墠�뢠���� ��㣨�� ��⮪��� ���������
// ��⮬���᪮� �����஢��!
  } 
}
 
public class Test
{
  public static void Main()
  {
    AutoLock safeInstance = new AutoLock();
//    new Thread (safeInstance.Demo).Start();     // Call the Demo
//    new Thread (safeInstance.Demo).Start();     // method 3 times
    Thread t1 = new Thread(safeInstance.Demo);
    t1.Start();
    Thread t2 = new Thread(safeInstance.Demo);
    t2.Start();
    safeInstance.Demo();                        // concurrently.
//�맮� ��⮤� Demo ��ࠫ���쭮 3 ࠧ�.
  }
}

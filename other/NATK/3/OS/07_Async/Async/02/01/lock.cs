using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;


namespace Threading
{
    class Program
    {
        static int Check(string s)
        {
            for (int i = 0; i <= 2; i++)
            {
                if (s[i] < '0' || s[i] > '9')
                    return -1;
                else
                    i++;
            }
            return 1;
        }

        static void Main(string[] args)
        {
            string s, s1, s2;
            //int i, j;
            string i, j;
            for (; ; )
            {
//                Console.Write("�'�_���_и�'�� к�_�>и�+���_�'�_�_ п�_�_�'�_�_���_ий �_�>�_ п�_�'�_к�_�_(\"x y\")(п�_ �+и�"�_�� �+���_��з п�_�_�+���>): ");
                Console.Write("Enter through space two numerals: ");
                s = Console.ReadLine();
                if (s == "") break;
                if (s.Length > 2)
                {
//                    Console.WriteLine("�'�< �_�_���>и: {0} {1}", s[0], s[2]);
                    if (Check(s) == 1)
                    {
                        s1 = s2 = "";
                        s1 += s[0];
                        s2 += s[2];
                        //i = Convert.ToInt32(s1);
                        //j = Convert.ToInt32(s2);
                        i = s1;
                        j = s2;
                        //                            i = (int)s[0]-48;
                        //                            j = (int)s[2]-48;
                        //                            Console.WriteLine("�'�< �_�_���>и: i={0}, j={1}", i, j);
                    }
                    else
                    {
                        Console.WriteLine("Error values: first-{0}, second-{1}", s[0], s[2]);
                        continue;
                    }
                }
                else
                {
                    Console.WriteLine("First value: {0}", s[0]);
                    continue;
                }
                //            ThreadStart starter = new ThreadStart(Counting);

                Worker w = new Worker();
                //                Thread first = new Thread(new ParameterizedThreadStart(w.Counting));
                //                Thread second = new Thread(new ParameterizedThreadStart(w.Counting));

                //                ParameterizedThreadStart starter = new ParameterizedThreadStart(Counting);
                ParameterizedThreadStart starter = new ParameterizedThreadStart(w.Counting);
                Thread first = new Thread(starter);
                Thread second = new Thread(starter);

                first.Start(i);
                second.Start(j);

                first.Join();
                second.Join();
                //                second.Start(j);
                //                second.Join();
                //                Console.WriteLine("�_аж�_и�'�� �>�_�+�_�_ к�>а�_и�_�_");
                //                Console.Read();
            }
        }
    }
    //    internal class Worker
    public class Worker
    {
        public void Counting(object o)
        {
            //            Monitor.Enter(this);
            //            try
            //lock(this)    My
            //{             My
            Random r = new Random();
            int j, i = 0;
            //int info = (int)o;
            int info = Convert.ToInt32(o);
            //for (int i = 1; i <= info; i++)
            for (i = info; i >0; i--)
                //while (i <= info)
            {                //                    for (; ; )
                //                    {
                //                        j = r.Next(0, 91);
                //                        if (j >= 65 && j <= 90)
                //                            break;
                //                    }
                //j = r.Next(1040, 1072);
                j = r.Next(97, 123);
                Console.WriteLine("Count: {0} - Thread: {1}", i, Thread.CurrentThread.ManagedThreadId);
                //                    Console.WriteLine("С�+�'�'�+ик: {0} - �_�_�'�_к: {1}", i, Thread.CurrentThread.ManagedThreadId);
                Thread.Sleep(100);
                //i++;
            }
            //}             My
            //            finally
            //            {
            //                Monitor.Exit(this);
            //            }
        }
    }
}

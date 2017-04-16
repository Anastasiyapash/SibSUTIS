/*
 �������� �����������

 RichE1  �������� ����
 RichE2  S
 RichE3  w
 RichE4  D(w)
 RichE5  Table

 Di - ������ ���������� ���� �� � ������� � i

*/
//---------------------------------------------------------------------------
#include <vcl.h>
#include <conio.h>
#pragma hdrstop

#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

TForm1 *Form1;
TStringList* str1;

int n=0;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
int min (int n, int m)
{
 if (n < m) return n;
 if (m <= n) return m;
}

int min_cost (int *a, int n)
{
 int min=32768, pos=0;
 for(int i=0; i<n; i++)
 {
  if(min > a[i])
  {
   min=a[i]; pos=i;
  }
 }
 return pos;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::N3Click(TObject *Sender)
{
 Close();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::N2Click(TObject *Sender)
{
 OpenDialog1->Execute();
 Form1->RichEdit1->Lines->LoadFromFile(OpenDialog1->FileName);
 n=Form1->RichEdit1->Lines->Strings[0].ToInt(); //�������� �������� n
 //ShowMessage("="); ShowMessage(Form1->RichEdit1->Lines->Strings[0].ToInt());

 Form1->RichEdit1->Lines->Delete(0);

}
//---------------------------------------------------------------------------
void __fastcall TForm1::N4Click(TObject *Sender)
{
 int k=0, w=0;

 AnsiString S, p, tmp;
 int i,j,t,*v, *d, *s, **c;
 str1=new TStringList();

 RichEdit2->Clear();
 RichEdit3->Clear();
 RichEdit4->Clear();
 RichEdit5->Clear();

 c=new int *[n];
 v=new int [n];
 d=new int [n];

 ShowMessage(n);

 for(i=0; i<n; i++) c[i]=new int [n];

 //str1->Delimiter=' ';
 //str1->QuoteChar=' ';
 // ShowMessage(RichEdit1->Lines->Text);



 str1->CommaText=RichEdit1->Lines->Text;
 ShowMessage(str1->CommaText);

 //////////////////////////////
 //test

 //RichEdit1->SelAttributes->Color=clBlack;

 ///////////////////////////////

  //RichEdit1->SelText


 for(i=0; i<n; i++)
 {
  for(j=0;j<n;j++)
  {
   c[i][j]=str1->Strings[k].ToInt(); k++;
  }
 }

 p="";

 for(i=1; i<n; i++)
 { // d ��� � ��������
  tmp="";
  tmp+="D(";
  tmp+=i;
  tmp+=")";
  p+=tmp;

  for(j=tmp.Length(); j<40; j++) p+=" ";   // ��������� ����������� �������
 }
 Form1->RichEdit5->Lines->Add(p);
 p="";

 for(i=1; i<n; i++)
 {
  v[i]=i;
  d[i]=c[0][i];   // ���� �� ������� ������� � i-�
  //ShowMessage(c[0][i]);

  tmp=""; // ������������ ��� ���������� ����� �������
  tmp=d[i];
  p+=d[i];

  for(j=tmp.Length(); j<=40; j++)
  p+=" ";

 }

 d[0]=9999;  //

 Form1->RichEdit2->Lines->Add(0); // ��������� 0 � ��������� ������ �����

 Form1->RichEdit3->Lines->Add(" ");        // ��������� �������� ������� 0 �� ����������, ������� ��������� �������
 Form1->RichEdit4->Lines->Add(" ");

 Form1->RichEdit5->Lines->Add(p);      // ��������� ������ ������ ������� �������� �� 0 � i

 p="";
 k=n;   // ���������� ����� ��� ���������� �������

 S="0";

 while(k > 1)
 {
  k--;
  w=min_cost(d,n);    // ������� ������� ����������� ������� �� ���������

  S+=" ";
  S+=w;

  Form1->RichEdit2->Lines->Add(S); // ��������� ����������� �� ��������� ����� �� ��������� S
  Form1->RichEdit3->Lines->Add(w); // ��������� 3-� ����� ����������� ����� �����

  for(i=1; i < k; i++)
  {
   tmp="";
   t=d[v[i]];

   d[v[i]]=min(d[v[i]],d[w]+c[w][v[i]]);
   tmp+=d[i];
   tmp+="=min(";
   tmp+=t;
   tmp+=",";
   tmp+=d[w];
   tmp+="+";
   tmp+=c[w][v[i]];
   tmp+=") ";
   p+=tmp;

  for(int j=tmp.Length(); j<30; j++) p+=" ";
 }

 for(i=k; i < n; i++)
 {
  tmp="__________";
  p+=tmp;
  for(int j=tmp.Length(); j<30; j++) p+=" ";
 }

 Form1->RichEdit5->Lines->Add(p);
 Form1->RichEdit4->Lines->Add(d[w]);

 d[w]=9999;          // � ������������ ����� ��� �����������
 p="";

 }

 p="";



}
//---------------------------------------------------------------------------



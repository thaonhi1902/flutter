package c2;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.Scanner;

public class Read {
	static void readfile() throws FileNotFoundException {
		String url = "D:\\ds.txt";
	       FileInputStream fis = new FileInputStream(url);
	       Scanner sc = new Scanner(fis);
	       String line;
	       while (sc.hasNextLine()) {
	           line = sc.nextLine();
	           System.out.println(line);
	}
	       sc.close();
	}
	static void wfile() throws IOException {
		String url = "D:\\ds.txt";
	       FileInputStream fis = new FileInputStream(url);
	       Scanner sc = new Scanner(fis);
	       String line;
	       char kt;
	       String url1 = "D:\\ketqua.txt";
	       FileOutputStream fos = new FileOutputStream(url1);
	       OutputStreamWriter osw = new OutputStreamWriter(fos);
	       while (sc.hasNextLine()) {
	           line = sc.nextLine();
	           int dn=0;
	           for (int i = 0; i < line.length(); i++) {
	        	   kt = line.charAt(i);
	        	   if (kt==' ') 
	                   dn++;
	           }
	           
	           String s1="hopdong";
	           String s2="Chinhthuc";
	        	   if(line.contains(s1) || line.contains(s2)&&dn==3)
	        		   osw.write(line+"\n");
	        	   if(line.contains(s1) || line.contains(s2)&&dn==4)
	        		   osw.write(line+"\n");
	           }
	       osw.close();
	       sc.close();
	}
	public static void main(String[] args) throws IOException {
		readfile();
		wfile();
}
}
package com.wisezone.util;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Random;

import org.apache.commons.lang3.StringUtils;

public class StringUtil extends StringUtils {

	private static char[] charArr = { '0', '1', '2', '3', '4', '5', '6', '7',
			'8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K',
			'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X',
			'Y', 'Z'};

	/**
	 * 生成10个字符
	 * 
	 * @return
	 */
	public static String createToken() {

		Random rd=new Random();
		
		StringBuffer str=new StringBuffer();
		for(int i=1;i<=10;i++){
			int s= rd.nextInt(charArr.length);   //rd.nextInt(36)  0-35
			char d=charArr[s];			
			str.append(d);			
		}
		return str.toString();	
	}
	
	public static Date convertStrToDate(String dateStr) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			return new Date(sdf.parse(dateStr).getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static boolean isNullOrEmpty(String str){
		return  null == str || str.equals("");
	}
}

package hxzy;

import java.util.Iterator;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@ContextConfiguration(locations="classpath:applicationContext.xml")
@RunWith(value=SpringJUnit4ClassRunner.class)
public class Test {

	@org.junit.Test
	public void  testSearch(){
		
	  ClassPathXmlApplicationContext app=new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
	 
	  String[] arr= app.getBeanDefinitionNames();
	  for(String s : arr){
		  System.out.println(s);
	  }
	}
	
	
	
}

package sub3;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener // annotation(주석) 하면 web.xml에 등록 안 해도됨
public class MySessionListener implements HttpSessionAttributeListener {
	
	int count = 0;

	public MySessionListener() {
		System.out.println("MySessionListener()...");
	}
	
	/*
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		System.out.println("sessionCreated()...");
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		System.out.println("sessionDestroyed()...");
	}
	*/
	
	@Override
	public void attributeAdded(HttpSessionBindingEvent event) {
		System.out.println("attributeAdded()...");
		
		count++;
		System.out.println("로그인 사용자 수 : " + count); 
	}
	
	@Override
	public void attributeRemoved(HttpSessionBindingEvent event) {
		System.out.println("attributeRemoved()...");
		
		count--;
		System.out.println("로그인 사용자 수 : " + count);
	}
}

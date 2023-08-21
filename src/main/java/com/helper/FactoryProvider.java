package com.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
	//no meaning of define object of this class
	
	public static SessionFactory factory;
	
	public static SessionFactory getFactory() {
		
		if(factory == null) {
			factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		}
		
		return factory;
	} 
	
	public static void closeFactory() {
		if(factory.isOpen()) {
			factory.close();
		}
	}
}

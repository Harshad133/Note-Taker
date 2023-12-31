package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

public class DeleteNote extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteNote() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int noteId = Integer.parseInt(request.getParameter("note_id").trim());
			
			Session s= FactoryProvider.getFactory().openSession();
			Transaction t = s.beginTransaction();
			Note note = (Note)s.get(Note.class,noteId);
			s.delete(note);
			t.commit();
			s.close();
			response.sendRedirect("all_notes.jsp");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}

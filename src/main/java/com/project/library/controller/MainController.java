package com.project.library.controller;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.project.library.model.Books;
import com.project.library.service.LibraryService;

@Controller
public class MainController {
	
	@Autowired
	private LibraryService service;
	
	@GetMapping("/")
	public String loadHome(HttpServletRequest req) {
		req.setAttribute("mode", "HOME");
		return "index.jsp";
	}
	
	@RequestMapping("allBooks")
	public String init(HttpServletRequest req) {		
		req.setAttribute("books", service.findAllBooks());
		req.setAttribute("mode", "BOOK_SHOW");
		return "index.jsp";
	}	
	
	@GetMapping("update")
	public String update(@RequestParam long id,HttpServletRequest req) {
		req.setAttribute("book", service.findBookById(id).get());		
		req.setAttribute("mode", "BOOK_UPDATE");
		return "index.jsp";
	}
	
	@InitBinder
	protected void initBinder(WebDataBinder  binder) {
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(
	            dateFormat, false));
	}
	
	@PostMapping("save")
	public void save(@ModelAttribute Books book,BindingResult binding,HttpServletRequest req,HttpServletResponse res) throws IOException {
		service.save(book);
		req.setAttribute("books",service.findAllBooks());
		req.setAttribute("mode", "BOOK_SHOW");
				
//		return "index.jsp";
		res.sendRedirect("allBooks");
	}
	
	@GetMapping("new")
	public String newBook(HttpServletRequest req) {		
		req.setAttribute("mode", "BOOK_NEW");		
		return "index.jsp";
	}
	
	@GetMapping("delete")
	public String deleteBook(@RequestParam long id, HttpServletRequest req) {
		service.delete(id);
		req.setAttribute("books", service.findAllBooks());
		req.setAttribute("mode", "BOOK_SHOW");
		return "index.jsp";
	}	
}

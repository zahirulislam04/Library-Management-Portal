package com.project.library.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.library.dao.LibraryRepository;
import com.project.library.model.Books;

@Service
public class LibraryService {
	
	@Autowired
	private LibraryRepository repo;
	
	public Collection<Books> findAllBooks() {
		List<Books> bookList = new ArrayList<Books>();
		
		for(Books books: repo.findAll()) {
			bookList.add(books);
		}
		return bookList;
	}
	
	public void delete(long id) {
		repo.deleteById(id);
	}
	
	public Optional<Books> findBookById(long id) {
		return repo.findById(id);
	}
	
	public void save(Books b) {
		repo.save(b);
	}
	
}

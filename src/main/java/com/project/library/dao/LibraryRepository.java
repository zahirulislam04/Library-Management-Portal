package com.project.library.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.project.library.model.Books;

@Repository
public interface LibraryRepository extends CrudRepository<Books, Long> {

}

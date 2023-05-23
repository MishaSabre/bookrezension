package com.example.bookrezension.repositories;

import com.example.bookrezension.models.Book;
import org.springframework.data.jpa.repository.JpaRepository;


import java.util.List;


public interface BookRepository extends JpaRepository<Book, Long>{
    List<Book> findByTitle(String title);
}

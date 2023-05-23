package com.example.bookrezension.controllers;

import com.example.bookrezension.models.Book;
import com.example.bookrezension.models.User;
import com.example.bookrezension.services.BookService;
import jakarta.persistence.PrePersist;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class BookController{
    private final BookService bookService;

    @GetMapping("/")
    public String books(@RequestParam(name ="searchWord", required = false) String title, Principal principal, Model model){
        model.addAttribute("books", bookService.listBooks(title));
        model.addAttribute("user", bookService.getUserByPrincipal(principal));
        model.addAttribute("searchWord", title);
        return "books";
    }

    @GetMapping("/book/{id}")
    public String productInfo(@PathVariable Long id, Model model, Principal principal) {
        Book book = bookService.getBookById(id);
        model.addAttribute("user", bookService.getUserByPrincipal(principal));
        model.addAttribute("book", book);
        model.addAttribute("images", book.getImages());
        model.addAttribute("authorProduct", book.getUser());
        return "book-info";
    }

    @PostMapping("/book/create")
    public String createBook(@RequestParam("file1") MultipartFile file1, @RequestParam("file2") MultipartFile file2,
                             @RequestParam("file3") MultipartFile file3, Book book, Principal principal) throws IOException {
        bookService.saveBook(principal, book, file1, file2, file3);
        return "redirect:/my/books";
    }

    @PostMapping("/book/delete/{id}")
    public String deleteProduct(@PathVariable Long id, Principal principal) {
        bookService.deleteBook(bookService.getUserByPrincipal(principal), id);
        return "redirect:/my/books";
    }

    @GetMapping("/my/books")
    public String userProducts(Principal principal, Model model) {
        User user = bookService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        model.addAttribute("books", user.getBooks());
        return "my-books";
    }
}

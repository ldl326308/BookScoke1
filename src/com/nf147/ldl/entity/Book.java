package com.nf147.ldl.entity;

public class Book {
    int id;
    String name;
    String author;
    float price;
    String press;

    public Book() {
    }

    public Book(String name, String author, float price,String press) {
        this.name = name;
        this.author = author;
        this.price = price;
        this.press=press;
    }

    public Book(int id, String name, String author, float price,String press) {
        this.id = id;
        this.name = name;
        this.author = author;
        this.price = price;
        this.press=press;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press;
    }

    @Override
    public String toString() {
        return "Book{" +
                "name='" + name + '\'' +
                ", author='" + author + '\'' +
                '}';
    }
}

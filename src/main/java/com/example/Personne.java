package com.example;

public class Personne {
    private String nom;
    private String prenom;
    private int age;
    private Adresse adresse;

    public Personne(String nom, String prenom, int age, Adresse adresse) {
        this.nom = nom;
        this.prenom = prenom;
        this.age = age;
        this.adresse = adresse;
    }

      public String getNom() {
        return nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public int getAge() {
        return age;
    }

    public Adresse getAdresse() {
        return adresse;
    }
}
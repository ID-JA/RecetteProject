﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré à partir d'un modèle.
//
//     Des modifications manuelles apportées à ce fichier peuvent conduire à un comportement inattendu de votre application.
//     Les modifications manuelles apportées à ce fichier sont remplacées si le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

namespace RecetteProject.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class GestionRectteEntities : DbContext
    {
        public GestionRectteEntities()
            : base("name=GestionRectteEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Ingredient> Ingredients { get; set; }
        public virtual DbSet<Ingredients_Recette> Ingredients_Recette { get; set; }
        public virtual DbSet<Recette> Recettes { get; set; }
        public virtual DbSet<Theme> Themes { get; set; }
    }
}
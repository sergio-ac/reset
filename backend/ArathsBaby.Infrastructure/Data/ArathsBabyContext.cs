using System.Linq;
using ArathsBaby.Core.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
namespace ArathsBaby.Infrastructure.Data{
    public class ArathsBabyContext : DbContext    {
        public ArathsBabyContext(DbContextOptions<ArathsBabyContext> 
        options) : base(options){   }
        public DbSet <User> User {get;set;}
        public DbSet <Product> Product {get;set;}
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            foreach (var relationship in modelBuilder.Model.GetEntityTypes().SelectMany
            (e => e.GetForeignKeys()))
            {
                relationship.DeleteBehavior = DeleteBehavior.Restrict;
            }
            foreach (IMutableEntityType entity in modelBuilder.Model.GetEntityTypes())
            {
                entity.SetTableName(entity.DisplayName());
            }
            base.OnModelCreating(modelBuilder);
        }   
    }
}


using System.Collections.Generic;
using Microsoft.AspNetCore.Http;
namespace ArathsBaby.WebAPI.Models
{
    public class CrearProducto
    {
         public string Name {get;set;}
        public string Category {get;set;}
        public int Price {get;set;}
        public string Description {get;set;}        
        public IFormFile File {get;set;}
        public int Quantity {get;set;}
        public string Color {get;set;}
        public int Elected {get;set;}
    }
}


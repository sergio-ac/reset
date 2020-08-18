using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;
namespace ArathsBaby.Core.Models
{
    public class Product
    {        
        public int Id {get;set;}        
        public string Name {get;set;}
        public string Category {get;set;}
        public int Price {get;set;}
        public string Description {get;set;}        
        public string Photo {get;set;}
        public int Quantity {get;set;}
        public string Color {get;set;}        
        public int Elected {get;set;}
    }
}
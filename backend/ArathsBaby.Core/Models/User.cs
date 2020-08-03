using System;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;


namespace ArathsBaby.Core.Models
{
    public class User
    {
        
        public int Id {get;set;}

        public string Name {get;set;}
        
        public string LastName {get;set;}

        public string UserName {get;set;}


        [Required]
        [EmailAddress]
        public string EmailAddress {get;set;}       


        [Required]
       // [Datatype(Datatype.Password)]
        public string Password {get;set;}

        
        public string Phone {get;set;}

        
        
    }
}
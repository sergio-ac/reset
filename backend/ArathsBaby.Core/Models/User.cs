using System;

using System.Linq;
using System.Threading.Tasks;


namespace ArathsBaby.Core.Models
{
    public class User
    {
        public int Id {get;set;}
        public string Name {get;set;}
        
        public string LastName {get;set;}
        
        public string Password {get;set;}

        public char Phone {get;set;}

        public char Direction {get;set;}
    }
}
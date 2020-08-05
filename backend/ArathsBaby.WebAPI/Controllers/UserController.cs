using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using ArathsBaby.Core.Models;
using ArathsBaby.Infrastructure.Data;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;namespace ArathsBaby.WebAPI.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]  
    public class UserController : ControllerBase
    {        
        private readonly ArathsBabyContext _context;
        public UserController (ArathsBabyContext contexto){
            _context = contexto;
        }
        [HttpGet]
        public async Task<ActionResult<IEnumerable<User>>> GetUser(){
            return await _context.User.ToListAsync();
        }
    [HttpGet("{email}/{password}")]
    public async Task <ActionResult<User>> LoginUser
    (string email,string password){
        var userItem = await _context.User.FindAsync(email);
        if(userItem ==null){
            return NotFound();
        }
        return userItem;    }    
    [HttpPost]
    public string Add (User model){
        try{
        var oUser = new User();
        oUser.Id=model.Id;
        oUser.Name=model.Name;
        oUser.LastName=model.LastName;
        oUser.UserName=model.UserName;
        oUser.EmailAddress=model.EmailAddress;
        oUser.Password=model.Password;
        oUser.Phone=model.Phone;  
        _context.User.Add(oUser);
        _context.SaveChanges();
        return "exito";
        }catch(Exception ex){
            return (""+BadRequest(ex));
        }     } } }
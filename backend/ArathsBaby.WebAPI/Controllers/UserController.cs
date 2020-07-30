using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using ArathsBaby.Core.Models;
using ArathsBaby.Infrastructure.Data;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;


namespace ArathsBaby.WebAPI.Controllers
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
    public async Task <ActionResult<User>> LoginUser(string email,string password){
        var userItem = await _context.User.FindAsync(email);
        if(userItem ==null){
            return NotFound();
        }
        return userItem;
    }

    [HttpPost]
    public async Task<ActionResult<User>> PostUserItem(User item){
    _context.User.Add(item);
    await _context.SaveChangesAsync();
    return CreatedAtAction(nameof(GetUser), new {id = item.Id},item);
    }

    [HttpPost]
    public string Add (User model){
        var oUser = new User();
        oUser.Id=model.Id;
        oUser.Name=model.Name;
        oUser.LastName=model.LastName;
        oUser.UserName=model.UserName;
        oUser.EmailAddress=model.EmailAddress;
        oUser.Password=model.Password;
        oUser.Phone=model.Phone;
        oUser.Address=model.Address;
        oUser.Colony=model.Colony;
        oUser.Street=model.Street;
        oUser.OutsideNumber=model.OutsideNumber;
        oUser.InternalNumber=model.InternalNumber;
        oUser.City=model.City;
        oUser.ZipCode=model.ZipCode;
        oUser.State=model.State;
        oUser.Country=model.Country;
        _context.User.Add(oUser);
        _context.SaveChanges();

        return "exito";
    }

    [HttpPost]
    public ActionResult Registrar([FromBody]User user)
    {
        try
        {
            _context.User.Add(user);
            _context.SaveChanges();
            return Ok();

        }
        catch (Exception ex)
            {
            
            return BadRequest(ex);
        }
    }

    }
}
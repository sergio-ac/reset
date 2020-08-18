using System;
using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;
using ArathsBaby.Core.Models;
using ArathsBaby.Infrastructure.Data;
using ArathsBaby.WebAPI.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Hosting;
using System.Web;
namespace ArathsBaby.WebAPI.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]    
    public class ProductController : ControllerBase
    {
    private readonly ArathsBabyContext _context;  
    private readonly IWebHostEnvironment _env;        
    public ProductController (ArathsBabyContext contexto,IWebHostEnvironment env){
        _context = contexto;
        _env = env;
    }
    [HttpGet]
    public async Task<ActionResult<IEnumerable<Product>>> GetProduct(){
        return await _context.Product.ToListAsync();   }
    [HttpGet("{category}")]
    public async Task <ActionResult<Product>> GetProduct(string category){
        var productItem = await _context.Product.FindAsync(category);
        if(productItem ==null){
            return NotFound();    }      return productItem;  }    
    [HttpPost]
    public async Task<ActionResult> probando([FromForm]CrearProducto model){
       if(model.File != null){
           var a = _env.WebRootPath;
           var fileName= Path.GetFileName(model.File.FileName);
           var filePath = Path.Combine(_env.WebRootPath,"Assets\\Images",fileName);
           using (var fileStream = new FileStream(filePath,FileMode.Create))  {
               await model.File.CopyToAsync(fileStream);           }
           Product pr = new Product();
           pr.Name = model.Name;
           pr.Category = model.Category;
           pr.Price = model.Price;
           pr.Description = model.Description;
           pr.Photo = filePath;
           pr.Quantity=model.Quantity;
           pr.Color=model.Color;
           pr.Elected=0;
           _context.Add(pr);
           await _context.SaveChangesAsync();
           return Ok();
            }else {
           return BadRequest();   }  } } }

           
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
        return await _context.Product.ToListAsync();
    }
    
    [HttpGet("{category}")]
    public async Task <ActionResult<Product>> GetProduct(string category){
        var productItem = await _context.Product.FindAsync(category);
        if(productItem ==null){
            return NotFound();
        }
        return productItem;
    }

    [HttpPost]
    public async Task<ActionResult<Product>> PostProductItem(Product item){
    _context.Product.Add(item);
    await _context.SaveChangesAsync();
    return CreatedAtAction(nameof(GetProduct), new {id = item.Id},item);
    }

    [HttpPost]
    public async Task<string> Create ([FromForm]CrearProducto product){
        string guidImagen=null;
        
        try {
        string ficheroImagen= Path.Combine(_env.WebRootPath,"Images");
        guidImagen = Guid.NewGuid().ToString()+product.File.FileName;
        string rutaDefinitiva = Path.Combine(ficheroImagen,guidImagen);
        product.File.CopyTo(new FileStream(rutaDefinitiva,FileMode.Create));

        var nuevoProducto = new Product();
        nuevoProducto.Name = product.Name;
        nuevoProducto.Category = product.Category;
        nuevoProducto.Price = product.Price;
        nuevoProducto.Description = product.Description;
        nuevoProducto.Photo = guidImagen;
        nuevoProducto.Quantity = product.Quantity;
        nuevoProducto.Color = product.Color;

        _context.Product.Add(nuevoProducto);
        await _context.SaveChangesAsync();
        return "Existoso";

        }catch (Exception e) {
            return $"Error: {e.Message}";
        }          

    }

    [HttpPost]
    public async Task<ActionResult> probando([FromForm]CrearProducto model){
       if(model.File != null){
           var a = _env.WebRootPath;
           var fileName= Path.GetFileName(model.File.FileName);
           var filePath = Path.Combine(_env.WebRootPath,"Assets\\Images",fileName);
           using (var fileStream = new FileStream(filePath,FileMode.Create))
           {
               await model.File.CopyToAsync(fileStream);
           }
           Product pr = new Product();
           pr.Name = model.Name;
           pr.Category = model.Category;
           pr.Price = model.Price;
           pr.Description = model.Description;
           pr.Photo = filePath;
           pr.Quantity=model.Quantity;
           pr.Color=model.Color;
           _context.Add(pr);
           await _context.SaveChangesAsync();
           return Ok();


        
       }else {
           return BadRequest();
       }

    }

    [HttpPost]
    public async Task<ActionResult> probandos([FromForm]CrearProducto model){
       if(model.File != null){
           var a = _env.WebRootPath;
           var fileName= Path.GetFileName(model.File.FileName);
           var filePath = Path.Combine(_env.WebRootPath,"Assets\\Images",fileName);
           using (var fileStream = new FileStream(filePath,FileMode.Create))
           {
               await model.File.CopyToAsync(fileStream);
           }
           Product pr = new Product();
           pr.Name = model.Name;
           pr.Category = model.Category;
           pr.Price = model.Price;
           pr.Description = model.Description;
           pr.Photo = filePath;
           pr.Quantity=model.Quantity;
           pr.Color=model.Color;
           _context.Add(pr);
           await _context.SaveChangesAsync();
           return Ok();


        
       }else {
           return BadRequest();
       }

    }

     [HttpPost]
    public string probandose ([FromForm]CrearProducto model){
        var pr = new Product();
        var a = _env.WebRootPath;
           var fileName= Path.GetFileName(model.File.FileName);
           var filePath = Path.Combine(_env.WebRootPath,"Assets\\Images",fileName);
           using (var fileStream = new FileStream(filePath,FileMode.Create))
           {
               model.File.CopyToAsync(fileStream);
           }
        pr.Name=model.Name;
        pr.Category=model.Category;
        pr.Price=model.Price;
        pr.Description=model.Description;
        pr.Photo=filePath;
        pr.Quantity=model.Quantity;
        pr.Color=model.Color;
        _context.Product.Add(pr);
        _context.SaveChanges();

        return "exito";
    }



    }
   
}
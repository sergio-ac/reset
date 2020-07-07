using System.Collections.Generic;
using System.Threading.Tasks;
using ArathsBaby.Core.Models;
using ArathsBaby.Infrastructure.Data;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;



namespace ArathsBaby.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]    
    public class ProductController : ControllerBase
    {
    private readonly ArathsBabyContext _context;    

    public ProductController (ArathsBabyContext contexto){
        _context = contexto;
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

    }
}
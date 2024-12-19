using Microsoft.AspNetCore.Mvc;
using Data.Context;
using Data.Models;
using Data.Repository;

namespace FragrantWorld.Controllers
{
    [ApiController]
    [Route("api/[controller]")] 
    public class ProductsController : ControllerBase
    {
        private readonly IProductService _productService;

        public ProductsController(IProductService productService) 
        {
            _productService = productService;
        }

        // GET: api/products
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Product>>> GetProducts()
        {
            var products = await _productService.GetProductsAsync();
            return Ok(products); 
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Product>> GetProduct(int id)
        {
            var product = await _productService.GetProductAsync(id);
            if (product == null)
            {
                return NotFound(); 
            }
            return Ok(product); 
        }
       
        [HttpPost]
        public async Task<ActionResult<Product>> CreateProduct(Product product)
        {
            var newProduct = await _productService.AddProductAsync(product);
            return CreatedAtAction("GetProduct", new { id = newProduct.ProductArticleNumber}, newProduct);
        }
        
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateProduct(int id, Product product)
        {
            if (id != product.ProductArticleNumber)
            {
                return BadRequest(); 
            }

            await _productService.UpdateProductAsync(product);
            return NoContent(); 
        }
        
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteProduct(int id)
        {
            await _productService.DeleteProductAsync(id);
            return NoContent(); 
        }
    }
}

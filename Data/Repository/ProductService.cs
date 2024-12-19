using Data.Context;
using Data.Models;
using Microsoft.EntityFrameworkCore;

namespace Data.Repository
{
    public class ProductService : IProductService
    {
        private readonly FragrantWorldContext _context =  new();

        public ProductService(FragrantWorldContext context)
            => _context = context;

        public async Task<List<Product>> GetProductsAsync() 
            => await _context.Products.ToListAsync();

        public async Task<Product?> GetProductAsync(int productId)
            => await _context.Products.FindAsync(productId);

        public async Task<Product> AddProductAsync(Product product)
        {
            var entry = await _context.Products.AddAsync(product); 
            await _context.SaveChangesAsync(); 
            return entry.Entity; 
        }


        public async Task UpdateProductAsync(Product product)
        {
            _context.Entry(product).State = EntityState.Modified;
            await _context.SaveChangesAsync();
        }

        public async Task DeleteProductAsync(int productId)
        {
            var product = await _context.Products.FindAsync(productId);
            if (product != null)
            {
                _context.Products.Remove(product);
                await _context.SaveChangesAsync();
            }
        }

        public async Task SaveAsync() => await _context.SaveChangesAsync();
      
        private bool _disposed = false;
        protected virtual void Dispose(bool disposing) 
        {
            if (!_disposed)
            { 
                if (disposing) 
                { 
                    _context.Dispose();
                }
            }
        }
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}

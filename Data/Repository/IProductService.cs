using Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Repository
{
    public interface IProductService : IDisposable
    {
        Task<List<Product>> GetProductsAsync();

        Task<Product?> GetProductAsync(int productId);

        Task<Product> AddProductAsync(Product product);

        Task UpdateProductAsync(Product product);

        Task DeleteProductAsync(int productId);

        Task SaveAsync();
    }
}

using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using Data.Repository;
using Data.Models;
using Data.Context;
using System.Globalization;

namespace FragrantWorldWPF
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {

        private readonly IProductService _productService;
        private List<Product> _allProducts = new List<Product>();
        private List<string> _allManufacturers = new List<string>();
        private List<Product> _filteredProducts = new List<Product>();
        private string _selectedManufacturer = "Все производители";
        private decimal _minPrice;
        private decimal _maxPrice = decimal.MaxValue;
        private bool _isAscending = false;
        private string _searchText = "";

        public MainWindow()
        {
            InitializeComponent();
            LoadProducts();
        }
        public MainWindow(IProductService productService)
        {
            InitializeComponent();
            _productService = productService;
            LoadProducts();
        }
        private async Task LoadProducts()
        {
            if (_productService == null) return;
            var products = await _productService.GetProductsAsync();
            if (products != null)
            {
                _allProducts = products;
                _filteredProducts = products;
                _allManufacturers = _allProducts.Select(p => p.ProductManufacturer).Distinct().ToList();
                _allManufacturers.Insert(0, "Все производители");
                ManufacturerComboBox.ItemsSource = _allManufacturers;
                ManufacturerComboBox.SelectedItem = "Все производители";
                UpdateProductsList();

            }
            else
            {
                MessageBox.Show("Ошибка загрузки данных из Web API");
            }
        }
        private void FilterChanged(object sender, EventArgs e)
        {
            _searchText = SearchTextBox.Text;
            if (ManufacturerComboBox.SelectedItem != null)
            {
                _selectedManufacturer = ManufacturerComboBox.SelectedItem.ToString();
            }

            if (decimal.TryParse(MinPriceTextBox.Text, NumberStyles.Any, CultureInfo.InvariantCulture, out decimal minPrice))
            {
                _minPrice = minPrice;
            }
            else
            {
                _minPrice = 0;
            }

            if (decimal.TryParse(MaxPriceTextBox.Text, NumberStyles.Any, CultureInfo.InvariantCulture, out decimal maxPrice))
            {
                _maxPrice = maxPrice;
            }
            else
            {
                _maxPrice = decimal.MaxValue;
            }

            ApplyFilters();
            UpdateProductsList();
        }

        private void ApplyFilters()
        {
            _filteredProducts = _allProducts;
            if (!string.IsNullOrWhiteSpace(_searchText))
            {
                _filteredProducts = _filteredProducts.Where(p => p.ProductName.Contains(_searchText, StringComparison.OrdinalIgnoreCase)).ToList();
            }

            if (_selectedManufacturer != "Все производители")
            {
                _filteredProducts = _filteredProducts.Where(p => p.ProductManufacturer == _selectedManufacturer).ToList();
            }

            _filteredProducts = _filteredProducts.Where(p => p.ProductCost >= _minPrice && p.ProductCost <= _maxPrice).ToList();
        }

        private void SortOrderChanged(object sender, RoutedEventArgs e)
        {
            if (sender is RadioButton radioButton)
            {
                _isAscending = radioButton.Name == "AscendingRadioButton";
                ApplyFilters();
                UpdateProductsList();
            }

        }

        private void UpdateProductsList()
        {

            var sortedProducts = _filteredProducts;

            if (_isAscending)
            {
                sortedProducts = _filteredProducts.OrderBy(p => p.ProductCost).ToList();
            }
            else
            {
                sortedProducts = _filteredProducts.OrderByDescending(p => p.ProductCost).ToList();
            }
            ProductsListBox.ItemsSource = sortedProducts;
            CountTextBlock.Text = $"{sortedProducts.Count} из {_allProducts.Count}";
        }
    }
}
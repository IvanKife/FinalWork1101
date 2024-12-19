using System;
using System.Collections.Generic;

namespace Data.Models;

public partial class OrderProduct
{
    public int OrderId { get; set; }

    public int ProductArticleNumber { get; set; }

    public int ProductQuantity { get; set; }

    public virtual Order Order { get; set; } = null!;

    public virtual Product ProductArticleNumberNavigation { get; set; } = null!;
}

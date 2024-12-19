using System;
using System.Collections.Generic;

namespace Data.Models;

public partial class PickupPoint
{
    public int PickupPointId { get; set; }

    public int? PostalIndex { get; set; }

    public string? City { get; set; }

    public string? Street { get; set; }

    public int? House { get; set; }

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();
}

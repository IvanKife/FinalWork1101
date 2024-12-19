using System;
using System.Collections.Generic;

namespace Data.Models;

public partial class Order
{
    public int OrderId { get; set; }

    public string OrderStatus { get; set; } = null!;

    public DateTime OrderDate { get; set; }

    public DateTime OrderDeliveryDate { get; set; }

    public int PickupPoint { get; set; }

    public string? ClientFullName { get; set; }

    public int ReceiveCode { get; set; }

    public virtual ICollection<OrderProduct> OrderProducts { get; set; } = new List<OrderProduct>();

    public virtual ICollection<PickupPoint> PickupPoints { get; set; } = new List<PickupPoint>();
}

//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace _1714jschmitt2g
{
    using System;
    using System.Collections.Generic;
    
    public partial class Apartment
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Apartment()
        {
            this.Invoices = new HashSet<Invoice>();
        }
    
        public int Id { get; set; }
        public string ApartmentNum { get; set; }
        public short SquareFeet { get; set; }
        public short Bathrooms { get; set; }
        public double Rent { get; set; }
    
        public virtual Building Building { get; set; }
        public virtual Person Tenant { get; set; }
        public virtual Person Admin { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Invoice> Invoices { get; set; }
    }
}

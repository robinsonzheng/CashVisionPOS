//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CV.POS.Entities
{
    using System;
    using System.Collections.Generic;
    
    public partial class Session
    {
        public Session()
        {
            this.CashboxTestify = new HashSet<CashboxTestify>();
            this.CashMovement = new HashSet<CashMovement>();
            this.Sale = new HashSet<Sale>();
        }
    
        public Nullable<short> UserId { get; set; }
        public int SessionId { get; set; }
        public Nullable<System.DateTime> StartDate { get; set; }
        public Nullable<System.DateTime> EndDate { get; set; }
        public Nullable<byte> PremiseId { get; set; }
    
        public virtual ICollection<CashboxTestify> CashboxTestify { get; set; }
        public virtual ICollection<CashMovement> CashMovement { get; set; }
        public virtual Premise Premise { get; set; }
        public virtual ICollection<Sale> Sale { get; set; }
        public virtual User User { get; set; }
    }
}

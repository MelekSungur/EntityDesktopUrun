//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EntityDesktop
{
    using System;
    using System.Collections.Generic;
    
    public partial class TBLSATIS
    {
        public int SATISID { get; set; }
        public Nullable<decimal> FIYAT { get; set; }
        public Nullable<System.DateTime> TARIH { get; set; }
    
        public virtual TBLMUSTERI TBLMUSTERI { get; set; }
        public virtual TBLURUN TBLURUN { get; set; }
    }
}

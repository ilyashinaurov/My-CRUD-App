//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace КУРСОВАЯ.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class ТС
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ТС()
        {
            this.Заказ = new HashSet<Заказ>();
        }
    
        public int КодТС { get; set; }
        public string Госномер { get; set; }
        public int КодПрицепа { get; set; }
        public int КодМоделиТС { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Заказ> Заказ { get; set; }
        public virtual МодельТС МодельТС { get; set; }
        public virtual Прицеп Прицеп { get; set; }
    }
}

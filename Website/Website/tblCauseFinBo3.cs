//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré à partir d'un modèle.
//
//     Des modifications manuelles apportées à ce fichier peuvent conduire à un comportement inattendu de votre application.
//     Les modifications manuelles apportées à ce fichier sont remplacées si le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Website
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblCauseFinBo3
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblCauseFinBo3()
        {
            this.tblBestOfTrois = new HashSet<tblBestOfTrois>();
        }
    
        public int idCauseFinBo3 { get; set; }
        public string causeFinBo3 { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblBestOfTrois> tblBestOfTrois { get; set; }
    }
}

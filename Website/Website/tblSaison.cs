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
    
    public partial class tblSaison
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblSaison()
        {
            this.tblBestOfTrois = new HashSet<tblBestOfTrois>();
            this.tblTeamParticipeSaison = new HashSet<tblTeamParticipeSaison>();
        }
    
        public int idSaison { get; set; }
        public string NomSaison { get; set; }
        public System.DateTime dateDebutSaison { get; set; }
        public System.DateTime dateFinSaison { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblBestOfTrois> tblBestOfTrois { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblTeamParticipeSaison> tblTeamParticipeSaison { get; set; }
    }
}

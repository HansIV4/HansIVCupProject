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
    
    public partial class tblBestOfTrois
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblBestOfTrois()
        {
            this.tblEquipeParticipeBO3 = new HashSet<tblEquipeParticipeBO3>();
            this.tblJoueurTeamParticipeBO3 = new HashSet<tblJoueurTeamParticipeBO3>();
            this.tblPartie = new HashSet<tblPartie>();
        }
    
        public int idBO3 { get; set; }
        public System.DateTime dateHeureDebutBO3 { get; set; }
        public Nullable<int> idCauseFinBO3 { get; set; }
        public int idSaison { get; set; }
    
        public virtual tblCauseFinBo3 tblCauseFinBo3 { get; set; }
        public virtual tblSaison tblSaison { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblEquipeParticipeBO3> tblEquipeParticipeBO3 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblJoueurTeamParticipeBO3> tblJoueurTeamParticipeBO3 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblPartie> tblPartie { get; set; }
    }
}

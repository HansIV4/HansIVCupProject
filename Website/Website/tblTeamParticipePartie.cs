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
    
    public partial class tblTeamParticipePartie
    {
        public int idParticipationTeamPartie { get; set; }
        public int idPartie { get; set; }
        public int idTeam { get; set; }
        public Nullable<int> nbrePts { get; set; }
    
        public virtual tblPartie tblPartie { get; set; }
        public virtual tblTeam tblTeam { get; set; }
    }
}

USE DBHansIVCupCompet
select nomTeam, tblJoueur.pseudoUplay, tblJoueurTeam.idRoleTeam
from tblTeam
join tblJoueurTeam on 
tblJoueurTeam.idTeam = tblTeam.idTeam
join tblJoueur
on tblJoueur.idJoueur = tblJoueurTeam.idJoueur
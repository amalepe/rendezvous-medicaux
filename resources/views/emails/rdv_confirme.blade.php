<h2>Rendez-vous confirmé</h2>

<p>Bonjour {{ $rdv->patient->user->name }},</p>

<p>
Votre rendez-vous avec le {{ $rdv->medecin->user->name }} a été confirmé.
</p>

<p>
Date : {{ $rdv->creneau->date }} <br>
Heure : {{ $rdv->creneau->heure_debut }}
</p>

<p>Merci.</p>
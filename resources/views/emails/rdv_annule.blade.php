<h2>Rendez-vous annulé</h2>

<p>Bonjour {{ $rdv->patient->user->name }},</p>

@if($source === 'medecin')
<p>Votre rendez-vous avec le Dr {{ $rdv->medecin->user->name }} a été annulé par le médecin.</p>
@else
<p>Votre rendez-vous avec le Dr {{ $rdv->medecin->user->name }} a été annulé.</p>
@endif

<p>
Date : {{ $rdv->creneau->date }}<br>
Heure : {{ $rdv->creneau->heure_debut }} - {{ $rdv->creneau->heure_fin }}
</p>

<p>Merci.</p>
<?php

namespace App\Mail;

use Illuminate\Mail\Mailable;

class RendezVousConfirme extends Mailable
{
    public $rdv;

    public function __construct($rdv)
    {
        $this->rdv = $rdv;
    }

    public function build()
    {
        return $this->subject('Rendez-vous confirmé')
            ->view('emails.rdv_confirme');
    }
}
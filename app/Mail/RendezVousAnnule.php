<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class RendezVousAnnule extends Mailable
{
    use Queueable, SerializesModels;

    public $rdv;
    public $source;
    public function __construct($rdv, $source = 'medecin')
    {
        $this->rdv = $rdv;
        $this->source = $source;
    }

    public function build()
    {
        return $this->subject('Rendez-vous annulé')
            ->view('emails.rdv_annule');
    }
    public function envelope(): Envelope
    {
        return new Envelope(
            subject: 'Rendez Vous Annule',
        );
    }

    /**
     * Get the message content definition.
     */
    public function content(): Content
    {
        return new Content(
            view: 'emails.rdv_annule',
        );
    }

    /**
     * Get the attachments for the message.
     *
     * @return array<int, \Illuminate\Mail\Mailables\Attachment>
     */
    public function attachments(): array
    {
        return [];
    }
}

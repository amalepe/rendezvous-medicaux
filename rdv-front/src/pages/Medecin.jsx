import { useEffect, useState } from "react";
import api from "../api";
import Card from "../style/Card";
import { classes } from "../style/styles";

export default function Medecin() {
  const [rdv, setRdv] = useState([]);
  const [error, setError] = useState("");

  //Charger les RDV 
  const load = () => {
    setError("");
    api
      .get("/medecin/rendezvous")
      .then((res) => {
        const list = Array.isArray(res.data?.data) ? res.data.data : [];
        setRdv(list);
      })
      .catch((e) => {
        console.log("GET /medecin/rendezvous =>", e?.response?.data || e.message);
        setError("Impossible de charger les rendez-vous.");
      });
  };

  useEffect(() => {
    load();
  }, []);

  //Confirmer
  const confirmRdv = (id) => {
    setError("");
    api
      .patch(`/medecin/rendezvous/${id}/confirm`)
      .then(() => load())
      .catch((e) => {
        console.log("PATCH confirm =>", e?.response?.data || e.message);
        setError(e?.response?.data?.message || "Erreur lors de la confirmation.");
      });
  };

  //Annuler
  const cancelRdv = (id) => {
    setError("");
    api
      .patch(`/medecin/rendezvous/${id}/cancel`)
      .then(() => load())
      .catch((e) => {
        console.log("PATCH cancel =>", e?.response?.data || e.message);
        setError(e?.response?.data?.message || "Erreur lors de l'annulation.");
      });
  };

  const fmt = (t) => (t ? String(t).slice(0, 5) : "");

  return (
    <Card title="Mes rendez-vous (médecin)">
      {error && <div className={classes.error}>{error}</div>}

      <div className={classes.stack}>
        {rdv.map((r) => {
          const patientName =
            r.patient?.user?.name || r.patient?.user?.email || r.patient_name || "—";

          const date = r.creneau?.date || r.date || "—";
          const debut = r.creneau?.heure_debut || r.heure_debut || "";
          const fin = r.creneau?.heure_fin || r.heure_fin || "";

          const patientStatut = r.statut; // reserve / annule
          const docStatut = r.doctor_status; // en attente / confirme / annulee

          const showActions = patientStatut === "reserve" && docStatut === "en attente";

          return (
            <div key={r.id} className={classes.card}>
              <div>Patient: {patientName}</div>

              <div>
                Date: {date} {debut && fin ? `(${fmt(debut)} - ${fmt(fin)})` : ""}
              </div>

              <div>
                Statut:{" "}
                {docStatut === "confirme"
                  ? "Confirmé"
                  : docStatut === "annulee"
                  ? "Annulé"
                  : patientStatut}
              </div>

              {showActions && (
                <div style={{ marginTop: 8, display: "flex", gap: 8 }}>
                  <button onClick={() => confirmRdv(r.id)}>Confirmer</button>
                  <button onClick={() => cancelRdv(r.id)}>Annuler</button>
                </div>
              )}
            </div>
          );
        })}
      </div>
    </Card>
  );
}
import { useEffect, useState } from "react";
import api from "../api";
import Card from "../style/Card";
import { classes } from "../style/styles";

export default function MedecinRdv() {
  const [rdvs, setRdvs] = useState([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  const load = async () => {
    setLoading(true);
    setError("");

    try {
      const res = await api.get("/medecin/rendezvous");

      const list = Array.isArray(res.data?.data) ? res.data.data : [];
      setRdvs(list);
    } catch (e) {
      console.log("GET /medecin/rendezvous =>", e?.response?.data || e.message);
      setError(e?.response?.data?.message || "Impossible de charger les rendez-vous.");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    load();
  }, []);

  const fmt = (t) => (t ? String(t).slice(0, 5) : "");

  return (
    <Card title="Mes rendez-vous (Médecin)">
      {error && <div className={classes.error}>{error}</div>}
      {loading && <div style={{ marginTop: 10 }}>Chargement des Données...</div>}

      {!loading && rdvs.length === 0 ? (
        <div style={{ marginTop: 10 }}>Aucun rendez-vous.</div>
      ) : (
        <table style={{ width: "100%", borderCollapse: "collapse", marginTop: 10 }}>
          <thead>
            <tr>
              <th style={{ textAlign: "left", padding: 8, borderBottom: "1px solid #ddd" }}>Patient</th>
              <th style={{ textAlign: "left", padding: 8, borderBottom: "1px solid #ddd" }}>Date</th>
              <th style={{ textAlign: "left", padding: 8, borderBottom: "1px solid #ddd" }}>Début</th>
              <th style={{ textAlign: "left", padding: 8, borderBottom: "1px solid #ddd" }}>Fin</th>
              <th style={{ textAlign: "left", padding: 8, borderBottom: "1px solid #ddd" }}>Statut</th>
            </tr>
          </thead>

          <tbody>
            {rdvs.map((r) => {
              const patientName =
                r.patient?.user?.name || r.patient?.user?.email || r.patient_name || "—";

              const date = r.creneau?.date || r.date || "—";
              const debut = r.creneau?.heure_debut || r.heure_debut || "";
              const fin = r.creneau?.heure_fin || r.heure_fin || "";
              const statut = r.statut || "—";
               
  const confirmParMed = (id) => {
  api.patch(`/medecin/rendezvous/${id}/confirmer`)
    .then(() => load())
    .catch((err) => {
      console.log(err.response?.data || err.message);
    });
};

const annulerParMed = (id) => {
  api.patch(`/medecin/rendezvous/${id}/annuler`)
    .then(() => load())
    .catch((err) => {
      console.log(err.response?.data || err.message);
    });
};

              return (
                <tr key={r.id}>
                  <td style={{ padding: 8, borderBottom: "1px solid #eee" }}>{patientName}</td>
                  <td style={{ padding: 8, borderBottom: "1px solid #eee" }}>{date}</td>
                  <td style={{ padding: 8, borderBottom: "1px solid #eee" }}>{fmt(debut)}</td>
                  <td style={{ padding: 8, borderBottom: "1px solid #eee" }}>{fmt(fin)}</td>
                  <td style={{ padding: 8, borderBottom: "1px solid #eee" }}>
                    {r.statut === "reserve" && r.doctor_status === "en attente" ? (
                      <><button
                      onClick={() => confirmParMed(r.id)}
                      style={{
                        backgroundColor: "#28a745",
                        color: "white",
                        border: "none",
                        padding: "5px 10px",
                        marginRight: "5px",
                        borderRadius: "4px",
                        cursor: "pointer"
                       }}>
                         Confirmer
                         </button>

      <button
        onClick={() => annulerParMed(r.id)}
        style={{
          backgroundColor: "#dc3545",
          color: "white",
          border: "none",
          padding: "5px 10px",
          borderRadius: "4px",
          cursor: "pointer"
        }}>
        Annuler
      </button>
       </>
       ) : (<span>
      {r.doctor_status === "confirmer"
        ? "Confirmé"
        : r.doctor_status === "annulee"
        ? "Annulé"
        : r.statut}
        </span>
      )}
      </td>
      </tr>
              );
            })}
          </tbody>
        </table>
      )}
    </Card>
  );
}
import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import api from "../api";
import Card from "../style/Card";
import { classes } from "../style/styles";

export default function MesRdv() {
  const nav = useNavigate();
  const [list, setList] = useState([]);
  const [error, setError] = useState("");
  const [msg, setMsg] = useState("");

  const getStatusLabel = (r) => {
  if (r.statut === "annule") return { text: "Annulé par vous", type: "cancel" };
  if (r.doctor_status === "annulee") return { text: "Annulé par le médecin", type: "cancel" };
  if (r.doctor_status === "confirme") return { text: "Confirmé", type: "success" };
  return { text: "En attente", type: "en attente" };
};

  const load = async () => {
    setError("");
    setMsg("");

    try {
      const res = await api.get("/rendezvous/mine");

      const data = Array.isArray(res.data)
        ? res.data
        : Array.isArray(res.data?.data)
        ? res.data.data
        : [];

      setList(data);
    } catch (e) {
      console.log("GET /rendezvous/mine =>", e?.response?.data || e.message);
      setError("Impossible de charger vos rendez-vous.");
    }
  };

  useEffect(() => {
    load();
  }, []);

  const annuler = async (rdvId) => {
  console.log("ANNULER ID =>", rdvId);

  try {
    const res = await api.post(`/rendezvous/${rdvId}/annuler`);
    console.log("ANNULATION OK =>", res.data);
    await load(); // recharge la liste
  } catch (e) {
    console.log("ANNULATION ERROR =>", e?.response?.status, e?.response?.data || e.message);
    alert(e?.response?.data?.message || "Erreur annulation");
  }
};

  const fmt = (t) => (t ? String(t).slice(0, 5) : "—");

  return (
    <Card title="Mes rendez-vous">
      <div style={{ marginBottom: 12 }}>
        <button className={classes.btnSecondary} onClick={() => nav("/app")}>
          ← Retour
        </button>
      </div>

      {error && <div className={classes.error}>{error}</div>}
      {msg && <div style={{ marginBottom: 10 }}>{msg}</div>}

      {!error && list.length === 0 ? (
        <div>Aucun rendez-vous.</div>
      ) : (
        <table style={{ width: "100%", borderCollapse: "collapse" }}>
          <thead>
            <tr>
              <th style={{ textAlign: "left", padding: 8, borderBottom: "1px solid #ddd" }}>
                Médecin
              </th>
              <th style={{ textAlign: "left", padding: 8, borderBottom: "1px solid #ddd" }}>
                Date
              </th>
              <th style={{ textAlign: "left", padding: 8, borderBottom: "1px solid #ddd" }}>
                Heure
              </th>
              <th style={{ textAlign: "left", padding: 8, borderBottom: "1px solid #ddd" }}>
                Statut
                </th>
              <th style={{ padding: 8, borderBottom: "1px solid #ddd" }}>
                Action
              </th>
            </tr>
          </thead>

          <tbody>
            {list.map((r) => {
              const doc =
                r.medecin?.user?.name ||
                r.medecin?.user?.nom ||
                r.medecin?.user?.email ||
                r.medecin_name ||
                "—";

              const date = r.date || r.creneau?.date || "—";
              const debut = r.heure_debut || r.creneau?.heure_debut || "";
              const fin = r.heure_fin || r.creneau?.heure_fin || "";
              const status = getStatusLabel(r);

              return (
                <tr key={r.id}>
                  <td style={{ padding: 8, borderBottom: "1px solid #eee" }}>
                    Médecin {doc}
                  </td>
                  <td style={{ padding: 8, borderBottom: "1px solid #eee" }}>
                    {date}
                  </td>
                  <td style={{ padding: 8, borderBottom: "1px solid #eee" }}>
                    {fmt(debut)} - {fmt(fin)}
                  </td>
                  <td style={{ padding: 8, borderBottom: "1px solid #eee" }}>
                     <span className={`badge ${status.type}`}>{status.text}</span>
                     </td>
                  <td style={{ padding: 8, borderBottom: "1px solid #eee", textAlign: "center" }}>
                    <button
                     type="button"className={classes.btnDangerSmall}
                      onClick={(e) => {
                         e.preventDefault();
                         e.stopPropagation();
                         annuler(r.id);
                         }}>Annuler</button>
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
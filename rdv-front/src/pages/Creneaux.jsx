import { useEffect, useState } from "react";
import api from "../api";
import { classes } from "../style/styles";

export default function Creneaux({ medecin }) {
  const [creneaux, setCreneaux] = useState([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");
  const [msg, setMsg] = useState("");
  const [blockedDates, setBlockedDates] = useState(new Set());

  const load = async () => {
    if (!medecin?.id) return;
    setLoading(true);
    setError("");
    setMsg("");

    try {
      const res = await api.get(`/medecins/${medecin.id}/creneaux`);

      const list = Array.isArray(res.data)
        ? res.data
        : Array.isArray(res.data?.data)
        ? res.data.data
        : [];

      setCreneaux(list);
    } catch (e) {
      console.log("GET /medecins/{id}/creneaux =>", e?.response?.data || e.message);
      setError("Impossible de charger les créneaux.");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    load();
  }, [medecin?.id]);

  
  const reserver = async (c) => {
  try {
    const payload = { creneau_id: Number(c.id) };

    console.log("SEND payload =>", payload); // 

    await api.post("/rendezvous/reserver", payload, {
      headers: { "Content-Type": "application/json" },
    });

    setCreneaux((prev) =>
      prev.map((x) => (x.id === c.id ? { ...x, disponible: 0 } : x))
    );

    setMsg("Rendez-vous réservé !");
  } catch (e) {
    console.log("POST /rendezvous/reserver ERR =>", e?.response?.data || e.message);
    setMsg(e?.response?.data?.message || "Réservation impossible.");
  }
};

  const fmt = (t) => (t ? String(t).slice(0, 5) : "");

  return (
    <div style={{ marginTop: 16 }}>
      <div style={{ display: "flex", gap: 10, alignItems: "center" }}>
        <h3 style={{ margin: 0 }}>
          Créneaux du {medecin?.user?.name || medecin?.user?.email || ""}
        </h3>
      </div>

      {error && (
        <div className={classes.error} style={{ marginTop: 10 }}>
          {error}
        </div>
      )}
       {msg && (
  <div
    style={{
      marginTop: 12,
      display: "flex",
      justifyContent: "center",
    }}
  >
    <div
      style={{
        padding: "10px 14px",
        borderRadius: 10,
        textAlign: "center",
        fontWeight: 700,
        maxWidth: 520,
        width: "100%",
        border: "1px solid #ddd",
        background:
          msg.startsWith("Rendez-vous réservé") ? "#eaffea" : "#ffecec",
        color: msg.startsWith("Rendez-vous réservé") ? "#166534" : "#991b1b",
      }} >
      {msg}
      </div>
      </div>
    )}
      {loading && <div style={{ marginTop: 10 }}>Chargement des données...</div>}

      {!loading && creneaux.length === 0 ? (
        <div style={{ marginTop: 10 }}>Aucun créneau.</div>
      ) : (
        <table style={{ width: "100%", borderCollapse: "collapse", marginTop: 10 }}>
          <thead>
            <tr>
              <th style={{ textAlign: "left", padding: 8, borderBottom: "1px solid #ddd" }}>
                Date
              </th>
              <th style={{ textAlign: "left", padding: 8, borderBottom: "1px solid #ddd" }}>
                Début
              </th>
              <th style={{ textAlign: "left", padding: 8, borderBottom: "1px solid #ddd" }}>
                Fin
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
            {creneaux.map((c) => {
              const dispo = Number(c.disponible) === 1;
              const isBlocked = blockedDates.has(c.date);
              const canReserve = dispo && !isBlocked;

              return (
                <tr key={c.id}>
                  <td style={{ padding: 8, borderBottom: "1px solid #eee" }}>{c.date}</td>
                  <td style={{ padding: 8, borderBottom: "1px solid #eee" }}>{fmt(c.heure_debut)}</td>
                  <td style={{ padding: 8, borderBottom: "1px solid #eee" }}>{fmt(c.heure_fin)}</td>
                  <td style={{ padding: 8, borderBottom: "1px solid #eee" }}>
                    <span style={{ fontWeight: 700, color: dispo ? "#22c55e" : "#ef4444" }}>
                      {dispo ? "Disponible" : "Indisponible"}
                    </span>
                  </td>
                  <td style={{ padding: 8, borderBottom: "1px solid #eee", textAlign: "center" }}>
                    {dispo ? (
                      <button className={classes.btnSuccess} onClick={() => reserver(c)}>
                        Réserver
                      </button>
                    ) : (
                      <button className={classes.btnDangerSmall} disabled>
                        —
                      </button>
                    )}
                  </td>
                </tr>
              );
            })}
          </tbody>
        </table>
      )}
    </div>
  );
}
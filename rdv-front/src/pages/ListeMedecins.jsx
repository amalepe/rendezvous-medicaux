import { useEffect, useState } from "react";
import api from "../api";
import Card from "../style/Card";
import { classes } from "../style/styles";
import Creneaux from "./Creneaux";

export default function ListeMedecins() {
  const [medecins, setMedecins] = useState([]);
  const [selected, setSelected] = useState(null);
  const [error, setError] = useState("");

  useEffect(() => {
    (async () => {
      try {
        const res = await api.get("/medecins");

        const list = Array.isArray(res.data)
          ? res.data
          : Array.isArray(res.data?.data)
          ? res.data.data
          : [];

        setMedecins(list);
      } catch (e) {
        console.log("GET /medecins =>", e?.response?.data || e.message);
        setError("Impossible de charger la liste des médecins.");
      }
    })();
  }, []);

  return (
    <Card title="Médecins disponibles">
      {error && <div className={classes.error}>{error}</div>}

      {!error && medecins.length === 0 ? (
        <div>Aucun médecin.</div>
      ) : (
        <div className={classes.grid2}>
          {medecins.map((m) => {
            const doctorName = m.user?.name || m.user?.nom || m.user?.email || "—";
            const tel = m.telephone || "Non disponible";
            const spec = m.specialite || "—";

            return (
              <div key={m.id} className={classes.cardItem}>
                <div>
                  <strong>  {doctorName}</strong>
                </div>
                <div>Spécialité : {spec}</div>
                <div>Téléphone : {tel}</div>

                <div style={{ marginTop: 12 }}>
                  <button
                    className={classes.btnSuccess}
                    onClick={() => setSelected(m)}
                  >
                    Créneaux
                  </button>
                </div>
              </div>
            );
          })}
        </div>
      )}

      {selected && (
        <div style={{ marginTop: 18 }}>
          <Creneaux medecin={selected} />
        </div>
      )}
    </Card>
  );
}
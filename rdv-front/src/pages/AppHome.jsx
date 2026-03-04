import { useNavigate } from "react-router-dom";
import ListeMedecins from "./ListeMedecins";
import Medecin from "./Medecin";
import { classes } from "../style/styles";
import MedecinRdv from "./MedecinRdv";

export default function AppHome() {
  const nav = useNavigate();

  const user = JSON.parse(localStorage.getItem("user") || "null");

  const logout = () => {
    localStorage.removeItem("token");
    localStorage.removeItem("user");
    nav("/");
  };

  // Sécurité si user null
  if (!user) {
    nav("/");
    return null;
  }

  return (
    <div className={classes.container}>
      {/* Header */}
      <div className={classes.row} style={{ marginBottom: 20 }}>
        <h2 style={{ margin: 0 }}>Bienvenue {user.name}</h2>

        <div style={{ display: "flex", gap: 10 }}>
          {user.role === "patient" && (
            <button
              className={classes.btnSecondary}
              onClick={() => nav("/mes-rdv")}
            >
              Mes rendez-vous
            </button>
          )}

          <button className={classes.btnDanger} onClick={logout}>
            Déconnexion
          </button>
        </div>
      </div>

      {/* Contenu selon rôle */}
      {user.role === "patient" ? <ListeMedecins /> : <MedecinRdv />}
    </div>
  );
}
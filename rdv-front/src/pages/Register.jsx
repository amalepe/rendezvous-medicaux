import { useState } from "react";
import { useNavigate } from "react-router-dom";
import api from "../api";
import Card from "../style/Card";
import { classes } from "../style/styles";

export default function Register() {
  const nav = useNavigate();

  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [password2, setPassword2] = useState("");

  const [error, setError] = useState("");
  const [success, setSuccess] = useState("");

  const submit = async (e) => {
    e.preventDefault();
    setError("");
    setSuccess("");

    if (!name || !email || !password) {
      setError("Veuillez remplir tous les champs.");
      return;
    }
    if (password !== password2) {
      setError("Les mots de passe ne correspondent pas.");
      return;
    }

    try {
      // role patient
      await api.post("/auth/register", {
        name,
        email,
        password,
        password_confirmation: password2, 
    });

      setSuccess("Compte créé avec succès. Vous pouvez vous connecter.");
      setTimeout(() => nav("/"), 900);
    } catch (err) {
  console.log("REGISTER ERROR =>", err?.response?.data);

  const errors = err?.response?.data?.errors;

  if (errors) {
    const first = Object.values(errors)?.[0]?.[0];
    setError(first || "Erreur validation");
  } else {
    setError(err?.response?.data?.message || "Erreur création compte");
  }
}
  };

  return (
    <div className={classes.authWrap}>
      <div className={classes.authCard}>
        <Card title="Créer un compte patient">
          {error && <div className={classes.error}>{error}</div>}

          {success && (
            <div className={classes.error} style={{ background: "#e9f7ef", color: "#1e7e34" }}>
              {success}
            </div>
          )}

          <form onSubmit={submit} className={classes.stack}>
            <input
              className={classes.input}
              placeholder="Nom complet"
              value={name}
              onChange={(e) => setName(e.target.value)}
            />

            <input
              className={classes.input}
              placeholder="Email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
            />

            <input
              type="password"
              className={classes.input}
              placeholder="Mot de passe"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
            />

            <input
              type="password"
              className={classes.input}
              placeholder="Confirmer le mot de passe"
              value={password2}
              onChange={(e) => setPassword2(e.target.value)}
            />

            <button className={classes.btnPrimary}>Créer le compte</button>
          </form>

          <div style={{ marginTop: 12 }}>
            <button className={classes.btnSecondary} onClick={() => nav("/")}>
              Retour login
            </button>
          </div>
        </Card>
      </div>
    </div>
  );
}
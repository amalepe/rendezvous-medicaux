import { useState } from "react";
import { useNavigate } from "react-router-dom";
import api from "../api";
import Card from "../style/Card";
import { classes } from "../style/styles";

export default function Login() {
  const nav = useNavigate();
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");

  const submit = async (e) => {
    e.preventDefault();
    setError("");

    try {
      const res = await api.post("/auth/login", { email, password });

      localStorage.setItem("token", res.data.token);
      localStorage.setItem("user", JSON.stringify(res.data.user));

      nav("/app");
    } catch (err) {
      setError(err?.response?.data?.message || "Erreur login");
      console.log(err.response.data)
    }
  };

  return (
    <div className={classes.authWrap}>
      <div className={classes.authCard}>
        <Card title="Connexion">

          {error && <div className={classes.error}>{error}</div>}

          <form onSubmit={submit} className={classes.stack}>
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

            <button className={classes.btnPrimary}>
              Se connecter
            </button>
          </form>

          <div style={{ marginTop: 15 }}>
            <button
              className={classes.btnSecondary}
              onClick={() => nav("/register")}
            >
              Créer un compte patient
            </button>
          </div>

        </Card>
      </div>
    </div>
  );
}
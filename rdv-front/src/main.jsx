import "./App.css";
import React from "react";
import ReactDOM from "react-dom/client";
import { BrowserRouter, Routes, Route, Navigate } from "react-router-dom";

import Login from "./pages/Login";
import Register from "./pages/Register";
import AppHome from "./pages/AppHome";
import MesRdv from "./pages/MesRdv";
import ProtectedRoute from "./components/ProtectedRoute";
import MedecinRdv from "./pages/MedecinRdv";

import { injectStyles } from "./style/styles";
injectStyles();

ReactDOM.createRoot(document.getElementById("root")).render(
  <React.StrictMode>
    <BrowserRouter>
      <Routes>
        {/*  route par défaut */}
        <Route path="/" element={<Navigate to="/login" replace />} />

        <Route path="/login" element={<Login />} />
        <Route path="/register" element={<Register />} />
        <Route path="/medecin/rdv" element={<MedecinRdv />} />

        {/* routes protégées */}
        <Route
          path="/app"
          element={
            <ProtectedRoute>
              <AppHome />
            </ProtectedRoute>
          }
        />

        <Route
          path="/mes-rdv"
          element={
            <ProtectedRoute>
              <MesRdv />
            </ProtectedRoute>
          }
        />

        {/* si route inconnue */}
        <Route path="*" element={<Navigate to="/login" replace />} />
      </Routes>
    </BrowserRouter>
  </React.StrictMode>
);
export const classes = {
  grid2: "rdv-grid2",

  cardItem: "rdv-card-item",

  authWrap: "rdv-authWrap",
  authCard: "rdv-authCard",

  btnGroup: "rdv-btnGroup",
  btnSmall: "rdv-btnSmall",

  row: "rdv-row",
  cardTitle: "rdv-cardTitle",
  stack: "rdv-stack",

  input: "rdv-input",
  btn: "rdv-btn",
  btnPrimary: "rdv-btn rdv-btnPrimary",
  btnSecondary: "rdv-btn rdv-btnSecondary",
  error: "rdv-error",

  btnSuccess: "rdv-btn rdv-btnSuccess",
  btnDangerSmall: "rdv-btn rdv-btnDangerSmall",
};

const css = `
:root{
  --bg:#f5f6f8;
  --card:#ffffff;
  --text:#222;
  --muted:#666;
  --border:#e0e0e0;
  --primary:#2c3e50;
  --danger:#c0392b;
  --r:10px;
}

*{ box-sizing:border-box; }

body{
  margin:0;
  font-family: Arial, Helvetica, sans-serif;
  background: var(--bg);
  color: var(--text);
}

/* Center login */
.rdv-authWrap{
  min-height:100vh;
  display:flex;
  align-items:center;
  justify-content:center;
  padding:20px;
}

.rdv-authCard{
  width:100%;
  max-width:400px;
}

/* Card */
.rdv-card{
  background: var(--card);
  border:1px solid var(--border);
  border-radius: var(--r);
  padding:20px;
}

.rdv-cardTitle{
  margin:0 0 15px;
  font-size:18px;
  font-weight:bold;
}

.rdv-row{
  display:flex;
  justify-content:space-between;
  align-items:center;
  gap:10px;
}

.rdv-stack{
  display:flex;
  flex-direction:column;
  gap:12px;
}

/* Inputs */
.rdv-input{
  width:100%;
  padding:10px;
  border-radius:6px;
  border:1px solid var(--border);
  font-size:14px;
}

.rdv-input:focus{
  outline:none;
  border-color: var(--primary);
}

/* Buttons */
.rdv-btn{
  padding:10px;
  border-radius:6px;
  border:1px solid var(--border);
  cursor:pointer;
  background:#fff;
}

.rdv-btnPrimary{
  background: var(--primary);
  color:white;
  border:none;
}

.rdv-btnSecondary{
  background:#ecf0f1;
  border:none;
}

.rdv-btnDanger{
  background: var(--danger);
  color:white;
  border:none;
}

/* Error */
.rdv-error{
  background:#fdecea;
  color:#c0392b;
  padding:8px;
  border-radius:6px;
  font-size:14px;
  
.rdv-btnGroup{ display:flex; gap:10px; align-items:center; }
.rdv-btnSmall{ width:auto; padding:8px 12px; }
.rdv-grid2{
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 15px;
}

@media (max-width: 768px){
  .rdv-grid2{
    grid-template-columns: 1fr;
  }
}
.rdv-btnSuccess{
  background: #27ae60;
  color: white;
  border: none;
}

.rdv-btnDangerSmall{
  background: #e74c3c;
  color: white;
  border: none;
}

.rdv-btnSuccess:hover{
  background:#219150;
}

.rdv-btnDangerSmall:hover{
  background:#c0392b;
}  
}
`;

export function injectStyles() {
  if (document.getElementById("rdv-styles")) return;
  const tag = document.createElement("style");
  tag.id = "rdv-styles";
  tag.textContent = css;
  document.head.appendChild(tag);
}

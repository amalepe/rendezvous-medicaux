export default function Card({ title, children }) {
  return (
    <div className="rdv-card">
      {title && <h2 className="rdv-title">{title}</h2>}
      <div className="rdv-card-body">{children}</div>
    </div>
  );
}
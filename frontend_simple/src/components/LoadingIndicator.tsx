import { ReactNode } from "react";
import styles from "./LoadingIndicator.module.css";
import logo from "./logo.png";

type LoadingIndicatorProps = {
  children?: ReactNode;
  secondary?: boolean;
  placeholder?: ReactNode;
};

export default function LoadingIndicator({
  children,
  placeholder = <img src={logo} />,
  secondary,
}: LoadingIndicatorProps) {
  const bounceClass = placeholder
    ? `${styles.bounce}`
    : `${styles.bounce} ${styles.fill}`;

  return secondary ? (
    <div className={`${styles.Spinner} ${styles.secondary}`}>
      <div className={`${bounceClass} ${styles.bounce1}`}>{placeholder}</div>
      <div className={`${bounceClass} ${styles.bounce2}`}>{placeholder}</div>
      <div className={`${bounceClass} ${styles.bounce3}`}>{placeholder}</div>
    </div>
  ) : (
    <div className={`${styles.Spinner} font-space`}>
      {children && <h1>{children}</h1>}
      <div className={`${bounceClass} ${styles.bounce1}`}>{placeholder}</div>
      <div className={`${bounceClass} ${styles.bounce2}`}>{placeholder}</div>
      <div className={`${bounceClass} ${styles.bounce3}`}>{placeholder}</div>
    </div>
  );
}

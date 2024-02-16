import { db } from "./config.mjs";

export const handler = async (event) => {
  const detalleAportaciones = {
    "Prima de antigüedad": [25000, 1500],
    "Publicación": [12000, 2100],
    "Saldo anterior empleado no deducible": [35000, 2500],
    "Saldo interior empleado no deducible": [13500, 1500],
    "Contribución definida empresa": [135400, 3500]
  };

  const distribucionCartera = {
    "PRINGUIX1": [113000, 125000],
    "PRINGUX2": [10000, 11300],
    "PRINSZXC": [4000, 10000]
  };

  const query = `
    INSERT INTO dat_query (
      "name",
      description,
      created_at,
      updated_at,
      total_contributions,
      total_yields,
      mandatory_contributions,
      voluntary_contributions,
      efectivo_por_invertir,
      detalle_aportaciones,
      distribucion_cartera,
      id_user
    )
    VALUES (
      'Consulta 335',
      'Descripción de la consulta 3434',
      '2024-02-16T09:30:00Z',
      '2024-02-16T09:30:00Z',
      3132234000,
      22300,
      3513200,
      35500,
      123300,
      :detalleAportaciones,
      :distribucionCartera,
      3
    )
  `;

  const data = await db.query(query, {
    replacements: {
      detalleAportaciones: JSON.stringify(detalleAportaciones),
      distribucionCartera: JSON.stringify(distribucionCartera)
    },
    type: db.QueryTypes.INSERT // Cambiado de UPDATE a INSERT
  });

  console.log('*****Resultado', data);
  // console.table(data);
  return {
    statusCode: 200
  };
};

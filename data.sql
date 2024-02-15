const detalleAportaciones = {
  "Otros": [25000, 2500],
  "Prima de antiguedad": [55000, 3500],
  "Jubilacion": [160000, 4500],
  "Saldo anterior empleado no deducible": [85000, 1500],
  "Saldo anterior empresa no deducible": [55000, 2500],
  "Contribucion definida empresa": [110000, 3500]
};

const distribucionCartera = {
  "PRINFGUX1": [110000, 185000],
  "PRINFGUX7": [90000, 13000],
  "PRINLS2XC": [6000, 10000]
};

const query = `
  UPDATE dat_query
  SET
    name = :name,
    description = :description,
    created_at = :created_at,
    updated_at = :updated_at,
    total_contributions = :total_contributions,
    total_yields = :total_yields,
    mandatory_contributions = :mandatory_contributions,
    voluntary_contributions = :voluntary_contributions,
    period = :period,
    efectivo_por_invertir = :efectivo_por_invertir,
    detalle_aportaciones = :detalle_aportaciones,
    distribucion_cartera = :distribucion_cartera
  WHERE id_user = :id_user
`;

await db.query(query, {
  replacements: {
    name: 'Consulta 2',
    description: 'Descripción de la consulta 2',
    created_at: '2024-02-16T09:30:00Z',
    updated_at: '2024-02-16T09:30:00Z',
    total_contributions: 600000,
    total_yields: 30000,
    mandatory_contributions: 350000,
    voluntary_contributions: 250000,
    period: [1139339.00, 224322.0, 11330.05],
    efectivo_por_invertir: 150000.00,
    detalle_aportaciones: JSON.stringify(detalleAportaciones),
    distribucion_cartera: JSON.stringify(distribucionCartera),
    id_user: 3
  },
  type: db.QueryTypes.UPDATE
});










INSERT INTO dat_query (
    name, 
    description, 
    created_at, 
    updated_at, 
    total_contributions, 
    total_yields, 
    mandatory_contributions, 
    voluntary_contributions, 
    period, 
    efectivo_por_invertir, 
    detalle_aportaciones, 
    distribucion_cartera
) VALUES (
    'Consulta 2', 
    'Descripción de la consulta 2', 
    '2024-02-16T09:30:00Z', 
    '2024-02-16T09:30:00Z', 
    600000, 
    30000, 
    350000, 
    250000, 
    ARRAY[1139339.00, 224322.0, 11330.05]::DECIMAL[], 
    150000.00, 
    '{"Detalle Aportaciones": [{"Otros": [25000, 2500]}, {"Prima de antiguedad": [55000, 3500]}, {"Jubilacion": [160000, 4500]}, {"Saldo anterior empleado no deducible": [85000, 1500]}, {"Saldo anterior empresa no deducible": [55000, 2500]}, {"Contribucion definida empresa": [110000, 3500]}], "categorias": ["Aportaciones", "Rendimientos"]}'::JSONB,
    '{"Distribucion cartera": [{"PRINFGUX1": [110000, 185000]}, {"PRINFGUX7": [90000, 13000]}, {"PRINLS2XC": [6000, 10000]}], "categorias": ["Aportaciones voluntarias", "Aportaciones obligatorias"]}'::JSONB
);

INSERT INTO dat_query (
    name, 
    description, 
    created_at, 
    updated_at, 
    total_contributions, 
    total_yields, 
    mandatory_contributions, 
    voluntary_contributions, 
    period, 
    efectivo_por_invertir, 
    detalle_aportaciones, 
    distribucion_cartera
) VALUES (
    'Consulta 3', 
    'Descripción de la consulta 3', 
    '2024-02-17T10:45:00Z', 
    '2024-02-17T10:45:00Z', 
    700000, 
    35000, 
    400000, 
    300000, 
    ARRAY[1039339.00, 214322.0, 10330.05]::DECIMAL[], 
    200000.00, 
    '{"Detalle Aportaciones": [{"Otros": [30000, 3000]}, {"Prima de antiguedad": [60000, 4000]}, {"Jubilacion": [170000, 5000]}, {"Saldo anterior empleado no deducible": [90000, 2000]}, {"Saldo anterior empresa no deducible": [60000, 3000]}, {"Contribucion definida empresa": [120000, 4000]}], "categorias": ["Aportaciones", "Rendimientos"]}'::JSONB,
    '{"Distribucion cartera": [{"PRINFGUX1": [120000, 190000]}, {"PRINFGUX7": [92000, 14000]}, {"PRINLS2XC": [6500, 10500]}], "categorias": ["Aportaciones voluntarias", "Aportaciones obligatorias"]}'::JSONB
);

INSERT INTO dat_query (
    name, 
    description, 
    created_at, 
    updated_at, 
    total_contributions, 
    total_yields, 
    mandatory_contributions, 
    voluntary_contributions, 
    period, 
    efectivo_por_invertir, 
    detalle_aportaciones, 
    distribucion_cartera
) VALUES (
    'Consulta 4', 
    'Descripción de la consulta 4', 
    '2024-02-18T11:00:00Z', 
    '2024-02-18T11:00:00Z', 
    800000, 
    40000, 
    450000, 
    350000, 
    ARRAY[939339.00, 203222.0, 9230.05]::DECIMAL[], 
    250000.00, 
    '{"Detalle Aportaciones": [{"Otros": [35000, 3500]}, {"Prima de antiguedad": [65000, 4500]}, {"Jubilacion": [180000, 5500]}, {"Saldo anterior empleado no deducible": [95000, 2500]}, {"Saldo anterior empresa no deducible": [65000, 3500]}, {"Contribucion definida empresa": [130000, 4500]}], "categorias": ["Aportaciones", "Rendimientos"]}'::JSONB,
    '{"Distribucion cartera": [{"PRINFGUX1": [130000, 195000]}, {"PRINFGUX7": [94000, 15000]}, {"PRINLS2XC": [7000, 11000]}], "categorias": ["Aportaciones voluntarias", "Aportaciones obligatorias"]}'::JSONB
);









ALTER TABLE dat_queries
ADD COLUMN contribution_details JSONB,
ADD COLUMN distribution_wallet JSONB,
ADD COLUMN total_contributions DECIMAL(15, 2),
ADD COLUMN total_yields DECIMAL(15, 2),
ADD COLUMN mandatory_contributions DECIMAL(15, 2),
ADD COLUMN voluntary_contributions DECIMAL(15, 2),
ADD COLUMN category JSONB;


INSERT INTO dat_query (
    name, 
    description, 
    created_at, 
    updated_at, 
    fk_id_user, 
    fk_id_contract, 
    contribution_details, 
    distribution_wallet, 
    total_contributions, 
    total_yields, 
    mandatory_contributions, 
    voluntary_contributions, 
    category
)
VALUES
(
    'Detalle Aportaciones',
    'Detalle de las aportaciones y rendimientos de la cuenta',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    'id_usuario',
    'id_contrato', 
    '{
        "aportaciones": [
            {"tipo": "Otros", "cantidad": 20000},
            {"tipo": "Prima de antiguedad", "cantidad": 50000},
            {"tipo": "Jubilacion", "cantidad": 150000},
            {"tipo": "Saldo anterior empleado no deducible", "cantidad": 80000},
            {"tipo": "Saldo anterior empresa no deducible", "cantidad": 50000},
            {"tipo": "Contribucion definida empresa", "cantidad": 100000}
        ],
        "rendimientos": [
            {"tipo": "Otros", "cantidad": 2045},
            {"tipo": "Prima de antiguedad", "cantidad": 3000},
            {"tipo": "Jubilacion", "cantidad": 4000},
            {"tipo": "Saldo anterior empleado no deducible", "cantidad": 1000},
            {"tipo": "Saldo anterior empresa no deducible", "cantidad": 2000},
            {"tipo": "Contribucion definida empresa", "cantidad": 3000}
        ]
    }',
    '{
        "aportaciones_voluntarias": [
            {"fondo": "PRINFGUX1", "cantidad": 100000},
            {"fondo": "PRINFGUX7", "cantidad": 87000},
            {"fondo": "PRINLS2XC", "cantidad": 5680}
        ],
        "aportaciones_obligatorias": [
            {"fondo": "PRINFGUX1", "cantidad": 180000},
            {"fondo": "PRINFGUX7", "cantidad": 12000},
            {"fondo": "PRINLS2XC", "cantidad": 9880}
        ]
    }',
    380000,
    12045,
    210000,
    180000,
    '["aportaciones", "rendimientos"]'
);

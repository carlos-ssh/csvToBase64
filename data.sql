await db.query(`
  CREATE TEMPORARY TABLE IF NOT EXISTS detalle_cartera_inversion (
    Cuenta VARCHAR(255),
    Posicion_Inicial DECIMAL(10, 2) NOT NULL,
    Aportaciones DECIMAL(10, 2) NOT NULL,
    Rendimiento DECIMAL(10, 2) NOT NULL,
    Cargos DECIMAL(10, 2) NOT NULL,
    Saldo DECIMAL(10, 2) NOT NULL,
    Derecho_Adquirido DECIMAL(10, 2) NOT NULL,
    Titulos INT NOT NULL,
    Precio DECIMAL(10, 2) NOT NULL
  );

  INSERT INTO detalle_cartera_inversion (Cuenta, Posicion_Inicial, Aportaciones, Rendimiento, Cargos, Saldo, Derecho_Adquirido, Titulos, Precio) VALUES
  ('APORTACION VOLUNTARIA EMPLEADO - EFE 120154925', 195.00, 5349.63, 100.00, 10.00, 195.00, 195.00, 14, 195.00),
  ('APORTACION VOLUNTARIA EMPLEADO - PRINFGUJX1', 500.00, 1000.00, 50.00, 5.00, 500.00, 500.00, 11, 50.00),
  ('APORTACION VOLUNTARIA EMPLEADO - PRINFGUJX7', 5267.00, 1500.00, 113.00, 15.00, 5267.00, 5267.00, 9, 300.00),
  ('APORTACION OBLIGATORIA EMPRESA - EFE 120154925', 3735.00, 4863.00, 200.00, 20.00, 3735.00, 3735.00, 6, 3735.00),
  ('APORTACION OBLIGATORIA EMPRESA - PRINL52XC', 2500.00, 4500.00, 33.00, 3.50, 2781.00, 2781.00, 3, 900.00),
  ('APORTACION OBLIGATORIA EMPRESA - PRINEGUX1', 268.00, 750.00, 0.14, 1.00, 268.00, 268.00, 5, 268.00);

  SELECT * FROM detalle_cartera_inversion;
`);



CREATE TABLE dat_account_summary (
    id_summary SERIAL PRIMARY KEY,
    contributions NUMERIC(15,2),
    yields NUMERIC(15,2),
    total_balance NUMERIC(15,2),
    acquired_right NUMERIC(5,2),
    employee_contribution_amount NUMERIC(15,2),
    employee_contribution_percentage NUMERIC(5,2),
    employer_contribution_amount NUMERIC(15,2),
    employer_contribution_percentage NUMERIC(5,2),
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    id_user INTEGER REFERENCES dat_user(id_user)
);

INSERT INTO dat_account_summary (
    contributions, 
    yields, 
    total_balance, 
    acquired_right, 
    employee_contribution_amount, 
    employee_contribution_percentage, 
    employer_contribution_amount, 
    employer_contribution_percentage, 
    id_user
) VALUES 
(5000.00, 200.00, 5200.00, 5.00, 2500.00, 50.00, 2500.00, 50.00, 1),
(7500.00, 300.00, 7800.00, 10.00, 3750.00, 50.00, 3750.00, 50.00, 2),
(10000.00, 500.00, 10500.00, 20.00, 5000.00, 50.00, 5000.00, 50.00, 3);

-- Añade tantos registros como necesites



INSERT INTO tabla_fondos
(id, codigo_fondo, monto_invertido, ganancia_1, ganancia_2, balance, edad_inversor, rendimiento, description)
VALUES
(21, 'PRINFGUX1', 5283742.58, 0.00, 0.00, 52549.57, 27, 27.869477, 'Fondo enfocado en maximizar el crecimiento a largo plazo para jubilación entre 2046 y 2055.'),
(23, 'PRINFGUX7', 507482.93, 0.00, 0.00, -1711.67, 29, 29.840876, 'Inversión estratégica en tecnología y energías renovables para rendimientos sostenibles.'),
(30, 'PRINLS2XC', 2833900.65, 0.00, 0.00, -37169.37, 23, 23.331158, 'Cartera diversificada en mercados emergentes y desarrollados, enfocada en 2046-2055.'),
(32, 'PRINFGUX2', 1548700.00, 0.00, 0.00, 2450.00, 31, 31.457812, 'Fondo de inversión en bienes raíces comerciales para inversores a largo plazo.'),
(34, 'PRINFGUX8', 600482.75, 0.00, 0.00, -1250.34, 28, 28.942761, 'Inversión en bonos corporativos y gubernamentales con alto rendimiento.'),
(36, 'PRINLS3XC', 3900876.42, 0.00, 0.00, -48760.12, 22, 22.876543, 'Fondo que combina crecimiento y renta fija para un retiro seguro entre 2046 y 2055.'),
(37, 'PRINFGUX3', 2759471.89, 0.00, 0.00, 15789.47, 26, 26.478924, 'Estrategia agresiva en acciones globales para inversores que buscan crecimiento.'),
(39, 'PRINFGUX9', 812394.67, 0.00, 0.00, -2314.55, 30, 30.123456, 'Fondo de alto riesgo y alto rendimiento, ideal para perfiles arriesgados.'),
(40, 'PRINLS4XC', 4871230.12, 0.00, 0.00, -58761.33, 24, 24.987654, 'Portafolio de inversiones en infraestructura global con enfoque en energía verde.'),
(41, 'PRINFGUX4', 3256789.45, 0.00, 0.00, 16890.22, 25, 25.765432, 'Fondo mixto que incluye acciones, bonos y commodities para diversificación.'),
(42, 'PRINFGUX10', 924567.34, 0.00, 0.00, -3456.78, 32, 32.543210, 'Inversión dirigida a sectores de rápido crecimiento como tecnología y salud.'),
(43, 'PRINLS5XC', 5342768.89, 0.00, 0.00, -69782.44, 21, 21.098765, 'Fondo conservador, ideal para perfiles con aversión al riesgo, enfocado en bonos.'),
(44, 'PRINFGUX5', 3758921.56, 0.00, 0.00, 18901.33, 27, 27.654321, 'Estrategia de inversión en mercados internacionales para diversificar riesgos.'),
(45, 'PRINFGUX11', 1034890.12, 0.00, 0.00, -4598.99, 29, 29.321098, 'Fondo de renta variable con énfasis en empresas con alto potencial de crecimiento.'),
(46, 'PRINLS6XC', 5890345.67, 0.00, 0.00, -80893.22, 20, 20.876543, 'Inversión en activos de renta fija con enfoque en la estabilidad y rentas periódicas.'),
(47, 'PRINFGUX6', 4283764.23, 0.00, 0.00, 20912.88, 26, 26.987654, 'Fondo especializado en sectores como el financiero y tecnológico para maximizar rendimientos.'),
(48, 'PRINFGUX12', 1126789.56, 0.00, 0.00, -5740.67, 31, 31.210987, 'Fondo que apuesta por la innovación en startups y empresas de nueva creación.'),
(49, 'PRINLS7XC', 6438901.78, 0.00, 0.00, -91904.11, 19, 19.765432, 'Opción de inversión segura en oro y otros metales preciosos para proteger activos.'),
(50, 'PRINFGUX13', 4805692.34, 0.00, 0.00, 22924.45, 28, 28.123456, 'Cartera equilibrada con enfoque en sostenibilidad y responsabilidad social corporativa.'),
(51, 'PRINFGUX14', 1220890.78, 0.00, 0.00, -6882.56, 33, 33.098765, 'Fondo dirigido a inversiones en educación y desarrollo humano, con impacto social positivo.');
`);


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

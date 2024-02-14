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

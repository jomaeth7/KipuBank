🏦 KipuBank – Contrato inteligente de bóveda personal con límites

KipuBank es un contrato inteligente en Solidity que permite a los usuarios depositar y retirar ETH dentro de una bóveda personal, respetando límites definidos por transacción y un tope global de depósitos. Este contrato sigue buenas prácticas de seguridad, documentación NatSpec y está diseñado para producción.

🚀 Despliegue

Red: Sepolia Testnet

Dirección del contrato: 0xeb0fe23e76f829b590baE0b92069D726c8EF87fC

🔗 [Ver en Etherscan](https://sepolia.etherscan.io/address/0xeb0fe23e76f829b590baE0b92069D726c8EF87fC)

Código verificado: ✅

Hash de la transacción: 0x64b8a4be6d4abc0e5ccbdf424c42e1ab8c32aa87e0bd3b6358eaf69f784007a2

Gas pagado: 0.000000558262490301 ETH

🔐 Verificación de autoría

Este contrato fue desplegado desde mi wallet personal de Metamask: 0xB8ca00E6a515Aa237F8885f8FFB29A5A70Ddca9e


⚙️ Constructor

constructor(uint256 _withdrawLimit, uint256 _bankCap)

_withdrawLimit: Límite máximo de retiro por transacción (ej. 0.01 ETH)

_bankCap: Tope global de depósitos permitidos en el contrato (ej. 0.1 ETH)

🔐 Funcionalidad

Los usuarios pueden depositar ETH en su bóveda personal.

Pueden retirar ETH, pero solo hasta el límite por transacción.

El contrato impide depósitos que excedan el tope global (bankCap).

Se emiten eventos en cada depósito y retiro exitoso.

Se lleva registro del número total de depósitos y retiros.

🧪 Funciones principales

deposit(), de tipo external payable, permite el deposita ETH en la bóveda del usuario

withdraw(uint256 amount), de tipo external.	Retira una cantidad específica, respetando el límite

getVaultBalance(), de tipo external view. Devuelve el saldo actual del usuario

_withdraw(uint256 amount), de tipo private.	Permite la Lógica interna de retiro con validaciones

_safeTransfer(address to, uint256 amount), de tipo private, permite la transferencia segura de ETH


📢 Eventos

Deposited(address indexed user, uint256 amount)

Withdrawn(address indexed user, uint256 amount)

❌ Errores personalizados

DepositLimitExceeded()

WithdrawLimitExceeded()

InsufficientBalance()

🛡️ Seguridad y buenas prácticas

Uso de errores personalizados en lugar de require con strings

Patrón checks-effects-interactions

Modificador withinCap para validar depósitos

Transferencias nativas seguras con call

Variables bien comentadas con NatSpec

Convenciones de nombres claras y consistentes


🧰 Herramientas utilizadas

Foundry: framework de pruebas y despliegue

forge: compilación y testeo

anvil: nodo local

cast: interacción con contratos

Archivo .env para claves privadas y RPC

Script de despliegue: script/Deploy.s.sol

📚 Documentación oficial: Foundry Book

Notas adicionales sobre el despligue: La compilacion se realizo con mi clave privada de Metamask. 
URL de despliegue. RPC_URL=https://sepolia.infura.io/v3/tu_api_key
Esto se realizo en un archivo .env con la siguiente nformacion: PRIVATE_KEY=claveprivada_metamask

🧠 Autor
Jose Maria Meijide Rodriguez

Proyecto académico para portafolio Web3

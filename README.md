# KipuBank – Contrato inteligente

KipuBank es un contrato inteligente diseñado para facilitar micropréstamos entre usuarios en la blockchain. Permite depósitos, retiros y gestión de fondos con parámetros configurables.

## 🚀 Despliegue

Contrato desplegado en la red Sepolia  
📦 Dirección del contrato: `0xeb0fe23e76f829b590baE0b92069D726c8EF87fC`  

🔗 [Ver en Etherscan](https://sepolia.etherscan.io/address/0xeb0fe23e76f829b590baE0b92069D726c8EF87fC)

## ⚙️ Constructor

```bash
"10000000000000000"  # minLoanAmount: 0.01 ETH
"100000000000000000" # maxLoanAmount: 0.1 ETH


🔍 Verificación
Contrato verificado en Sepolia

⛽ Gas pagado: 0.000000558262490301 ETH

📄 Hash de la transacción: 0x64b8a4be6d4abc0e5ccbdf424c42e1ab8c32aa87e0bd3b6358eaf69f784007a2

🧪 Funciones principales

*deposit(): permite al usuario depositar fondos

*withdraw(amount): retira una cantidad específica

*requestLoan(amount): solicita un préstamo

*repayLoan(): devuelve el préstamo

🧪 Herramientas utilizadas
Proyecto desarrollado con Foundry, un toolkit rápido y modular para Ethereum:

forge: framework de pruebas y despliegue

anvil: nodo local para simulaciones

cast: interacción con contratos

📚 Documentación oficial: Foundry Book

Este contrato fue desarrollado y desplegado utilizando Foundry. Se desplego en la red Sepolia, y siguio estos pasos:

1. Compilacion del contrato

2.Configuracion de variables sensibles
 se configuro con mi clave privada de Metamask. PRIVATE_KEY=mi_claveprivada_metamask
URL de despliegue. RPC_URL=https://sepolia.infura.io/v3/tu_api_key

3.Ejecucion  del script de despliegue
bash
forge script script/Deploy.s.sol:DeployScript --rpc-url $RPC_URL --private-key $PRIV

El script Deploy.s.sol se encuentra en la carpeta script
🔹 El contrato se verificara en Etherscan con la configuracion de una API key (esta en desarrollo)

🧪 Cómo interactuar con el contrato
Una vez desplegado, puedes interactuar con el contrato desde Foundry (cast) o desde una interfaz web. Sus funciones principales:

🔹 deposit()
Permite al usuario depositar fondos en el contrato.

🔹 withdraw(uint256 amount)
Retira una cantidad específica de fondos.

🔹 requestLoan(uint256 amount)
Solicita un préstamo dentro de los límites definidos.

🔹 repayLoan()
Devuelve el préstamo recibido.

🧠 Autor
Jose Maria Meijide Rodriguez – Proyecto personal con fines academicos

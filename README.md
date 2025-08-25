# ChainSusu 💰⛓️  

A **Decentralized Savings and Contribution System (Susu/Esusu/Ajo)** built on the blockchain using Solidity. ChainSusu allows groups of people to pool funds together, contribute periodically, and withdraw in turns — all governed by **smart contracts** to ensure **trust, transparency, and security** without the need for middlemen.  

---

## 📖 Table of Contents  
- [About](#-about)  
- [Features](#-features)  
- [Tech Stack](#-tech-stack)  
- [Smart Contract Functions](#-smart-contract-functions)  
- [Project Setup](#-project-setup)  
- [Deployment](#-deployment)  
- [Usage](#-usage)  
- [Future Improvements](#-future-improvements)  
- [Contributing](#-contributing)  
- [License](#-license)  
- [Author](#-author)  

---

## 🔎 About  
In many African and global communities, **Susu/Esusu/Ajo** is a traditional financial system where people contribute money periodically, and members take turns receiving the lump sum.  

👉 **Problem**: These systems rely on trust and often face risks like fraud or mismanagement.  
👉 **Solution**: **ChainSusu** brings this system to the blockchain, ensuring contributions and payouts are **automated, immutable, and transparent**.  

---

## ✨ Features  
- 🏦 Create and join a **Susu group** on-chain  
- 💸 Automated contributions via smart contracts  
- 🔐 Immutable rules, preventing fraud or manipulation  
- ⏳ Payouts handled in turns automatically  
- 🌍 Transparent & decentralized — no middleman  

---

## 🛠️ Tech Stack  
- **Solidity** (Smart Contract Development)  
- **Remix IDE** (Testing & Deployment)  
- **MetaMask** (Wallet Integration)  
- **BNB Smart Chain (Testnet)** (Deployment)  

---

## 📜 Smart Contract Functions  
Some of the core functions in the ChainSusu contract include:  

- `createGroup()` → Create a new contribution group.  
- `joinGroup()` → Join an existing group with required contribution.  
- `contribute()` → Make periodic payments.  
- `payout()` → Release contributions to the eligible member.  
- `getGroupDetails()` → Fetch details about contributions, members, and payouts.  

---

## ⚙️ Project Setup  

### 1. Prerequisites  
- Install [MetaMask](https://metamask.io/)  
- Open [Remix IDE](https://remix.ethereum.org/)  
- Get testnet BNB for gas fees → [BNB Testnet Faucet](https://testnet.bnbchain.org/faucet-smart)  

### 2. Clone Repo  
```bash
git clone https://github.com/your-username/ChainSusu.git
cd ChainSusu


3. Compile Smart Contract

Open ChainSusu.sol in Remix IDE

Compile with Solidity ^0.8.0

4. Deploy

Select Injected Provider (MetaMask) in Remix

Deploy to BNB Smart Chain Testnet

🚀 Usage

Create a group with your contribution amount and cycle.

Share the group ID with friends to join.

Each member contributes periodically via the smart contract.

Smart contract automatically pays out in turns.

Transparent records of all contributions available on-chain.

🔮 Future Improvements

✅ UI dashboard (React + Web3.js) for easy interactions

✅ Support for stablecoins (USDT, USDC, BUSD)

✅ Mobile-friendly dApp

✅ Governance system for group rules

🤝 Contributing

Contributions, issues, and feature requests are welcome!
Feel free to fork the repo and submit a PR.

📄 License

This project is licensed under the MIT License – see the LICENSE
 file for details.

👩‍💻 Author

Faith Archibong ✨

💼 LinkedIn

🐦 Twitter

🌍 Portfolio/Website
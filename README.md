# RHEL-Systems-Services  
*An Opinionated Ansible Automation Framework for RHEL Environments*

---

## Table of Contents  
1. [Project Overview](#project-overview)  
2. [Why Use This Framework](#why-use-this-framework)  
3. [Features & Scope](#features-and-scope)  
4. [Repository Structure](#repository-structure)  
5. [Getting Started](#getting-started)  
   1. [Prerequisites](#prerequisites)  
   2. [Installation](#installation)  
   3. [Quick Start Usage](#quick-start-usage)  
6. [Playbooks & Use Cases](#playbooks-and-use-cases)  
7. [Customisation & Extending the Framework](#customisation-and-extending-the-framework)  
8. [Best Practices and Operational Tips](#best-practices-and-operational-tips)  
9. [CI / QA / Testing](#ci-qa-testing)  
10. [Security Considerations](#security-considerations)  
11. [Contributing](#contributing)  
12. [License](#license)  
13. [Support & Contact](#support-and-contact)  

---

## Project Overview  
This framework is designed to simplify and standardise the management of core services and system configuration on Red Hat Enterprise Linux (RHEL) and RHEL-compatible systems (CentOS Stream, Rocky, Alma, etc.).  
It provides a modular, role-based Ansible architecture for typical infrastructure tasks: package installation, service configuration, OS hardening, logging, monitoring, and more.

Whether you’re managing a handful of servers or large fleets, this project aims to:  
- Enforce consistent baseline configuration  
- Automate repetitive tasks with idempotent playbooks  
- Provide a clear structure for roles, templates, and variables  
- Allow easy extension to new services  
- Be safe to re-run (day-2 operations friendly)  

---

## Why Use This Framework  
With infrastructure becoming increasingly complex, manual configurations across many hosts rapidly become error-prone, inconsistent and difficult to audit.  
This framework addresses these challenges by:  
- Providing a “single source of truth” repository for your service definitions & system settings  
- Supporting declarative configuration via Ansible — when the playbook runs again, it brings hosts into the defined state  
- Making it easier for teams to onboard, review and maintain infrastructure code  
- Reducing drift and configuration sprawl through reusable roles and templates  
- Enabling audit, version control, and peer review of infrastructure changes  

---

## Features & Scope  
### **Included by default**  
- Role library for core infrastructure services (e.g., SSH, firewall, SELinux, sysctl)  
- Playbooks for managing packages, services, templates, logs, archives  
- Variables defined in `vars/` for easy customization  
- Jinja2 templates in `templates/` enabling configuration file parametrisation  
- Inventory support for one or many hosts, grouped by environment or function  
- Integration with Ansible force-run / check / dry-run workflows  

### **Beyond the baseline**  
- Easy to add custom roles for additional services (e.g., Apache, MySQL, Postgres, Docker)  
- Tagging of tasks/playbooks so you can run subsets (e.g., `--tags firewall`)  
- Designed for host groups and host-specific overrides  
- Built to support ongoing operations (e.g., configuration drift correction, log archival, backups)  

---

## Repository Structure  

Feel free to adapt names/folders—this is a suggested baseline.

---

## Getting Started  

### Prerequisites  
- A control node (e.g., your workstation or jump host) with Ansible installed (version 2.9+ or preferably 2.12+).  
- Target hosts running RHEL or compatible OS, reachable via SSH and with sudo privileges (or root).  
- The control node must have SSH key access (or password-based if your team allows) to the target hosts.  
- For encrypted secrets (passwords, keys) you’ll need to use `ansible‐vault` (or equivalent) and store keys outside this repo for security.  
- Basic familiarity with Ansible: inventories, playbooks, roles, variables.

### Installation  
```bash
# Clone the repository
git clone https://github.com/majevince/RHEL-Systems-Services.git
cd RHEL-Systems-Services

# (Optional) Create Python virtual environment and install Ansible
python3 -m venv .env
source .env/bin/activate
pip install ansible

# Review ansible.cfg, inventory/ and vars/ directories
# Update inventory/production.yml with your target hosts or groups
ansible-playbook -i inventory/production.yml playbooks/sshd.yml --tags "configure"
ansible-playbook -i inventory/production.yml playbooks/sysctl.yml --limit “webservers”

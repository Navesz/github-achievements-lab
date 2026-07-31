# GitHub Achievements Lab

Laboratório público para aprender os fluxos de colaboração do GitHub e
acompanhar conquistas de perfil sem gerar spam.

## Constellation

A aplicação **Constellation** nasceu neste laboratório e agora evolui em seu
próprio repositório: [`Navesz/constellation`](https://github.com/Navesz/constellation).
O histórico do produto foi preservado na extração; este repositório permanece
focado nos experimentos e na documentação sobre conquistas do GitHub.

## Objetivos

- praticar issues, pull requests, revisões e coautoria;
- manter um inventário reproduzível das conquistas visíveis;
- receber perguntas reais em Discussions;
- documentar caminhos éticos para cada conquista.

## Conquistas ativas conhecidas

| Conquista | Como é obtida |
| --- | --- |
| Quickdraw | Encerrar uma issue ou um pull request em até cinco minutos |
| Pull Shark | Ter pull requests abertos por você e posteriormente mesclados |
| Pair Extraordinaire | Participar como coautor de commits em pull requests mesclados |
| Galaxy Brain | Ter respostas aceitas em Discussions |
| Starstruck | Criar um repositório que receba estrelas de outros usuários |
| YOLO | Mesclar um pull request sem revisão |
| Public Sponsor | Patrocinar publicamente um mantenedor pelo GitHub Sponsors |

Algumas conquistas possuem níveis. Arctic Code Vault Contributor e Mars 2020
Contributor são históricas e não podem mais ser obtidas. Critérios e
disponibilidade podem mudar enquanto o recurso estiver em preview.

## Auditoria local

O script [`scripts/profile-audit.ps1`](scripts/profile-audit.ps1) usa o GitHub
CLI e a página pública de perfil para listar conquistas visíveis e contar pull
requests mesclados.

```powershell
./scripts/profile-audit.ps1
./scripts/profile-audit.ps1 -Login octocat
```

Requisitos: PowerShell 7 ou Windows PowerShell 5.1, GitHub CLI instalado e uma
sessão autenticada em `gh auth login`.

## Colaboração

Perguntas técnicas reais são bem-vindas em Discussions. Para alterações no
repositório, consulte o [guia de contribuição](CONTRIBUTING.md).

> Este projeto não incentiva contas falsas, estrelas combinadas, respostas
> artificiais nem pull requests vazios. As conquistas devem refletir atividade
> real de colaboração.

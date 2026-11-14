# Word of Agent

Word of Agent checks whether search engines and AI assistants can find, read and recommend a website, and says
what to change. Connected to your assistant, it gives the assistant the measurements and the work: your assistant
fixes, writes and drafts; you approve anything that goes out in your name; Word of Agent checks the result.

This repository holds what assistants and directories need to use the hosted service: the MCP server's registry
entry, the plugin manifest and the agent skill. The service itself is not open source, and neither are its
playbooks: the connector serves them to signed-in accounts (`get_playbook`). They are not in this repository and
the licence here does not cover them.

## Connect it

The server is a remote MCP server with OAuth:

```
https://app.wordofagent.app/mcp
```

You sign in to Word of Agent and choose which account the assistant may use. A free account is enough to start:
sign up at [wordofagent.app](https://wordofagent.app) with your email and add your site.

- **Claude:** Settings, Connectors, Add custom connector, paste the address, then Connect.
- **ChatGPT:** Settings, Apps and Connectors, Create (turn on developer mode under Advanced if you do not see it),
  and use the same address.
- **Claude Code, Codex and other agents:** add it as a remote MCP server with that address; they open the sign-in
  in your browser. For example, `claude mcp add --transport http wordofagent https://app.wordofagent.app/mcp`.

## What your assistant can do with it

- **Measure.** Audit a site: crawler access, indexing in Google and Bing, rendering, structured data, the facts
  the site states, listings and reviews.
- **Ask the customers' questions.** Get the questions, answer them the way it would answer anyone, and send the
  answers; read them back for who is named instead, what is said wrong, and why.
- **Fix.** Work through the to do list most costly first, with the exact fix for each finding, then have Word of
  Agent check it again.
- **Get the business heard.** A main channel chosen from evidence, pages to write, sources to get mentioned on,
  local listings, reviews, rivals compared and listening.
- **Draft for you to approve.** Outreach, replies, review requests and pitches are drafts: nothing is sent,
  posted or published until you approve it in Word of Agent.

## What it never does

- It calls no AI model: your own assistant does the thinking.
- It sends nothing in your name. An assistant cannot approve its own drafts or plans: only a person signed in to
  Word of Agent can.
- It does not scrape personal data or buy lists.

## In this repository

| Path | What it is |
|---|---|
| `server.json` | The entry in the [MCP Registry](https://registry.modelcontextprotocol.io) (`app.wordofagent/wordofagent`) |
| `plugin.json`, `mcp.json` | The plugin manifest and its MCP server |
| `skills/wordofagent` | The skill for agents: what Word of Agent does and which tool to call for each piece of work |

The playbooks for each kind of work are served by the connector itself (`get_playbook`), to signed-in accounts.

## Data and support

What we collect and why is in the [privacy policy](https://wordofagent.app/privacy); the
[terms](https://wordofagent.app/terms) cover using the service. More at
[wordofagent.app/connector](https://wordofagent.app/connector). Questions or problems: support@wordofagent.app.

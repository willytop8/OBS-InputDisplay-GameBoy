# GB Input Display — Agent Instructions

## Commands

```bash
npm install          # Install dependencies
npm run dev          # Dev server for overlay renderer
npm run build        # Production build
npm run test         # Run Vitest test suite
npm run test:e2e     # Playwright visual tests
npm run lint         # ESLint + Prettier
npm run typecheck    # TypeScript checking
npm run package      # Create distributable preset archive
```

## Repo Conventions

- TypeScript strict mode everywhere
- Prettier for formatting (no debate)
- ESLint with recommended rules
- Vitest for unit/integration tests
- Playwright for visual regression tests
- SVG assets must be original vector artwork (no Nintendo-traced assets)
- Commit messages: conventional commits (feat:, fix:, docs:, chore:)
- No direct DOM manipulation in renderer — use data-binding approach

## Package Boundaries

```
packages/protocol/       # Types + validation, zero DOM deps
packages/input-mapping/  # Key/button → GameBoyAction mapper
packages/theme-schema/   # Theme manifest validation
packages/theme-player-silver/  # Default theme assets
apps/overlay-renderer/   # Browser-source HTML/CSS/JS renderer
```

## Definition of Done

- TypeScript compiles without errors
- All tests pass
- Visual regression screenshots match for all required layouts
- Setup guide works from clean OBS profile
- No Nintendo copyrighted assets in any committed file
- Package builds reproducibly

## Testing Expectations

- Unit tests for all mapping, protocol validation, and state logic
- Integration tests for WebSocket → renderer pipeline
- Visual regression tests for all button states × layouts
- Manual test matrix updated per release

## Files Agents Must Not Edit

- `LICENSE` (after initial creation)
- `package.json` `version` field (release process only)
- `.github/workflows/release.yml` (review before modifying)

## Copyright/Branding Rules

- NO Nintendo logos, names, or copyrighted artwork
- Original vector assets only
- "Game Boy" used descriptively, not in product name
- Non-affiliation disclaimer in README footer
- Project name: "GB Input Display" (no Nintendo trademarks)

# Esports Tournaments Management System

Collaborative academic relational database: Arena and Team → Tournament, Player and Match → TournamentTeams and TournamentMatches → join/aggregate reporting.

## Contribution
ABDULELAH ALSOMALI's documented role was data population and SQL query testing. Team attribution: Hussain handled database/diagram design and the report; Essam handled table/query construction. This is not a claim of sole authorship.

## Files and privacy
`privacy_filtered_original/SQL_Statements_Group1.sql` preserves the academic Oracle logic with coach/player example names replaced by `Coach NN` and `Player NN`. It is a privacy-filtered copy, not byte-identical original source. `codex_improvements/Esports_SQLite_Adaptation.sql` is the later Codex-assisted, dependency-ordered SQLite translation with the same privacy substitutions. Original private files remain unchanged. The seed records are examples and are not a factual roster of real people or organizations.

## Run
Use a fresh disposable SQLite database, enable `PRAGMA foreign_keys=ON`, then execute the adaptation using SQLite CLI or Python sqlite3. Original Oracle source requires Oracle and careful dependency review; its historical instructions to rerun blocks are not a safe migration strategy. Stored procedures are not validated by the SQLite translation.

## Verification
Prior V2.1 SQLite execution: 5 tournaments, 12 teams, 36 players, 12 matches, 5 arenas, 14 tournament-team links and 12 tournament-match links; no foreign-key violations. Phase 3 reruns the exact anonymized adaptation in memory and compares these counts. Oracle execution is not claimed.

## Limitations
The original dependency order is invalid for a one-pass migration. Its tournament-count query counts distinct game names, not tournaments. The later adaptation is clearly separated from original student work.

## Attribution and publication status
This is collaborative academic work. Teammate publication permission is candidate-confirmed; team authorship is retained. Any `codex_improvements/` implementation is a later Codex-assisted reproduction or improvement. Repository preparation and README editing are also Codex-assisted. Original outcomes are not presented as newly executed tests.

## Rights and dependencies
No project license is assigned. Rights remain with the respective authors; no permission to reuse is granted by this README. Dependency licenses remain separate. No datasets, private reports, credentials or original Git history are included. Install dependencies from their declared files rather than uploading dependency bundles.

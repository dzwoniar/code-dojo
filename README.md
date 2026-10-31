# Code Dojo

Osobisty system nauki programowania: moduły curriculum, szablon zadania i wrapper do sesji praktyki w istniejącym repozytorium. To warsztat edukacyjny, bez backendu i interfejsu webowego.

## Zawartość

- `curriculum/01-*.md`–`12-*.md`: czytanie kodu, JavaScript, async, TypeScript, struktury danych, HTTP, SQL, bezpieczeństwo, testy i architektura.
- [today.example.md](today.example.md): zakres jednego ćwiczenia.
- [journal.example.md](journal.example.md): prywatny zapis wniosków.
- [scripts/dojo-practice.sh](scripts/dojo-practice.sh): przekazanie zadania do lokalnego CLI.

## Użycie

Potrzebne są Bash, Git oraz skonfigurowany lokalnie Codex CLI. Skopiuj szablony do `today.md` i `journal.md` i uzupełnij własny temat. Następnie przejdź do własnego repozytorium ćwiczeniowego i utwórz osobną gałąź. Uruchom wrapper przez pełną ścieżkę; `CODEX_BIN` pozwala wskazać instalację CLI.

Wrapper odmawia pracy na main/master, używa sandboxa workspace-write i pozostawia przegląd diffu oraz commit operatorowi. Nie uruchamiano go na prawdziwym koncie podczas publikacji. Sprawdzono składnię Bash, nie jakość odpowiedzi agenta.

## Prywatność i zakres

Lokalny dziennik, bieżące zadanie, wcześniejsze rozmowy i odnośniki do prywatnych notatników nie są publikowane. Nie umieszczaj w zadaniach danych klientów, haseł ani tokenów. Repozytorium dokumentuje sposób uczenia się; ukończenie curriculum nie jest automatycznie weryfikowane ani przedstawiane jako certyfikat.

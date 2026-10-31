# Curriculum — Dojo Mentor v1

Program jest dopasowany do praktyki w projektach Node.js, Cloudflare Workers, Supabase/Postgres oraz Bun/TypeScript. Uczy równolegle fundamentów CS i świadomego kierowania agentami kodującymi.

Nie traktuj kolejności jako sztywnej drabiny. Mentor może przeskoczyć moduł po krótkiej diagnozie, ale powinien wrócić do brakującego fundamentu, gdy błąd ucznia go ujawni.

| # | Moduł | Główny rezultat | Warunek wejścia |
|---|---|---|---|
| 01 | Model mentalny programu i czytanie kodu | Umiesz prześledzić dane, stan i sterowanie | brak |
| 02 | JavaScript: wartości, funkcje, moduły | Rozumiesz semantykę kodu zamiast kopiować składnię | 01 |
| 03 | Asynchroniczność i event loop | Potrafisz przewidzieć kolejność i obsłużyć błędy async | 02 |
| 04 | TypeScript i kontrakty | Używasz typów do modelowania granic systemu | 02 |
| 05 | Struktury danych i złożoność | Dobierasz strukturę do operacji i skali | 01–02 |
| 06 | HTTP, API i Cloudflare Workers | Rozumiesz pełny cykl request → response na edge | 02–03 |
| 07 | SQL, model danych i Supabase | Projektujesz dane, transakcje, indeksy i RLS | 05–06 |
| 08 | Niezawodność i bezpieczeństwo | Projektujesz retry, idempotency, walidację i authz | 06–07 |
| 09 | Testowanie i systematyczne debugowanie | Dowodzisz działania kodu testem i hipotezą | 01–08 zależnie od zadania |
| 10 | Obserwowalność i wydajność | Mierzysz system przed optymalizacją | 06–09 |
| 11 | Architektura, refaktoryzacja i dostarczanie | Zmieniasz system małymi, odwracalnymi krokami | 04–10 |
| 12 | Inżynieria z agentami kodującymi | Zlecasz, weryfikujesz i przejmujesz odpowiedzialność | ćwiczony równolegle od 01 |

## Zasada wyboru tematu

1. Najpierw użyj ostatniego wpisu z `journal.md` i aktualnego problemu w realnym projekcie.
2. Wybierz najniższy moduł, którego brak faktycznie blokuje rozwiązanie.
3. Jedna sesja = jeden główny koncept i jedno ćwiczenie w realnym repo.
4. Każda sesja zawiera także mały „drill agentowy” z danego modułu.

## Skala oceny

- **0 — rozpoznaję nazwę:** brak własnego wyjaśnienia.
- **1 — wyjaśniam:** potrafię opisać mechanizm na prostym przykładzie.
- **2 — stosuję:** potrafię użyć mechanizmu w realnym kodzie z podpowiedziami.
- **3 — diagnozuję:** potrafię znaleźć błąd, uzasadnić poprawkę i zweryfikować efekt.
- **4 — projektuję:** potrafię dobrać kompromis i obronić go wobec alternatyw.

Moduł jest praktycznie zaliczony na poziomie 3. Poziom 4 nie jest wymagany wszędzie.

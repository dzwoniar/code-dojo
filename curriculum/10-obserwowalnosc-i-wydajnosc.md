# 10 — Obserwowalność i wydajność

## Po co

Jeśli system zwalnia lub psuje się tylko u części użytkowników, potrzebujesz dowodów z działania. Optymalizacja bez pomiaru zwykle przenosi złożoność w złe miejsce.

## Cele

- projektować logi strukturalne z kontekstem i bez PII;
- rozróżniać logi, metryki i trace’y;
- używać correlation/request ID;
- mierzyć latency, error rate, throughput i nasycenie zasobu;
- lokalizować wąskie gardło przed optymalizacją;
- rozumieć cache, batching i problem N+1.

## Mapa konceptów

- Log opisuje zdarzenie; metryka agreguje zachowanie w czasie; trace łączy etapy jednego przepływu.
- Request/correlation ID pozwala śledzić operację przez granice systemu, ale nie powinien być sekretem ani identyfikatorem PII.
- Średnia ukrywa ogon; percentyle p95/p99 pokazują doświadczenie wolniejszych żądań.
- Wydajność ma budżet: czas, CPU, pamięć, liczba zapytań i koszty zewnętrzne.
- N+1 to seria podobnych zapytań/wywołań powstająca wewnątrz iteracji.
- Cache wymaga klucza, TTL, strategii invalidacji i decyzji o spójności.
- Benchmark musi mieć realistyczne dane, rozgrzewkę i porównywalne warunki.

## Pytania diagnostyczne

1. Jakim jednym sygnałem odróżnisz wolną bazę od wolnego zewnętrznego API?
2. Który percentyl i budżet są istotne dla użytkownika?
3. Co może stać się nieaktualne po dodaniu cache i jak to wykryjesz?

## Ćwiczenia w realnym repo

- Dodaj do jednego krytycznego flow spójny request ID, czas etapów i kod wyniku bez logowania body/tokenów. Wywołaj sukces i błąd, a potem odtwórz przebieg z logów.
- Znajdź potencjalne N+1 lub powtarzane `fetch`. Zmierz liczbę wywołań, zastosuj batching/join/cache i porównaj wynik.

## Drill agentowy

Poproś agenta o plan pomiaru bez zmian produkcyjnych: hipoteza, sygnał, miejsce instrumentacji, oczekiwany wynik i kryterium cofnięcia. Implementację zleć dopiero po zaakceptowaniu planu.

## Kryteria zaliczenia

- z logów da się prześledzić sukces i błąd bez dostępu do danych wrażliwych;
- optymalizacja ma pomiar przed/po i nie zmienia kontraktu;
- potrafisz nazwać koszt oraz ryzyko cache/batchingu;
- wiesz, gdzie nadal brakuje widoczności.

## Typowe pułapki

- logowanie wszystkiego „na wszelki wypadek”;
- mierzenie tylko średniej;
- cache bez unieważniania i separacji użytkowników;
- mikrobenchmark nieodzwierciedlający I/O;
- optymalizacja kodu przy faktycznym bottlenecku w bazie lub sieci.

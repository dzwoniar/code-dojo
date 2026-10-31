# 07 — SQL, model danych i Supabase

## Po co

Baza nie jest workiem na JSON. Klucze, ograniczenia, transakcje, indeksy i RLS są wykonywalną częścią logiki systemu, której kod aplikacji nie powinien tylko udawać.

## Cele

- modelować encje, relacje i cykl życia danych;
- rozumieć PK, FK, unique, not null i check;
- pisać oraz czytać podstawowe joiny i agregacje;
- używać transakcji do ochrony inwariantów;
- projektować indeks pod konkretne zapytanie;
- rozumieć RLS jako autoryzację w bazie, nie filtr UI.

## Mapa konceptów

- Schemat powinien uniemożliwiać nieprawidłowy stan tam, gdzie reguła jest trwała i jednoznaczna.
- Foreign key chroni istnienie relacji; `ON DELETE` musi odpowiadać cyklowi życia danych.
- Transakcja grupuje zmiany: wszystkie się zatwierdzają albo żadna. Izolacja określa, co widzą równoległe operacje.
- Indeks pomaga, gdy jego kolejność kolumn odpowiada filtrom/sortowaniu; każdy indeks kosztuje przy zapisie.
- RLS ocenia, które wiersze dana rola może zobaczyć lub zmienić. Service role omija RLS i wymaga szczególnej ochrony.
- Migracja jest wersjonowaną zmianą kontraktu danych i potrzebuje planu zgodności/rollbacku.

## Pytania diagnostyczne

1. Który inwariant chroni baza, a który tylko kod aplikacji?
2. Co zobaczą dwie równoległe operacje i czy mogą obie „wygrać”?
3. Jak udowodnisz, że użytkownik A nie odczyta ani nie zmieni danych B?

## Ćwiczenia w realnym repo

- Wybierz tabelę. Wypisz encję, klucze, ograniczenia, relacje i trzy najważniejsze zapytania. Dodaj brakujące ograniczenie lub test migracji.
- Znajdź operację read-then-write. Oceń race condition i przenieś inwariant do transakcji, unikalnego constraintu lub atomowego SQL.
- Przetestuj politykę RLS co najmniej dla właściciela, innego użytkownika i anonima.

## Drill agentowy

Poproś agenta o propozycję migracji wraz z zapytaniami weryfikującymi, planem zgodności i rollbackiem. Nie pozwól uruchamiać jej na produkcji; najpierw przejrzyj SQL i wykonaj na lokalnym/testowym środowisku.

## Kryteria zaliczenia

- potrafisz wskazać inwariant i mechanizm bazy, który go egzekwuje;
- zapytanie ma sensowny plan/indeks dla realnej skali;
- test RLS obejmuje negatywny przypadek między użytkownikami;
- migracja jest mała, wersjonowana i odwracalna lub ma jawny plan naprawczy.

## Typowe pułapki

- użycie service role w kodzie dostępnym klientowi;
- RLS włączone bez kompletnej polityki;
- indeks „na wszelki wypadek” bez zapytania;
- wieloetapowy zapis bez transakcji lub constraintu;
- mieszanie `null`, brak wiersza i pustej wartości domenowej.

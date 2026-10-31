# 05 — Struktury danych i złożoność

## Po co

Wybór między tablicą, `Map`, `Set`, kolejką i indeksem w bazie wpływa na czytelność oraz koszt systemu. Big O nie służy do popisywania się — pomaga przewidzieć, co stanie się po wzroście danych.

## Cele

- rozpoznawać koszt dominujących operacji;
- dobierać strukturę do wyszukiwania, kolejności, unikalności i agregacji;
- odróżnić złożoność czasową od pamięciowej;
- rozumieć amortyzowany koszt i praktyczne stałe;
- zauważać, kiedy operację powinien wykonać SQL zamiast JavaScript.

## Mapa konceptów

- Tablica dobrze przechowuje kolejność i iterację; liniowe wyszukiwanie kosztuje zwykle O(n).
- `Map` daje jawne klucze i średnio szybki lookup; `Set` modeluje unikalność/przynależność.
- Stos to LIFO, kolejka to FIFO. Nazwanie struktury ujawnia intencję lepiej niż przypadkowe `push/shift`.
- Dwie zagnieżdżone pełne iteracje sugerują O(n²), ale zawsze licz rzeczywistą skalę i zakres.
- Big O pomija stałe; dla małych danych prostszy kod może być lepszy.
- Indeks bazy to struktura przyspieszająca odczyt kosztem miejsca i zapisu.

## Pytania diagnostyczne

1. Jakie operacje są najczęstsze: iteracja, lookup, usuwanie, zachowanie kolejności czy unikalność?
2. Co stanie się przy 100 razy większej liczbie rekordów?
3. Czy pobierasz dużo danych tylko po to, by filtrować/łączyć je w JS?

## Ćwiczenia w realnym repo

- Znajdź wielokrotne `find/includes` wewnątrz pętli. Zmierz dane, zbuduj `Map/Set` raz i porównaj czytelność oraz czas.
- Znajdź agregację lub join wykonywany po stronie Workera. Oceń, czy bezpieczniej i taniej wykonać go zapytaniem SQL.

## Drill agentowy

Poproś agenta o trzy warianty struktury z tabelą: operacje, złożoność, pamięć, czytelność i ryzyko. Sam wybierz wariant i uzasadnij wybór przed implementacją.

## Kryteria zaliczenia

- wybór struktury wynika z operacji, nie przyzwyczajenia;
- umiesz oszacować rząd kosztu przed optymalizacją;
- porównanie ma pomiar lub realistyczne dane wejściowe.

## Typowe pułapki

- używanie Big O bez znajomości rozmiaru danych;
- optymalizacja kodu, który wykonuje się rzadko;
- utrata kolejności lub obsługi duplikatów po zmianie struktury;
- pobranie całej tabeli do pamięci Workera.

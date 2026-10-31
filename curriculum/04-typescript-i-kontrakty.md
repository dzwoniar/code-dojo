# 04 — TypeScript i kontrakty na granicach

## Po co

TypeScript ma zmniejszać liczbę niemożliwych stanów i ułatwiać bezpieczne zmiany. Nie waliduje jednak danych przychodzących z sieci, bazy ani pliku — typ po kompilacji znika.

## Cele

- odróżnić sprawdzanie statyczne od walidacji runtime;
- modelować warianty jako union zamiast zestawu luźnych flag;
- zawężać `unknown` bez ucieczki w `any`;
- projektować kontrakty request/response i funkcji;
- rozumieć generics na praktycznych kolekcjach i wynikach.

## Mapa konceptów

- Typ opisuje założenia kompilatora; dane zewnętrzne zaczynają jako `unknown`.
- Discriminated union łączy wariant z danymi, które w tym wariancie istnieją.
- `any` wyłącza kontrolę i rozprzestrzenia niepewność; `unknown` wymaga sprawdzenia.
- Typ węższy jest bezpieczniejszy, gdy odzwierciedla regułę domeny, np. wynik `success | failure`.
- Generics zachowują relację między typami; nie powinny być ozdobą komplikującą prostą funkcję.
- Niebezpieczne `as` jest obietnicą programisty, nie dowodem.

## Pytania diagnostyczne

1. Co stanie się, gdy API zwróci wartość inną niż deklaruje interfejs?
2. Jak zamodelować stan „pending/success/error”, by sukces zawsze miał dane, a błąd komunikat?
3. Czy assertion `as X` wynika ze sprawdzenia, czy tylko ucisza kompilator?

## Ćwiczenia w realnym repo

- W projekcie Bun/TypeScript znajdź granicę z `any` lub szerokim obiektem. Zmień wejście na `unknown`, dodaj walidację i zwróć jawny typ wyniku.
- Zastąp dwie lub więcej flag stanu discriminated union i popraw miejsca użycia tak, aby kompilator wymuszał kompletność.

## Drill agentowy

Zleć agentowi najpierw zaproponowanie typu domenowego i pięciu przykładów danych: poprawnych, granicznych i błędnych. Zaakceptuj typ dopiero, gdy potrafisz wyjaśnić każdy wariant.

## Kryteria zaliczenia

- nie traktujesz typu jako walidacji runtime;
- usunięcie `any/as` ujawnia realne, obsłużone przypadki zamiast przenosić problem;
- typ upraszcza użycie i wyklucza co najmniej jeden błędny stan.

## Typowe pułapki

- generowanie ogromnych typów, których nikt nie rozumie;
- optional `?` zamiast jawnego modelu wariantów;
- `as` na odpowiedzi `fetch` bez walidacji;
- odwzorowanie schematu bazy 1:1 jako całego modelu domenowego.

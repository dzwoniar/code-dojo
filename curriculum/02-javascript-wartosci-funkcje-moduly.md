# 02 — JavaScript: wartości, funkcje i moduły

## Po co

Node.js i Workers opierają się na JavaScript. Znajomość frameworka nie zastąpi rozumienia tego, jak język kopiuje wartości, zamyka zmienne w closure, obsługuje obiekty i ładuje moduły.

## Cele

- rozumieć prymitywy, referencje i mutację;
- używać zakresu leksykalnego i closure świadomie;
- projektować małe funkcje o jasnych kontraktach;
- odróżnić dane domenowe od obiektów infrastruktury;
- rozumieć import/export w ESM oraz granice modułów.

## Mapa konceptów

- Prymitywy są wartościami niezmiennymi; obiekt jest osiągalny przez referencję, a jego zawartość może się zmieniać.
- `const` blokuje ponowne przypisanie nazwy, nie mutację obiektu.
- Closure zachowuje dostęp do zakresu, w którym funkcja powstała. To podstawa fabryk, handlerów i ukrytego stanu.
- Czysta funkcja dla tych samych wejść daje ten sam wynik i nie zmienia świata poza sobą.
- Granica modułu powinna eksportować mały, celowy interfejs. Eksport wszystkiego sprzęga kod i utrudnia zmianę.
- `null`, `undefined`, brak pola i pusty ciąg nie są automatycznie tym samym stanem domenowym.

## Pytania diagnostyczne

1. Dlaczego zmiana zagnieżdżonego pola może być widoczna w dwóch miejscach mimo `const`?
2. Jak closure może pomóc, a jak może przypadkiem zatrzymać niepotrzebny stan?
3. Które zachowanie modułu jest publicznym kontraktem?

## Ćwiczenia w realnym repo

- Znajdź funkcję łączącą walidację, logikę i I/O. Wydziel czysty rdzeń bez zmiany publicznego zachowania i zabezpiecz go testem.
- Znajdź obiekt mutowany w kilku miejscach. Ustal, czy mutacja jest intencjonalna; jeśli nie, zamień przepływ na jawne tworzenie nowej wartości.

## Drill agentowy

Zleć agentowi wskazanie kontraktu funkcji: wejścia, wynik, wyjątki i efekty uboczne. Nie pozwól mu jeszcze edytować. Sam dopisz brakujące przypadki, a potem zleć refaktor z zakazem zmiany API.

## Kryteria zaliczenia

- przewidujesz skutki aliasowania obiektów;
- umiesz wyjaśnić, co closure przechowuje i dlaczego;
- po refaktorze zachowanie jest potwierdzone testem, a granica modułu jest mniejsza lub jaśniejsza.

## Typowe pułapki

- „`const` oznacza immutable”;
- kopiowanie obiektu spreadem i założenie, że to kopia głęboka;
- funkcja z ukrytym dostępem do globalnego stanu;
- mieszanie CommonJS i ESM bez zrozumienia środowiska uruchomieniowego.

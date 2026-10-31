# 01 — Model mentalny programu i czytanie kodu

## Po co

Zanim zmienisz kod, musisz umieć powiedzieć: jakie dane wchodzą, gdzie są przekształcane, jaki stan się zmienia i co wychodzi. Ten moduł ogranicza zgadywanie oraz bezmyślne akceptowanie zmian agenta.

## Cele

- odróżnić kod od procesu, który wykonuje kod;
- prześledzić przepływ danych i sterowania;
- wskazać stan, efekt uboczny, wejście i wyjście;
- zbudować małą hipotezę przed uruchomieniem programu;
- czytać diff jako zmianę zachowania, nie zbiór kolorowych linii.

## Mapa konceptów

- **Wartość** to konkretna informacja w danym momencie; **zmienna** to nazwa wiążąca się z wartością.
- **Stan** to informacja, od której zależy późniejsze zachowanie programu.
- **Przepływ sterowania** określa, która instrukcja wykona się następna: kolejność, warunek, pętla, wywołanie, wyjątek.
- **Przepływ danych** pokazuje, skąd dane przyszły, jak zmieniły kształt i dokąd trafiły.
- **Efekt uboczny** zmienia świat poza wynikiem funkcji: zapis pliku/bazy, sieć, log, czas, losowość.
- **Inwariant** to warunek, który ma pozostać prawdziwy przed i po operacji.

## Pytania diagnostyczne

1. Co dokładnie stanie się po wywołaniu funkcji i skąd to wiesz?
2. Którą część można przetestować bez sieci, zegara i bazy?
3. Jaki inwariant musi obowiązywać nawet po błędzie?

## Ćwiczenia w realnym repo

- Wybierz jeden endpoint lub komendę CLI. Narysuj tekstowo trasę: wejście → walidacja → logika → efekt uboczny → odpowiedź. Dopiero potem porównaj ją z kodem.
- Znajdź funkcję z co najmniej dwoma warunkami. Przewidź wyniki dla trzech wejść bez uruchamiania; następnie sprawdź testem lub małym skryptem.

## Drill agentowy

Najpierw poproś agenta wyłącznie o mapę przepływu i listę niewiadomych, bez edycji. Sam sprawdź mapę w kodzie. Dopiero drugim poleceniem zleć najmniejszą zmianę.

## Kryteria zaliczenia

- potrafisz opowiedzieć wykonanie ścieżki bez ogólników typu „to się przetwarza”;
- przewidywanie zgadza się z obserwacją albo umiesz wyjaśnić rozbieżność;
- w review wskazujesz zmianę zachowania i ryzyko, nie tylko składnię.

## Typowe pułapki

- czytanie pliku od góry bez ustalenia punktu wejścia;
- mylenie logu z dowodem poprawności;
- zmiana kilku hipotez naraz;
- zaakceptowanie opisu agenta bez sprawdzenia diffu i uruchomienia kodu.

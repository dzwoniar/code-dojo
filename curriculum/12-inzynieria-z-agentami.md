# 12 — Inżynieria z agentami kodującymi

## Po co

Agent przyspiesza pisanie i analizę, ale nie przejmuje odpowiedzialności za cel, dane, bezpieczeństwo ani produkcję. Największa dźwignia pochodzi z dobrego rozpoznania problemu, małych zleceń i rygorystycznej weryfikacji.

Ten moduł jest równoległy do wszystkich pozostałych: każda sesja ćwiczy jeden element pracy z agentem.

## Cele

- przekazywać cel, kontekst, ograniczenia i definicję sukcesu;
- rozdzielać inspect → plan → implement → verify;
- dobierać rozmiar zadania do ryzyka i niepewności;
- recenzować diff, testy i założenia zamiast ufać deklaracji „done”;
- porównywać narzędzia na tym samym zadaniu;
- chronić sekrety i kontrolować zakres uprawnień;
- utrzymywać własny model mentalny systemu.

## Mapa konceptów

- Dobry prompt wykonawczy zawiera: **cel**, **kontekst**, **zakres**, **ograniczenia**, **dowód ukończenia** i **format raportu**.
- Gdy problem jest niejasny, pierwszym zleceniem jest read-only inspection z dowodami, nie implementacja.
- Plan ma identyfikować pliki, ryzyka, testy i kolejność. Plan nie jest dowodem poprawności.
- Mały patch ogranicza blast radius, ułatwia review i cofnięcie.
- Test wygenerowany przez tego samego agenta może powielać jego błędne założenie; użytkownik sprawdza, czy test naprawdę falsyfikuje błąd.
- „Agent powiedział” nie jest źródłem prawdy. Źródłem są kod, dokumentacja, wynik komendy, test i obserwowalne zachowanie.
- Uprawnienia powinny odpowiadać zadaniu. Nie podawaj agentowi sekretów ani dostępu produkcyjnego, jeśli nie jest konieczny.

## Wzorzec zlecenia

```text
Cel: <jaki wynik użytkowy ma powstać>
Kontekst: <repo/stack/istotne fakty>
Najpierw: przeczytaj wskazane miejsca i potwierdź obecne zachowanie dowodami.
Zakres: <co wolno zmienić>
Poza zakresem: <czego nie ruszać>
Ograniczenia: <kompatybilność, bezpieczeństwo, styl>
Weryfikacja: <konkretne testy/komendy/scenariusze>
Raport: zmienione pliki, wynik testów, pozostałe ryzyka.
```

## Pytania diagnostyczne

1. Które założenie w odpowiedzi agenta jest najgroźniejsze, jeśli okaże się fałszywe?
2. Jaki wynik komendy/testu rzeczywiście dowodzi ukończenia?
3. Czy sam potrafisz wyjaśnić diff i przewidzieć jego wpływ na sąsiednie ścieżki?

## Drill agentowy

Przeprowadź trzy osobne zlecenia: (1) discovery bez edycji, (2) ograniczona implementacja dopiero po własnej próbie Kuby, (3) niezależne review bez poprawiania kodu. Każde zlecenie ma własny zakres, warunek zatrzymania i dowód ukończenia.

## Ćwiczenia

- Wybierz mały bug. Daj Codexowi najpierw zadanie diagnostyczne bez edycji, następnie osobno test regresyjny, a dopiero potem minimalny fix. Zapisz, gdzie agent chciał pójść za szeroko.
- Co 3–4 sesje wykonaj ten sam typ zadania w Copilot CLI. Porównaj potrzebny kontekst, jakość pytań, rozmiar diffu, trafność testów i łatwość review — nie tylko szybkość.
- Weź duży prompt i rozbij go na trzy kontrakty z osobnymi dowodami ukończenia. Porównaj liczbę korekt z podejściem „zrób wszystko”.

## Kryteria zaliczenia

- potrafisz zatrzymać agenta po błędnym założeniu i wrócić do dowodu;
- każde zlecenie ma jawny zakres i weryfikację;
- sam wyjaśniasz końcowy diff oraz uruchamiasz adekwatne testy;
- nie wysyłasz sekretów ani nie akceptujesz niepotrzebnych uprawnień;
- journal zawiera osobny CS-insight i agent-insight.

## Typowe pułapki

- jeden ogromny prompt obejmujący diagnozę, refaktor i deploy;
- prośba „napraw” bez definicji zachowania;
- akceptacja testów, które nigdy nie widziały failure;
- pozwolenie agentowi na zmianę zależności/architektury poza zakresem;
- review streszczenia zamiast rzeczywistego diffu;
- delegowanie decyzji produktowej lub bezpieczeństwa bez danych i odpowiedzialnego człowieka.

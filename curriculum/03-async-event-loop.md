# 03 — Asynchroniczność, Promise i event loop

## Po co

Większość backendu czeka na sieć, bazę lub plik. `async/await` upraszcza zapis, ale nie usuwa współbieżności, kolejki zdarzeń ani ryzyka zagubionych błędów.

## Cele

- rozumieć call stack, taski i microtaski na poziomie potrzebnym do diagnozy;
- przewidywać kolejność `Promise`, `await` i timerów;
- odróżnić sekwencję od bezpiecznej równoległości;
- propagować błędy i kończyć pracę w kontrolowany sposób;
- stosować timeout, anulowanie i limity współbieżności.

## Mapa konceptów

- JavaScript wykonuje kod na stosie; operacje I/O kończą się później i planują dalszą pracę.
- Reakcje Promise/microtaski są opróżniane przed kolejnym zwykłym taskiem, np. timerem.
- `await` wstrzymuje daną funkcję, nie cały proces. Kod po `await` wraca jako kontynuacja Promise.
- `Promise.all` uruchamia pracę współbieżnie i odrzuca wynik po pierwszym błędzie; nie anuluje automatycznie pozostałych operacji.
- Sekwencja jest potrzebna, gdy krok zależy od poprzedniego lub chroni ograniczony zasób.
- Timeout bez anulowania może tylko przestać czekać, podczas gdy operacja nadal trwa.

## Pytania diagnostyczne

1. W jakiej kolejności pojawią się logi z `queueMicrotask`, rozwiązanego Promise i `setTimeout(0)`?
2. Kiedy `Promise.all` jest poprawny, a kiedy stworzy skok obciążenia lub częściowe skutki uboczne?
3. Gdzie błąd zostanie złapany i co zobaczy klient?

## Ćwiczenia w realnym repo

- Znajdź pętlę z `await`. Zmierz zachowanie sekwencyjne, oceń zależności i ewentualnie wprowadź ograniczoną współbieżność zamiast ślepego `Promise.all`.
- Dodaj kontrolowany timeout do zewnętrznego requestu oraz test przypadku timeout/błędu; zachowaj sensowny status i log kontekstowy.

## Drill agentowy

Poproś agenta o tabelę osi czasu dla wybranej ścieżki async i o wskazanie miejsc, gdzie błąd może zostać nieobsłużony. Zakwestionuj co najmniej jedno założenie i potwierdź je eksperymentem.

## Kryteria zaliczenia

- poprawnie przewidujesz kolejność prostego przykładu;
- potrafisz uzasadnić sekwencję, równoległość i limit;
- błąd/timeout ma test, kontrolowaną odpowiedź i nie tworzy cichego `unhandled rejection`.

## Typowe pułapki

- `array.forEach(async () => ...)` bez oczekiwania na wyniki;
- równoległe uruchomienie operacji, które modyfikują ten sam zasób;
- `catch` tylko logujący i ukrywający porażkę;
- retry bez limitu, backoffu i sprawdzenia idempotency.

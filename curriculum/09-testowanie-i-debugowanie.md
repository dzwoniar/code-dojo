# 09 — Testowanie i systematyczne debugowanie

## Po co

Debugowanie bez hipotezy zamienia się w losowe edycje. Test nie ma udowodnić, że funkcja została wywołana, tylko że ważne zachowanie i inwariant są prawdziwe.

## Cele

- tworzyć minimalną reprodukcję błędu;
- formułować jedną falsyfikowalną hipotezę naraz;
- dobierać poziom testu do ryzyka;
- rozumieć unit, integration, contract i end-to-end;
- unikać testów sprzężonych z implementacją;
- używać regresyjnego testu jako dowodu naprawy.

## Mapa konceptów

- Dobra pętla debugowania: obserwacja → hipoteza → eksperyment → wynik → nowa wiedza.
- Test jednostkowy izoluje małą regułę; integracyjny sprawdza realną granicę; E2E sprawdza krytyczny przepływ, ale jest droższy i mniej lokalizuje błąd.
- Test regresyjny powinien najpierw zawieść z powodu zgłoszonego błędu, a po poprawce przejść.
- Fake symuluje prosty działający komponent; mock weryfikuje interakcję. Nadmiar mocków testuje wyobrażenie o systemie.
- Determinizm wymaga kontroli czasu, losowości, kolejności i zewnętrznych zależności.
- Pokrycie linii nie oznacza pokrycia zachowań ani przypadków brzegowych.

## Pytania diagnostyczne

1. Jaka najmniejsza obserwacja odróżni dwie konkurencyjne hipotezy?
2. Czy test przejdzie po błędnej implementacji, która przypadkiem wywoła te same mocki?
3. Która granica musi być realna, aby test miał wartość?

## Ćwiczenia w realnym repo

- Weź istniejący bug lub TODO. Napisz minimalny test regresyjny, zobacz właściwy failure, wprowadź najmniejszą poprawkę i uruchom szerszy zestaw testów.
- Znajdź kruchy test zależny od czasu/sieci. Wydziel granicę i wprowadź kontrolowany zegar/fake, zachowując jeden test integracyjny realnej granicy.

## Drill agentowy

Najpierw zleć agentowi tylko reprodukcję i listę hipotez z dowodami. Po zatwierdzeniu poproś o test, który ma zawieść — bez poprawki. Dopiero po obejrzeniu failure zleć minimalną zmianę.

## Kryteria zaliczenia

- potrafisz pokazać failure przed fixem i pass po fixie;
- test opisuje zachowanie w nazwie i asercjach;
- zmiana jest minimalna, a szersza regresja również przechodzi;
- umiesz powiedzieć, czego test nadal nie dowodzi.

## Typowe pułapki

- jednoczesna zmiana kodu i testu bez zobaczenia failure;
- snapshot wszystkiego bez sprawdzenia sensu;
- mockowanie własnego kodu zamiast zewnętrznej granicy;
- „naprawa” przez zwiększenie timeoutu;
- uruchomienie tylko jednego testu po szerokim refaktorze.

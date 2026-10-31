# 08 — Niezawodność i bezpieczeństwo

## Po co

System działa nie tylko na happy path. Sieć powtarza żądania, użytkownik wysyła złe dane, zależność zwalnia, a atakujący aktywnie szuka granic zaufania.

## Cele

- klasyfikować błędy i projektować kontrolowane porażki;
- stosować retry tylko dla właściwych operacji;
- zapewniać idempotency i kontrolę współbieżności;
- walidować dane na każdej granicy zaufania;
- odróżnić authentication od authorization;
- chronić sekrety, PII i logi.

## Mapa konceptów

- **Authentication** ustala tożsamość; **authorization** decyduje, czy ta tożsamość może wykonać konkretną operację na konkretnym zasobie.
- Walidacja obejmuje kształt, typ, zakres, długość i reguły domenowe. Sanityzacja nie naprawia błędnego modelu zaufania.
- Retry ma sens dla błędu przejściowego i operacji idempotentnej lub chronionej kluczem idempotency.
- Backoff z jitterem ogranicza zsynchronizowane ponowienia; limit prób i deadline zapobiegają pracy bez końca.
- Rate limiting chroni zasób, ale wymaga właściwego klucza, okna i zachowania w systemie rozproszonym.
- Sekret nie może trafiać do repo, promptu, logu, URL ani odpowiedzi. Ujawniony sekret należy obrócić, nie tylko usunąć z pliku.
- Zasada least privilege ogranicza blast radius: minimalne role, zakresy i czas życia.

## Pytania diagnostyczne

1. Co się stanie, gdy klient wyśle to samo żądanie dwa razy po timeout?
2. Gdzie system sprawdza własność zasobu, a nie tylko obecność tokena?
3. Jakie dane mogą znaleźć się w logu błędu i kto ma do niego dostęp?

## Ćwiczenia w realnym repo

- Znajdź operację tworzącą/zlecającą zewnętrzny efekt. Dodaj strategię idempotency oraz test powtórzonego requestu.
- Przejdź jedną ścieżkę od requestu do bazy i oznacz trust boundaries. Dodaj brakującą walidację/autoryzację wraz z negatywnym testem.
- Sprawdź logi i komunikaty błędów pod kątem tokenów, haseł, PII oraz wewnętrznych stack trace’ów.

## Drill agentowy

Zleć agentowi threat-model jednej funkcji: zasoby, aktorzy, granice zaufania, nadużycia i istniejące kontrole. Agent nie może otrzymać prawdziwych sekretów; używaj placeholderów i zanonimizowanych danych.

## Kryteria zaliczenia

- retry ma jawny warunek, limit, backoff i odpowiedź na pytanie o idempotency;
- negatywny test dowodzi, że inny użytkownik nie może wykonać operacji;
- ujawnione sekrety są rotowane, a logi nie kopiują danych wrażliwych;
- potrafisz nazwać kompromis availability vs consistency w danym przypadku.

## Typowe pułapki

- retry każdego `5xx`, także nieidempotentnego zapisu;
- sprawdzenie tylko `user != null` bez własności/roli;
- rate limit w pamięci jednego izolatu Workera;
- logowanie pełnego requestu, nagłówków lub `.env`;
- „ukryty” klucz w kodzie frontendu.

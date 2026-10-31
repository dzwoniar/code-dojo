# 06 — HTTP, API i Cloudflare Workers

## Po co

Worker jest funkcją na granicy sieci. Dobry kod zaczyna się od poprawnego kontraktu HTTP: metoda, URL, nagłówki, body, status, cache i granice zaufania.

## Cele

- prześledzić pełny cykl request → routing → logika → response;
- dobrać metodę i status do semantyki operacji;
- rozumieć nagłówki, CORS, cache i content negotiation;
- projektować bezpieczne, stateless handlery na edge;
- odróżnić błąd klienta, serwera i zależności.

## Mapa konceptów

- HTTP to kontrakt wiadomości, nie zdalne wywołanie funkcji.
- Metody mają semantykę; `GET` powinien być bezpieczny, a idempotentność zależy od efektu operacji.
- Status jest częścią API: 2xx sukces, 4xx błąd żądania/uprawnień, 5xx porażka serwera lub zależności.
- CORS jest polityką przeglądarki. Nie zastępuje uwierzytelniania ani autoryzacji.
- Cache key musi uwzględniać wszystko, co zmienia reprezentację; prywatnych danych nie wolno przypadkiem współdzielić.
- Worker może zostać uruchomiony w wielu izolatach. Pamięć globalna nie jest trwałą bazą ani niezawodną blokadą.

## Pytania diagnostyczne

1. Jaki jest publiczny kontrakt endpointu i które zachowania są kompatybilne wstecz?
2. Które dane kontroluje klient i gdzie są walidowane?
3. Czy odpowiedź może być cache’owana, przez kogo i pod jakim kluczem?

## Ćwiczenia w realnym repo

- Wybierz endpoint Workera. Spisz kontrakt wejścia/wyjścia, popraw rozróżnienie 4xx/5xx i dodaj test najważniejszej ścieżki błędu.
- Znajdź endpoint odczytowy. Oceń cache, prywatność i invalidację; dodaj bezpieczne nagłówki albo udokumentuj, dlaczego `no-store` jest właściwe.

## Drill agentowy

Zleć agentowi audyt jednego endpointu w trybie read-only: kontrakt, trust boundaries, statusy, cache i testy. Każde znalezisko musi wskazywać dowód w kodzie; odrzuć spekulacje bez dowodu.

## Kryteria zaliczenia

- potrafisz opisać request i response bajt po bajcie na istotnym poziomie;
- status i body błędu są spójne oraz testowalne;
- nie mylisz CORS, auth i autoryzacji;
- nie opierasz trwałego stanu na pamięci izolatu.

## Typowe pułapki

- zawsze `200` z polem `success:false`;
- parsowanie JSON bez limitu i obsługi błędu;
- odbijanie dowolnego `Origin` wraz z credentials;
- cache odpowiedzi zależnej od użytkownika pod wspólnym kluczem.

# 11 — Architektura, refaktoryzacja i dostarczanie

## Po co

Dobra architektura nie oznacza wielu warstw. Oznacza granice, które pozwalają zmieniać jedną decyzję bez przypadkowego przepisywania całego produktu, oraz bezpieczny sposób dostarczenia zmiany.

## Cele

- rozdzielać domenę od I/O i konfiguracji;
- oceniać coupling, cohesion i kierunek zależności;
- refaktoryzować bez zmiany zachowania;
- projektować kompatybilne API i migracje;
- używać małych commitów, feature flag i rollbacku;
- rozumieć konfigurację środowisk oraz sekretów.

## Mapa konceptów

- Wysoka cohesion: moduł robi spójną rzecz. Niski coupling: zna mało szczegółów innych modułów.
- Granica jest cenna, gdy odpowiada realnej zmienności: baza, zewnętrzne API, reguła domenowa, transport HTTP.
- Dependency inversion oznacza, że logika zależy od potrzebnego kontraktu, nie konkretnego klienta infrastruktury.
- Refaktor zachowuje obserwowalne zachowanie; najpierw potrzebuje charakterystyki/testu.
- Zmiana kompatybilna często ma etapy expand → migrate → contract zamiast jednego „big bang”.
- Deploy nie kończy pracy. Potrzebne są health signals, plan rollbacku i obserwacja po zmianie.
- Commit powinien być jedną zrozumiałą decyzją, możliwą do review i cofnięcia.

## Pytania diagnostyczne

1. Która decyzja zmienia się najczęściej i ile miejsc dziś dotyka?
2. Czy nowa abstrakcja usuwa rzeczywiste sprzężenie, czy tylko dodaje plik i nazwę?
3. Jak stara i nowa wersja będą współistnieć podczas wdrożenia?

## Ćwiczenia w realnym repo

- Znajdź handler z logiką domenową i I/O. Dodaj test charakterystyczny, wydziel czysty rdzeń i zachowaj publiczny kontrakt.
- Zaplanuj zmianę schematu/API w krokach expand → migrate → contract, z sygnałami sukcesu i sposobem cofnięcia.
- Podziel duży diff agenta na małe, tematyczne commity; do każdego dopisz jednozdaniowe „dlaczego”.

## Drill agentowy

Zleć agentowi najpierw mapę zależności i plan małych patchy. Każdy patch ma własny test i nie może zawierać „przy okazji” formatowania całego repo. Reviewuj oraz zatwierdzaj patch po patchu.

## Kryteria zaliczenia

- po refaktorze zachowanie ma dowód, a granica jest łatwiejsza do testowania;
- potrafisz wskazać kierunek zależności i powód;
- plan wdrożenia uwzględnia współistnienie wersji, obserwację i rollback;
- diff jest mały enough, by samodzielnie wyjaśnić każdą zmianę.

## Typowe pułapki

- abstrakcja przed drugim realnym przypadkiem użycia;
- „clean architecture” jako wiele pustych warstw;
- refaktor i nowa funkcja w jednym nieczytelnym diffie;
- migracja destrukcyjna bez kopii/rollbacku;
- zależność od wartości środowiskowych odczytywana w losowych miejscach kodu.

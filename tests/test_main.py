from app.main import main


def test_main_runs(capsys) -> None:
    main()
    captured = capsys.readouterr()
    assert "Hello from the Dockerized Python app." in captured.out

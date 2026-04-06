# KAIROS TC E3 Cache

This repository stores chunked copies of the public DARPA TC E3 JSON archives
needed to run the KAIROS demos, plus the official CADETS pre-trained model and
small official E3 reference documents.

Source archives:

- `ta1-cadets-e3-official.json.tar.gz`
- `ta1-cadets-e3-official-1.json.tar.gz`
- `ta1-cadets-e3-official-2.json.tar.gz`
- `ta1-theia-e3-official-1r.json.tar.gz`
- `ta1-theia-e3-official-3.json.tar.gz`
- `ta1-theia-e3-official-5m.json.tar.gz`
- `ta1-theia-e3-official-6r.json.tar.gz`

Pre-trained model:

- `cadets3_models.pt`

Official E3 reference files:

- `TC_Ground_Truth_Report_E3_Update.pdf`
- `cdm.pdf`
- `CDM18.avdl`
- `TCCDMDatum.avsc`
- `operational_event_log.md`

Each archive is split into chunks smaller than GitHub's 100 MB file limit.

## Reconstruct

```bash
bash reconstruct.sh /path/to/output-dir
```

The script concatenates chunks, recreates the original `.tar.gz` files, and verifies
their SHA-256 digests against `manifest.sha256`.

## Reconstruct THEIA

```bash
bash reconstruct_theia.sh /path/to/output-dir
```

The script concatenates the chunked THEIA archives, recreates the original
`.tar.gz` files, and verifies their SHA-256 digests against `theia_manifest.sha256`.

## Reconstruct Model

```bash
bash reconstruct_models.sh /path/to/output-dir
```

The script concatenates the model chunks, recreates `cadets3_models.pt`, and verifies
its SHA-256 digest against `model_manifest.sha256`.

## Official E3 Docs

The `e3_docs/` directory stores the small official E3 reference documents directly,
along with `official_docs_manifest.sha256`.

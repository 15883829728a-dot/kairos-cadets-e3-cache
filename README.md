# KAIROS CADETS E3 Cache

This repository stores chunked copies of the public DARPA TC E3 CADETS JSON archives
needed to run the KAIROS demo, plus the official CADETS pre-trained model.

Source archives:

- `ta1-cadets-e3-official.json.tar.gz`
- `ta1-cadets-e3-official-1.json.tar.gz`
- `ta1-cadets-e3-official-2.json.tar.gz`

Pre-trained model:

- `cadets3_models.pt`

Each archive is split into chunks smaller than GitHub's 100 MB file limit.

## Reconstruct

```bash
bash reconstruct.sh /path/to/output-dir
```

The script concatenates chunks, recreates the original `.tar.gz` files, and verifies
their SHA-256 digests against `manifest.sha256`.

## Reconstruct Model

```bash
bash reconstruct_models.sh /path/to/output-dir
```

The script concatenates the model chunks, recreates `cadets3_models.pt`, and verifies
its SHA-256 digest against `model_manifest.sha256`.

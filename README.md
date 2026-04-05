# KAIROS CADETS E3 Cache

This repository stores chunked copies of the public DARPA TC E3 CADETS JSON archives
needed to run the KAIROS demo.

Source archives:

- `ta1-cadets-e3-official.json.tar.gz`
- `ta1-cadets-e3-official-1.json.tar.gz`
- `ta1-cadets-e3-official-2.json.tar.gz`

Each archive is split into chunks smaller than GitHub's 100 MB file limit.

## Reconstruct

```bash
bash reconstruct.sh /path/to/output-dir
```

The script concatenates chunks, recreates the original `.tar.gz` files, and verifies
their SHA-256 digests against `manifest.sha256`.

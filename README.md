# CTFd Helm Chart

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/ctfd)](https://artifacthub.io/packages/search?repo=ctfd)

[CTFd](https://github.com/CTFd/CTFd) is a Capture The Flag framework focusing on ease of use and customizability.
It comes with everything you need to run a CTF and it's easy to customize with plugins and themes.

## Chart Details

This chart will install an instance of CTFd, with the possibility of persisting uploads using a PersistentVolumeClaim,
and persisting CTF data through an included (or optionally external) database and Redis for cache.

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ export HELM_EXPERIMENTAL_OCI=1
$ helm -n ctfd install my-release oci://ghcr.io/bman46/ctfd/ctfd
```

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm uninstall my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

Check the `values.yaml` file for configuration details.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
export HELM_EXPERIMENTAL_OCI=1
$ helm -n ctfd install my-release oci://ghcr.io/bman46/ctfd/ctfd 
```
> **Tip**: You can use the default [values.yaml](values.yaml)

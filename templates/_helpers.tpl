{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "ctfd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "ctfd.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "ctfd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create database vars
*/}}
{{- define "ctfd.DATABASE_URL" -}}
{{- if .Values.mariadb.enabled -}}
{{- printf "mysql+pymysql://%s:%s@%s-mariadb.%s/%s" .Values.mariadb.auth.username .Values.mariadb.auth.password .Release.Name .Release.Namespace .Values.mariadb.auth.database -}}
{{- else -}}
{{- .Values.externalDB.DATABASE_URL -}}
{{- end -}}
{{- end -}}

{{/*
Create redis DB vars
*/}}
{{- define "ctfd.REDIS_URL" -}}
{{- if .Values.redis.enabled -}}
{{- if .Values.redis.auth.enabled -}}
{{- printf "redis://:%s@%s-redis.%s" .Values.redis.auth.password .Release.Name .Release.Namespace -}}
{{- else -}}
{{- printf "redis://%s-redis.%s" .Release.Name .Release.Namespace -}}
{{- end -}}
{{- else -}}
{{- .Values.externalDB.REDIS_URL -}}
{{- end -}}
{{- end -}}

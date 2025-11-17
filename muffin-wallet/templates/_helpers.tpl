{{- define "identificationLabel" -}}
app: {{ .Values.app.name}}
{{- end -}}

{{- define "evnConfigMapName" -}}
name: {{ .Values.configMap.name }}-env
{{- end -}}
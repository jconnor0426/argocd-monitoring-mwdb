{{/* Generate basic labels */}}
{{- define "karton-analyzer.deployment.tpl" }}
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    io.kompose.service: {{ .Release.Name | printf "%s-%s" .Chart.Name }}
  name: {{ .Release.Name | printf "%s-%s" .Chart.Name }}
spec:
  replicas: 1
  selector:
    matchLabels:
      io.kompose.service: {{ .Release.Name | printf "%s-%s" .Chart.Name }}
  strategy:
    type: Recreate
  template:
    metadata:
      labels:
        io.kompose.service: {{ .Release.Name | printf "%s-%s" .Chart.Name }}
    spec:
      containers:
        - image: ghcr.io/jconnor0426/{{ .Release.Name | printf "%s-%s" .Chart.Name }}:{{ .Values.imageTag }}
          name: {{ .Release.Name | printf "%s-%s" .Chart.Name }}
          envFrom:
            - configMapRef: 
                name: karton-config
            - secretRef:
                name: karton-secrets
      restartPolicy: Always
{{- end -}}

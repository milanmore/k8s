kubectl get pod terminationmessage -o go-template="{{range .status.containerStatuses}}{{.lastState.terminated.message}}{{end}}"

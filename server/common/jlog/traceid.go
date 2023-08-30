package jlog

import (
	"context"
	"strings"

	"github.com/gin-gonic/gin"

	"go.opentelemetry.io/otel/trace"
	"google.golang.org/grpc/metadata"
)

const MDTraceKey = "traceparent"

func GetTraceId(ctx context.Context) (string, string) {
	if gCtx, ok := ctx.(*gin.Context); ok && gCtx.Request != nil {
		ctx = gCtx.Request.Context()
	}
	spanCtx := trace.SpanContextFromContext(ctx)
	if spanCtx.HasTraceID() {
		return spanCtx.TraceID().String(), spanCtx.SpanID().String()
	}

	md, ok := metadata.FromIncomingContext(ctx)
	if !ok {
		return "", ""
	}
	traceData := md.Get(MDTraceKey)
	// traceparent:[00-612ac58205fb69b6a428e582856bd974-ac166da08ad35396-00]
	if len(traceData) == 0 {
		return "", ""
	}
	traceParent := traceData[0]
	params := strings.Split(traceParent, "-")
	if len(params) < 3 {
		return "", ""
	}
	return params[1], params[2]

}

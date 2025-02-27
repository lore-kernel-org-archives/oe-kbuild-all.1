Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB7A22425A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 15:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740669197; cv=none; b=e3AtmAs/Z51zw5NscBXoOgL+GUXvcG2OHA3l+z38kL7j3kuFVvVkzSKudVW4uYc0pL89QRYLsp+4eNyNIoQUOUMhTB+9LtpASgMIt+17I2oAyYVvRugRG4YX1y+AYEyOh6uF8ipGf24+nDMzvP/6CXyIYrSguKGjuR9KC2SmKdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740669197; c=relaxed/simple;
	bh=vMEk5Bq2l5NCiQAsjD/Fcj4VJmiaGl688KuZCrT6Uas=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aq4xTu2AeKRvrsX3g/B0MafPceU1DsGyydhPTvumINbIsds4CBXq1FGuwTvzzOtzDdNYkCUQeoE+Tvaohlcwoigw5ZKxWhLG3S6gPxorD4Nh+DtyuuDWGaMpeF3sYe2sqCeZ+DJ6a5C4BJBYL/ltUK621pjSnkQ48qyvtpNTrKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3E7EC4CEDD;
	Thu, 27 Feb 2025 15:13:15 +0000 (UTC)
Date: Thu, 27 Feb 2025 10:13:58 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 2/4] ftrace: Add support for function argument to
 graph tracer
Message-ID: <20250227101358.1d22099f@gandalf.local.home>
In-Reply-To: <202502272155.zS8WsTRz-lkp@intel.com>
References: <20250225222653.724198940@goodmis.org>
	<202502272155.zS8WsTRz-lkp@intel.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 27 Feb 2025 22:00:05 +0800
kernel test robot <lkp@intel.com> wrote:

> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/ftrace.h:115,
>                     from kernel/trace/trace_functions_graph.c:11:
>    kernel/trace/trace_functions_graph.c: In function '__graph_entry':
> >> include/linux/ftrace_regs.h:22:9: error: implicit declaration of function 'regs_get_kernel_argument'; did you mean 'regs_get_kernel_stack_nth'? [-Wimplicit-function-declaration]  
>       22 |         regs_get_kernel_argument(&arch_ftrace_regs(fregs)->regs, n)
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~
>    kernel/trace/trace_functions_graph.c:137:42: note: in expansion of macro 'ftrace_regs_get_argument'
>      137 |                         entry->args[i] = ftrace_regs_get_argument(fregs, i);
>          |                                          ^~~~~~~~~~~~~~~~~~~~~~~~
>    kernel/trace/trace_functions_graph.c: In function 'print_graph_entry_leaf':
>    kernel/trace/trace_functions_graph.c:901:23: warning: variable 'func' set but not used [-Wunused-but-set-variable]
>      901 |         unsigned long func;
>          |                       ^~~~
> 

Thanks, looks like I need this:

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 86d828b9dc7c..cb13c88abfd6 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -2895,10 +2895,12 @@ trace_function(struct trace_array *tr, unsigned long ip, unsigned long
 	entry->ip			= ip;
 	entry->parent_ip		= parent_ip;
 
+#ifdef CONFIG_HAVE_FUNCTION_ARG_ACCESS_API
 	if (fregs) {
 		for (int i = 0; i < FTRACE_REGS_MAX_ARGS; i++)
 			entry->args[i] = ftrace_regs_get_argument(fregs, i);
 	}
+#endif
 
 	if (static_branch_unlikely(&trace_function_exports_enabled))
 		ftrace_exports(event, TRACE_EXPORT_FUNCTION);
diff --git a/kernel/trace/trace_functions_graph.c b/kernel/trace/trace_functions_graph.c
index 49fcf665cb58..71b2fb068b6b 100644
--- a/kernel/trace/trace_functions_graph.c
+++ b/kernel/trace/trace_functions_graph.c
@@ -132,10 +132,12 @@ static int __graph_entry(struct trace_array *tr, struct ftrace_graph_ent *trace,
 	entry = ring_buffer_event_data(event);
 	entry->graph_ent = *trace;
 
+#ifdef CONFIG_HAVE_FUNCTION_ARG_ACCESS_API
 	if (fregs) {
 		for (int i = 0; i < FTRACE_REGS_MAX_ARGS; i++)
 			entry->args[i] = ftrace_regs_get_argument(fregs, i);
 	}
+#endif
 
 	trace_buffer_unlock_commit_nostack(buffer, event);
 


I'll compile this tree against all the archs I'm able to compile against
before sending out v4. 

-- Steve

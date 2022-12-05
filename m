Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B1815BD
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Dec 2022 02:39:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7AD4C433C1;
	Mon,  5 Dec 2022 02:39:34 +0000 (UTC)
Date: Sun, 4 Dec 2022 21:39:29 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: kernel test robot <lkp@intel.com>, David Howells <dhowells@redhat.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] trace: Fix some checker warnings
Message-ID: <20221204213929.2edc730b@rorschach.local.home>
In-Reply-To: <20221205112236.f99c6104e988aa4f3dd89cd0@kernel.org>
References: <166992525941.1716618.13740663757583361463.stgit@warthog.procyon.org.uk>
	<202212022034.OqPXTS9u-lkp@intel.com>
	<20221205112236.f99c6104e988aa4f3dd89cd0@kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 5 Dec 2022 11:22:36 +0900
Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:

> diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> index 5cfc95a52bc3..14f18edfe5bc 100644
> --- a/kernel/trace/trace.c
> +++ b/kernel/trace/trace.c
> @@ -6572,7 +6572,8 @@ tracing_thresh_write(struct file *filp, const char __user *ubuf,
>  	return ret;
>  }
>  
> -#if defined(CONFIG_TRACER_MAX_TRACE) || defined(CONFIG_HWLAT_TRACER)
> +#if defined(CONFIG_TRACER_MAX_TRACE) || defined(CONFIG_HWLAT_TRACER) \
> +	|| defined(CONFIG_OSNOISE_TRACER)
>  

When it gets this much, we need to put it into the trace.h header and
define it. Actually, we have something that handles this too.

#if (defined(CONFIG_TRACER_MAX_TRACE) || defined(CONFIG_HWLAT_TRACER) \
        || defined(CONFIG_OSNOISE_TRACER)) && defined(CONFIG_FSNOTIFY)
#define LATENCY_FS_NOTIFY
#endif


We can add:

 #if (defined(CONFIG_TRACER_MAX_TRACE) || defined(CONFIG_HWLAT_TRACER) \
	|| defined(CONFIG_OSNOISE_TRACER)) && defined(CONFIG_FSNOTIFY)
 #define LATENCY_FS_NOTIFY
+#define USES_MAX_TRACE
 #endif

And use that instead.

-- Steve

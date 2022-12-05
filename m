Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F231192
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Dec 2022 03:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F08DC433B5;
	Mon,  5 Dec 2022 03:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670209883;
	bh=XuVmaRKXZFhhKLjZ4ujeTbBrJEN6ZUSuXY9MlbnOpZM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Kf9xpYflXEG0Ayg/QFxHVPUTn8ooVBjXm1b6qG2vZa+tQxw42sk+uHgL+4UIxBZoi
	 ljB5OA5kLheloLMQNWlnrM95egm83RNiyr8Hh0Z0aXn9TCbsdx9XzZ4h3wITGX/Wqq
	 eU2l/ud3e6O2HpqiBFkqOOSr4rRrv3ZAm4tbnUCS76B0XZRDqNErkA9Y0+4jM+pnoN
	 yWdxqwmCLupFdEi2rkVXPjIPEkGrgy3o45s0TujN80P8/Sh/MXxnjGyaBl3097G90U
	 0ydmbNA78AKvFoXrCHB9EKzxSw1ynTiYZPFlqCK0WKL7r5SzsAO9uuap2xcPB3VFd/
	 lLxPtucQw5gfw==
Date: Mon, 5 Dec 2022 12:11:19 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: kernel test robot <lkp@intel.com>, David Howells <dhowells@redhat.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] trace: Fix some checker warnings
Message-Id: <20221205121119.537fa922bbd8147b9df5ae6c@kernel.org>
In-Reply-To: <20221204213929.2edc730b@rorschach.local.home>
References: <166992525941.1716618.13740663757583361463.stgit@warthog.procyon.org.uk>
	<202212022034.OqPXTS9u-lkp@intel.com>
	<20221205112236.f99c6104e988aa4f3dd89cd0@kernel.org>
	<20221204213929.2edc730b@rorschach.local.home>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 4 Dec 2022 21:39:29 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Mon, 5 Dec 2022 11:22:36 +0900
> Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:
> 
> > diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> > index 5cfc95a52bc3..14f18edfe5bc 100644
> > --- a/kernel/trace/trace.c
> > +++ b/kernel/trace/trace.c
> > @@ -6572,7 +6572,8 @@ tracing_thresh_write(struct file *filp, const char __user *ubuf,
> >  	return ret;
> >  }
> >  
> > -#if defined(CONFIG_TRACER_MAX_TRACE) || defined(CONFIG_HWLAT_TRACER)
> > +#if defined(CONFIG_TRACER_MAX_TRACE) || defined(CONFIG_HWLAT_TRACER) \
> > +	|| defined(CONFIG_OSNOISE_TRACER)
> >  
> 
> When it gets this much, we need to put it into the trace.h header and
> define it. Actually, we have something that handles this too.
> 
> #if (defined(CONFIG_TRACER_MAX_TRACE) || defined(CONFIG_HWLAT_TRACER) \
>         || defined(CONFIG_OSNOISE_TRACER)) && defined(CONFIG_FSNOTIFY)
> #define LATENCY_FS_NOTIFY
> #endif
> 
> 
> We can add:
> 
>  #if (defined(CONFIG_TRACER_MAX_TRACE) || defined(CONFIG_HWLAT_TRACER) \
> 	|| defined(CONFIG_OSNOISE_TRACER)) && defined(CONFIG_FSNOTIFY)
>  #define LATENCY_FS_NOTIFY
> +#define USES_MAX_TRACE
>  #endif
> 
> And use that instead.

BTW, why can't HWLAT_TRACER and OSNOISE_TRACER depend on TRACER_MAX_TRACE?
I think it is better to reduce combinations of those, especially partially
enabling a feature seems a bit dangerous.

Thank you,

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

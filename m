Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F87415CE
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Dec 2022 03:33:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C25AC433D6;
	Mon,  5 Dec 2022 03:33:10 +0000 (UTC)
Date: Sun, 4 Dec 2022 22:33:08 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: kernel test robot <lkp@intel.com>, David Howells <dhowells@redhat.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] trace: Fix some checker warnings
Message-ID: <20221204223308.22e63bac@rorschach.local.home>
In-Reply-To: <20221205122948.809cb1dcbc5c0fa7ed61b415@kernel.org>
References: <166992525941.1716618.13740663757583361463.stgit@warthog.procyon.org.uk>
	<202212022034.OqPXTS9u-lkp@intel.com>
	<20221205112236.f99c6104e988aa4f3dd89cd0@kernel.org>
	<20221204213929.2edc730b@rorschach.local.home>
	<20221205122948.809cb1dcbc5c0fa7ed61b415@kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 5 Dec 2022 12:29:48 +0900
Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:

> No, that including defined(CONFIG_FSNOTIFY) :)

Ah I missed that :-)

> 
> So it must be something like 
> 
>   #if defined(CONFIG_TRACER_MAX_TRACE) || defined(CONFIG_HWLAT_TRACER) \
>           || defined(CONFIG_OSNOISE_TRACER)
>   #define USE_MAX_TRACE_OPS
>   #endif
> 
>   #if defined(USE_MAX_TRACE_OPS) && defined(CONFIG_FSNOTIFY)
>   #define LATENCY_FS_NOTIFY
>   #endif
> 
> 
> But this introduces a hidden dependency which is not tracked by
> kconfig. So I think it is better to make those kconfig (non-menu)

Right, that could be done.

> items. (and the question came up, why can't those use (depend on)
> CONFIG_TRACER_MAX_TRACE instead of introducing the USE_MAX_TRACE_OPS.)

Probably just have OSNOISE and HWLAT select TRACER_MAX_TRACE and just
use that.

-- Steve

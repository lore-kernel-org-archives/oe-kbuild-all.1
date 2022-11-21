Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CC96FA6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Nov 2022 17:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BFA5C433D6;
	Mon, 21 Nov 2022 17:40:16 +0000 (UTC)
Date: Mon, 21 Nov 2022 12:40:15 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, Linux
 Memory Management List <linux-mm@kvack.org>, Will Deacon <will@kernel.org>,
 Florent Revest <revest@chromium.org>, "Masami Hiramatsu (Google)"
 <mhiramat@kernel.org>
Subject: Re: [linux-next:master 8539/9537] include/linux/ftrace.h:126:16:
 error: implicit declaration of function 'arch_ftrace_get_regs'; did you
 mean 'ftrace_get_regs'?
Message-ID: <20221121124015.31d34642@gandalf.local.home>
In-Reply-To: <Y3u0t6eHjMbMdyUq@FVFF77S0Q05N.cambridge.arm.com>
References: <202211212249.livTPi3Y-lkp@intel.com>
	<Y3u0t6eHjMbMdyUq@FVFF77S0Q05N.cambridge.arm.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 21 Nov 2022 17:26:15 +0000
Mark Rutland <mark.rutland@arm.com> wrote:

> ... and since arm64 can be built with DYNAMIC_FTRACE=n we end up with:
> 
>   CONFIG_DYNAMIC_FTRACE=n

Is there any reason to have CONFIG_DYNAMIC_FTRACE=n and
CONFIG_FUNCTION_TRACE=y?

The only reason I keep the option to turn off DYNAMIC_FTRACE is for
debugging purposes.

That is, if you have HAVE_DYNAMIC_FTRACE, then DYNAMIC_FTRACE should be
enabled whenever it is needed by something else.

The reason for static ftrace is simply to help new architectures work their
way to having DYNAMIC_FTRACE enabled. Perhaps the solution is to get rid of
the DYNAMIC_FRACE prompt, and have it set whenever FUNCTION_TRACER is set
and HAVE_DYNAMIC_FTRACE is set.

For debugging purposes, I may add

HAVE_DEBUG_DYNAMIC_FTRACE

which brings back the prompt (for x86 only).

-- Steve


>   CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=y
>   CONFIG_DYNAMIC_FTRACE_WITH_ARGS=n
> 
> Looking at this some more, ftrace_regs_has_args() should check for
> CONFIG_DYNAMIC_FTRACE_WITH_ARGS rather than
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS, or it'll bogusly report we have args when
> CONFIG_DYNAMIC_FTRACE=n.
> 
> I'd prefer to change the core ftrace code to check for
> CONFIG_DYNAMIC_FTRACE_WITH_ARGS for consistency with that, but I'll need to
> check how that affects other architectures.

Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DED2D7468
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Nov 2022 15:13:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6FC181FB;
	Tue, 22 Nov 2022 07:13:55 -0800 (PST)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com [10.1.32.179])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E7C0F3F73D;
	Tue, 22 Nov 2022 07:13:47 -0800 (PST)
Date: Tue, 22 Nov 2022 15:13:39 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Will Deacon <will@kernel.org>, Florent Revest <revest@chromium.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: Re: [linux-next:master 8539/9537] include/linux/ftrace.h:126:16:
 error: implicit declaration of function 'arch_ftrace_get_regs'; did you mean
 'ftrace_get_regs'?
Message-ID: <Y3znIwkQQ6I1M9cF@FVFF77S0Q05N.cambridge.arm.com>
References: <202211212249.livTPi3Y-lkp@intel.com>
 <Y3u0t6eHjMbMdyUq@FVFF77S0Q05N.cambridge.arm.com>
 <20221121124015.31d34642@gandalf.local.home>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221121124015.31d34642@gandalf.local.home>

On Mon, Nov 21, 2022 at 12:40:15PM -0500, Steven Rostedt wrote:
> On Mon, 21 Nov 2022 17:26:15 +0000
> Mark Rutland <mark.rutland@arm.com> wrote:
> 
> > ... and since arm64 can be built with DYNAMIC_FTRACE=n we end up with:
> > 
> >   CONFIG_DYNAMIC_FTRACE=n
> 
> Is there any reason to have CONFIG_DYNAMIC_FTRACE=n and
> CONFIG_FUNCTION_TRACE=y?
>
> The only reason I keep the option to turn off DYNAMIC_FTRACE is for
> debugging purposes.
> 
> That is, if you have HAVE_DYNAMIC_FTRACE, then DYNAMIC_FTRACE should be
> enabled whenever it is needed by something else.
> 
> The reason for static ftrace is simply to help new architectures work their
> way to having DYNAMIC_FTRACE enabled. Perhaps the solution is to get rid of
> the DYNAMIC_FRACE prompt, and have it set whenever FUNCTION_TRACER is set
> and HAVE_DYNAMIC_FTRACE is set.

To be honest, we just didn't think to remove static ftrace; I'm happy to remove
that for arm64.

That said, I still think it makes sense to change the code to check 
CONFIG_DYNAMIC_FTRACE_WITH_ARGS rather than
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS, as mentioned below, unless you intend for
that to have an effect on static ftrace on x86?

Everywhere else with DYNAMIC_FTRACE_WITH_ARGS forces DYNAMIC_FTRACE, so it ends
up equivalent; x86 and arm64 are the only exceptions today.

Thanks,
Mark.

> 
> For debugging purposes, I may add
> 
> HAVE_DEBUG_DYNAMIC_FTRACE
> 
> which brings back the prompt (for x86 only).
> 
> -- Steve
> 
> 
> >   CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=y
> >   CONFIG_DYNAMIC_FTRACE_WITH_ARGS=n
> > 
> > Looking at this some more, ftrace_regs_has_args() should check for
> > CONFIG_DYNAMIC_FTRACE_WITH_ARGS rather than
> > CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS, or it'll bogusly report we have args when
> > CONFIG_DYNAMIC_FTRACE=n.
> > 
> > I'd prefer to change the core ftrace code to check for
> > CONFIG_DYNAMIC_FTRACE_WITH_ARGS for consistency with that, but I'll need to
> > check how that affects other architectures.

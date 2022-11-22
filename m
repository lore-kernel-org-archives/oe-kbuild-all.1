Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61EDAED0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Nov 2022 16:41:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14CFF1FB;
	Tue, 22 Nov 2022 08:41:16 -0800 (PST)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com [10.1.32.179])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D5153F73D;
	Tue, 22 Nov 2022 08:41:08 -0800 (PST)
Date: Tue, 22 Nov 2022 16:41:02 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Will Deacon <will@kernel.org>, Florent Revest <revest@chromium.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: Re: [linux-next:master 8539/9537] include/linux/ftrace.h:126:16:
 error: implicit declaration of function 'arch_ftrace_get_regs'; did you mean
 'ftrace_get_regs'?
Message-ID: <Y3z7nlH2jKxO6cjr@FVFF77S0Q05N.cambridge.arm.com>
References: <202211212249.livTPi3Y-lkp@intel.com>
 <Y3u0t6eHjMbMdyUq@FVFF77S0Q05N.cambridge.arm.com>
 <20221121124015.31d34642@gandalf.local.home>
 <Y3znIwkQQ6I1M9cF@FVFF77S0Q05N.cambridge.arm.com>
 <20221122103042.07c349ee@gandalf.local.home>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221122103042.07c349ee@gandalf.local.home>

On Tue, Nov 22, 2022 at 10:30:42AM -0500, Steven Rostedt wrote:
> On Tue, 22 Nov 2022 15:13:39 +0000
> Mark Rutland <mark.rutland@arm.com> wrote:
> 
> > To be honest, we just didn't think to remove static ftrace; I'm happy to remove
> > that for arm64.
> 
> Please do. There's no reason for it. The *only* reason I keep it around on
> x86 is to make sure it still works (for those other architectures
> developing ftrace).

I've sent that out as:

  https://lore.kernel.org/linux-arm-kernel/20221122163624.1225912-1-mark.rutland@arm.com/T/#u

... on the assumption Will can queue that as a fixup.

> > That said, I still think it makes sense to change the code to check 
> > CONFIG_DYNAMIC_FTRACE_WITH_ARGS rather than
> > CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS, as mentioned below, unless you intend for
> > that to have an effect on static ftrace on x86?
> > 
> > Everywhere else with DYNAMIC_FTRACE_WITH_ARGS forces DYNAMIC_FTRACE, so it ends
> > up equivalent; x86 and arm64 are the only exceptions today.
> 
> Yeah, looking at the code, I think it does make sense to just use
> DYNAMIC_FTRACE_WITH_ARGS, as that was created to combine the other two
> configs anyway.

Great; I'll follow up with a cleanup patch once the above has settled.

Thanks,
Mark.

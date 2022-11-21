Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD8966FA6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Nov 2022 17:26:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A47623A;
	Mon, 21 Nov 2022 09:26:29 -0800 (PST)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com [10.1.30.141])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C80593F587;
	Mon, 21 Nov 2022 09:26:21 -0800 (PST)
Date: Mon, 21 Nov 2022 17:26:15 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Will Deacon <will@kernel.org>, Florent Revest <revest@chromium.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: Re: [linux-next:master 8539/9537] include/linux/ftrace.h:126:16:
 error: implicit declaration of function 'arch_ftrace_get_regs'; did you mean
 'ftrace_get_regs'?
Message-ID: <Y3u0t6eHjMbMdyUq@FVFF77S0Q05N.cambridge.arm.com>
References: <202211212249.livTPi3Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202211212249.livTPi3Y-lkp@intel.com>

On Mon, Nov 21, 2022 at 10:55:34PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   e4cd8d3ff7f9efeb97330e5e9b99eeb2a68f5cf9
> commit: 26299b3f6ba26bfc234b73126d14bdf4dec5275a [8539/9537] ftrace: arm64: move from REGS to ARGS
> config: arm64-buildonly-randconfig-r003-20221120
> compiler: aarch64-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=26299b3f6ba26bfc234b73126d14bdf4dec5275a
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 26299b3f6ba26bfc234b73126d14bdf4dec5275a
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 prepare
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All error/warnings (new ones prefixed by >>):
> 
>    In file included from include/linux/kvm_host.h:32,
>                     from arch/arm64/kernel/asm-offsets.c:15:
>    include/linux/ftrace.h: In function 'ftrace_get_regs':
> >> include/linux/ftrace.h:126:16: error: implicit declaration of function 'arch_ftrace_get_regs'; did you mean 'ftrace_get_regs'? [-Werror=implicit-function-declaration]
>      126 |         return arch_ftrace_get_regs(fregs);
>          |                ^~~~~~~~~~~~~~~~~~~~
>          |                ftrace_get_regs
> >> include/linux/ftrace.h:126:16: warning: returning 'int' from a function with return type 'struct pt_regs *' makes pointer from integer without a cast [-Wint-conversion]
>      126 |         return arch_ftrace_get_regs(fregs);
>          |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~

Ah; this is due to some mismatched CPP guards for
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS and CONFIG_DYNAMIC_FTRACE_WITH_ARGS.

The core ftrace code provids this under guards:

  #ifndef CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS
  ...
  #endif /* CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS */

... but arm64 defines this under:

  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
  ...
  #endif

... and since arm64 can be built with DYNAMIC_FTRACE=n we end up with:

  CONFIG_DYNAMIC_FTRACE=n
  CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=y
  CONFIG_DYNAMIC_FTRACE_WITH_ARGS=n

Looking at this some more, ftrace_regs_has_args() should check for
CONFIG_DYNAMIC_FTRACE_WITH_ARGS rather than
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS, or it'll bogusly report we have args when
CONFIG_DYNAMIC_FTRACE=n.

I'd prefer to change the core ftrace code to check for
CONFIG_DYNAMIC_FTRACE_WITH_ARGS for consistency with that, but I'll need to
check how that affects other architectures.

Thanks,
Mark.

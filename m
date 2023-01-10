Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF1AFA92C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Jan 2023 16:32:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA9852F4;
	Tue, 10 Jan 2023 08:33:24 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.46.95])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 576A23F67D;
	Tue, 10 Jan 2023 08:32:42 -0800 (PST)
Date: Tue, 10 Jan 2023 16:32:39 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [mark:arm64/ftrace/per-callsite-ops 4/8]
 kernel/trace/ftrace.c:2505:1: error: conflicting types for
 'ftrace_find_unique_ops'; have 'struct ftrace_ops *(struct dyn_ftrace *)'
Message-ID: <Y72TJ3qQuvx3gIOi@FVFF77S0Q05N>
References: <202301100944.E0mV3kSO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202301100944.E0mV3kSO-lkp@intel.com>

On Tue, Jan 10, 2023 at 09:04:40AM +0800, kernel test robot wrote:
> Hi Mark,
> 
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/ftrace/per-callsite-ops
> head:   8f064db83949d4f90fccbda17ef5980695c789df
> commit: f589df82765a8a167c3ee4385fe2490c934f491f [4/8] ftrace: Add DYNAMIC_FTRACE_WITH_CALL_OPS
> config: x86_64-rhel-8.3-func
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce (this is a W=1 build):
>         # https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=f589df82765a8a167c3ee4385fe2490c934f491f
>         git remote add mark https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git
>         git fetch --no-tags mark arm64/ftrace/per-callsite-ops
>         git checkout f589df82765a8a167c3ee4385fe2490c934f491f
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 O=build_dir ARCH=x86_64 olddefconfig
>         make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from kernel/trace/ftrace.c:29:
>    include/linux/ftrace.h:62:50: warning: 'struct dyn_ftrace' declared inside parameter list will not be visible outside of this definition or declaration
>       62 | struct ftrace_ops *ftrace_find_unique_ops(struct dyn_ftrace *rec);
>          |                                                  ^~~~~~~~~~

I think this is the fundamental issue here, since the below two cases:

> >> kernel/trace/ftrace.c:2505:1: error: conflicting types for 'ftrace_find_unique_ops'; have 'struct ftrace_ops *(struct dyn_ftrace *)'
>     2505 | ftrace_find_unique_ops(struct dyn_ftrace *rec)
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    In file included from kernel/trace/ftrace.c:29:
>    include/linux/ftrace.h:62:20: note: previous declaration of 'ftrace_find_unique_ops' with type 'struct ftrace_ops *(struct dyn_ftrace *)'
>       62 | struct ftrace_ops *ftrace_find_unique_ops(struct dyn_ftrace *rec);
>          |                    ^~~~~~~~~~~~~~~~~~~~~~

... look identical.

I'll move the definition up earlier in <linux/ftrace.h>

Thanks,
Mark.

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD0233E7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Sep 2025 12:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756817353; cv=none; b=WlocPBIMgNFq7Qg/kZ+6xueqjDCGKVGXSzoEd/TpNker3UjIG05bhRqo61uFKykxqoPJl+nhMuC8s5Qp2+ApXavcxoayLySwTaiHCDsob553ZPr5P/rM87ufCI+jABsLK9ft4/ipZmWKe9oeA+P5f89LdLdJQT40QxstGXRUyoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756817353; c=relaxed/simple;
	bh=MANEMEIsqvfPxs05gWEHBaZarTWdylHhgcwlO1xvNYU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=gweM9cLf+1iEwLTJdwgz18+mK1/AY8HzdH9TkHEdl7h5sI9JQyPAY0tB/a1mPTiweEphgRhuLVMzlZWT7Z2Z/MT2b1uEChny9MLG4FKbw5O19rO4cnkWl1eS53tiV/O6BVNAfb8TcZQrbS2uhqu+t/6tUt6dSBQ1/5GrQzH4DvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qIT9Nm+f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qIT9Nm+f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB17DC4CEED;
	Tue,  2 Sep 2025 12:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756817352;
	bh=MANEMEIsqvfPxs05gWEHBaZarTWdylHhgcwlO1xvNYU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qIT9Nm+fXe7TcrUQ77ofsebYbG9Q8MBMsntkduyRYWNKFmDX3g8XeOjMAYfFAmgkV
	 2yOnQffF2yrL0dACqa4BeJHYLwlfQJtDJOc1h3dqGLSx9Og0xgjSa//MDIq9wxTC6R
	 9l2QxVDt+8D7x9183M39SUZ2aL6nuaS+2LsAAZpiLt4CUcLOlGYz5GdKI5+4oodxqZ
	 kPAC8gCHnSCeF7rKTl96cs8BS+ROr7lIV7AHWe1ah2oLh9blKU+gLTtFgRPeL8B3gg
	 a5ihvMEPviJ6E6aC7ZHecI40K0xUJcH7ye40ZVjTh4SyUXpS+cd23ur/K/VsFuAw0q
	 +dA+MUKAXCdxA==
Date: Tue, 2 Sep 2025 21:49:10 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 4/6] tracing: wprobe: Add wprobe event trigger
Message-Id: <20250902214910.1e608511f1fae62408c23c52@kernel.org>
In-Reply-To: <202509021922.cDLHk0GU-lkp@intel.com>
References: <175673791934.478080.13510585438052558733.stgit@devnote2>
	<202509021922.cDLHk0GU-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 2 Sep 2025 19:34:30 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi Masami,
> 
> [This is a private test report for your RFC patch.]
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on trace/for-next]
> [also build test WARNING on tip/x86/core perf-tools-next/perf-tools-next tip/perf/core perf-tools/perf-tools peterz-queue/sched/core linus/master v6.17-rc4 next-20250902]
> [cannot apply to acme/perf/core]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Masami-Hiramatsu-Google/tracing-wprobe-Add-watchpoint-probe-event-based-on-hardware-breakpoint/20250901-225207
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
> patch link:    https://lore.kernel.org/r/175673791934.478080.13510585438052558733.stgit%40devnote2
> patch subject: [RFC PATCH 4/6] tracing: wprobe: Add wprobe event trigger
> config: arm64-randconfig-001-20250902 (https://download.01.org/0day-ci/archive/20250902/202509021922.cDLHk0GU-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509021922.cDLHk0GU-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509021922.cDLHk0GU-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    kernel/trace/trace_wprobe.c: In function '__trace_wprobe_create':
>    kernel/trace/trace_wprobe.c:573:2: error: cleanup argument not a function
>      const char *tplog __free(trace_probe_log_clear) = NULL;
>      ^~~~~
>    kernel/trace/trace_wprobe.c:585:8: error: void value not ignored as it ought to be
>      tplog = trace_probe_log_init("wprobe", argc, argv);
>            ^
>    kernel/trace/trace_wprobe.c:573:14: warning: variable 'tplog' set but not used [-Wunused-but-set-variable]
>      const char *tplog __free(trace_probe_log_clear) = NULL;
>                  ^~~~~
>    At top level:
> >> kernel/trace/trace_wprobe.c:60:27: warning: 'trace_wprobe_local_perf' defined but not used [-Wunused-function]
>     static struct perf_event *trace_wprobe_local_perf(struct trace_wprobe *tw)
>                               ^~~~~~~~~~~~~~~~~~~~~~~

Indeed, CONFIG_WPROBE_TRIGGERS=n, it is not used. This is a real problem
in this version.

Thanks.

> 
> 
> vim +/trace_wprobe_local_perf +60 kernel/trace/trace_wprobe.c
> 
>     58	
>     59	/* This must be called under cpu locked (e.g. preempt off, irq off) */
>   > 60	static struct perf_event *trace_wprobe_local_perf(struct trace_wprobe *tw)
>     61	{
>     62		return *this_cpu_ptr(tw->bp_event);
>     63	}
>     64	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

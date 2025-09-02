Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888DD247298
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Sep 2025 11:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756812912; cv=none; b=N8MzSBiNe04e1YfeDUp86yE7YwTANr3s2xWIaCkRDhgMnao5XjF2EQFtOwi/7qhX5SPVHmc7LvguzLmKvG6dz5AlbmsDpGUM1RlxcK+L2nvcA92ITGSOqisByBlI6oFRBIxTHOtTKKyKQ88yo+XtntKnje25M+0E9tQiaGr30RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756812912; c=relaxed/simple;
	bh=DWZZHw0s0ZU+2fa/TZRR2bg5Wp+8a4qs93yTu6ArKbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jocz4cL1xyfuKx0TenpqndH7Wy0al8dAg3wf8gJuMVUIPk9kIU8vGLzytY5rKjPJeeU82PF5JItpX5IxXYFUldmAkTY50pEbGPvRM/K0cD7I0RNek2X93zQMzPgDr7Hf5nmscWzqShy+sIe5G1SdAuEEnqtDLuCJbtpMWsUqGmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eOwA3rH3; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eOwA3rH3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756812910; x=1788348910;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DWZZHw0s0ZU+2fa/TZRR2bg5Wp+8a4qs93yTu6ArKbM=;
  b=eOwA3rH3Z7p8Abr9O0W8OI5PhkoRFFcqDyQVETFYveK6fUHylZzGF/n6
   wE63Kka35yCN3MzRM8Y/3Ycdgd/oq4vUFwZztaNib0dp02WursAesOpQx
   mkmj5D1aK2oxh5nyNTQnDDWFeebrDQhBdPJl/H1RIukgxbDKKgRY8b/Xq
   jGxTOze5tzPCDLUuYqgrMMH/JRozlVoo6Nurzi2jkGI+8rG6g6Y2xXRN5
   B2MV+pgLvBnraYzo1lXUD+FuLWT7OkBLzgEF3AoJDzErnVmX3QA2eAaGj
   Y+CMbrgNrVzlKi1wcd9/h/HwOs5bZVv8gmGN6tBOoiw7jh9R5MDQJH1W7
   g==;
X-CSE-ConnectionGUID: F0VR//0JRESjhyFHabAZ4Q==
X-CSE-MsgGUID: xtz40kaPTyqHk7MzEuQtJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62912317"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62912317"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 04:35:10 -0700
X-CSE-ConnectionGUID: Lnka/R+9RR6hxD5fOVWNMA==
X-CSE-MsgGUID: 6EqmavS2REambavg6P+smw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="175389318"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 02 Sep 2025 04:35:09 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utPI2-0001uc-1z;
	Tue, 02 Sep 2025 11:35:06 +0000
Date: Tue, 2 Sep 2025 19:34:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 4/6] tracing: wprobe: Add wprobe event trigger
Message-ID: <202509021922.cDLHk0GU-lkp@intel.com>
References: <175673791934.478080.13510585438052558733.stgit@devnote2>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175673791934.478080.13510585438052558733.stgit@devnote2>

Hi Masami,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on trace/for-next]
[also build test WARNING on tip/x86/core perf-tools-next/perf-tools-next tip/perf/core perf-tools/perf-tools peterz-queue/sched/core linus/master v6.17-rc4 next-20250902]
[cannot apply to acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Masami-Hiramatsu-Google/tracing-wprobe-Add-watchpoint-probe-event-based-on-hardware-breakpoint/20250901-225207
base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
patch link:    https://lore.kernel.org/r/175673791934.478080.13510585438052558733.stgit%40devnote2
patch subject: [RFC PATCH 4/6] tracing: wprobe: Add wprobe event trigger
config: arm64-randconfig-001-20250902 (https://download.01.org/0day-ci/archive/20250902/202509021922.cDLHk0GU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509021922.cDLHk0GU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509021922.cDLHk0GU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/trace_wprobe.c: In function '__trace_wprobe_create':
   kernel/trace/trace_wprobe.c:573:2: error: cleanup argument not a function
     const char *tplog __free(trace_probe_log_clear) = NULL;
     ^~~~~
   kernel/trace/trace_wprobe.c:585:8: error: void value not ignored as it ought to be
     tplog = trace_probe_log_init("wprobe", argc, argv);
           ^
   kernel/trace/trace_wprobe.c:573:14: warning: variable 'tplog' set but not used [-Wunused-but-set-variable]
     const char *tplog __free(trace_probe_log_clear) = NULL;
                 ^~~~~
   At top level:
>> kernel/trace/trace_wprobe.c:60:27: warning: 'trace_wprobe_local_perf' defined but not used [-Wunused-function]
    static struct perf_event *trace_wprobe_local_perf(struct trace_wprobe *tw)
                              ^~~~~~~~~~~~~~~~~~~~~~~


vim +/trace_wprobe_local_perf +60 kernel/trace/trace_wprobe.c

    58	
    59	/* This must be called under cpu locked (e.g. preempt off, irq off) */
  > 60	static struct perf_event *trace_wprobe_local_perf(struct trace_wprobe *tw)
    61	{
    62		return *this_cpu_ptr(tw->bp_event);
    63	}
    64	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

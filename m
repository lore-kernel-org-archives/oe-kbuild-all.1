Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB351FD3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 08:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692950664; x=1724486664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1MR3Ida9srmpE4iWDYKy46a1z+3MDx+0IdT6gLqLGtM=;
  b=VYr0Zxtm53skMgQtWr9lhEh01zhxEMfIBZHK/1kft86L9TxRLBHIQ+JV
   QgnLcO08w8safDmHAgW/sYJd62LZ7tsRzmg+Xf4IeiMcID2bUACuP9JSr
   6KXAHPYlitjvyn2aUjAxBjVcyTtmXzA8KUzRO4RR6yMvTPoOaXBWFRk22
   6SlwPqY3rRnJwnDxxO+hfPKXpVOEympGNUp2DX1VgRHJ0gf/dB7TIHJVZ
   X2agXZyXjoA8T+7aQVpo0uXm7P18nbpWMbAmniSz+3fqYmh4yAs3ZqSk0
   sMxy9ZntGS1/d26YXJnE7QFuVITXEGtsJQiVSzFHmvfJliccrd/KT/1M5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="378445278"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="378445278"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 01:04:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="737396603"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="737396603"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 25 Aug 2023 01:04:10 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZRnd-0003KM-2i;
	Fri, 25 Aug 2023 08:04:09 +0000
Date: Fri, 25 Aug 2023 16:03:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/missed_stats 1/12] kernel/bpf/trampoline.c:824:21:
 error: 'BPF_PROG_NO_START_TIME' undeclared
Message-ID: <202308251522.yUyaVXBf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/missed_stats
head:   e594b26a49255791ab295eabb5010c8cede34a5e
commit: 2808857ed76e5b13ceedcf55e13c9280f791fc33 [1/12] bpf: Move update_prog_stats to syscall object
config: arm64-randconfig-r025-20230825 (https://download.01.org/0day-ci/archive/20230825/202308251522.yUyaVXBf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308251522.yUyaVXBf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308251522.yUyaVXBf-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/trampoline.c: In function 'bpf_prog_start_time':
>> kernel/bpf/trampoline.c:824:21: error: 'BPF_PROG_NO_START_TIME' undeclared (first use in this function)
     824 |         u64 start = BPF_PROG_NO_START_TIME;
         |                     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:824:21: note: each undeclared identifier is reported only once for each function it appears in
   kernel/bpf/trampoline.c: In function '__bpf_prog_enter_lsm_cgroup':
   kernel/bpf/trampoline.c:886:16: error: 'BPF_PROG_NO_START_TIME' undeclared (first use in this function)
     886 |         return BPF_PROG_NO_START_TIME;
         |                ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:887:1: error: control reaches end of non-void function [-Werror=return-type]
     887 | }
         | ^
   cc1: some warnings being treated as errors


vim +/BPF_PROG_NO_START_TIME +824 kernel/bpf/trampoline.c

   821	
   822	static __always_inline u64 notrace bpf_prog_start_time(void)
   823	{
 > 824		u64 start = BPF_PROG_NO_START_TIME;
   825	
   826		if (static_branch_unlikely(&bpf_stats_enabled_key)) {
   827			start = sched_clock();
   828			if (unlikely(!start))
   829				start = BPF_PROG_NO_START_TIME;
   830		}
   831		return start;
   832	}
   833	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

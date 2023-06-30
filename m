Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD78E54E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jun 2023 14:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688134771; x=1719670771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nzEOmTwwWos4CESaosl2lpCDOz770dpm2fHgbWQ3uYE=;
  b=g+6m/AErZ2CBwoH2OWPKrk1cwyHgAl8cY5q/9TrjdzWbOfi/ODYdJ5oq
   pP/+q7EkLFs5uYN6FZOFKDtL9mFRrV1tElwnPARfqRXR7kZiXTAXEMlVU
   gvkJXWGX1YZ/jvgg6gzEChTncvmdk1nhuxaIESii0xt0j/iFnvOWHyWKR
   eOOcoO9e0yBIQagJkxMpkmYACBfQq4GKY7omPbLlNc7vwKDv3k4hqFDRI
   iT3izNci50bGFV2KogxS6akorOSuXAUxGx7TekezTMNoP90c55q8aaPK0
   f7xwq5SUdSTU5c+ReBTs8LSTHZHsx2SVvVHVasDf2g/ZhflLB5xALPZjx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="426089545"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="426089545"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 07:19:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="1048249647"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="1048249647"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 30 Jun 2023 07:19:29 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFEy8-000F1x-0r;
	Fri, 30 Jun 2023 14:19:28 +0000
Date: Fri, 30 Jun 2023 22:19:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/missed_stats_1 12/18]
 kernel/bpf/trampoline.c:824:21: error: 'BPF_PROG_NO_START_TIME' undeclared
Message-ID: <202306302208.ZEO39VHG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/missed_stats_1
head:   a837fd7637ed1df97802aa01907d6566beec7f29
commit: e0f2eb83cc0baf2531a2b14a1e73702434cd798e [12/18] bpf: Move update_prog_stats to syscall.c object
config: sparc64-randconfig-r004-20230630 (https://download.01.org/0day-ci/archive/20230630/202306302208.ZEO39VHG-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306302208.ZEO39VHG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306302208.ZEO39VHG-lkp@intel.com/

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
--
   In file included from include/linux/filter.h:9,
                    from arch/sparc/kernel/sys_sparc32.c:29:
>> include/linux/bpf.h:2608:13: error: 'bpf_prog_update_prog_stats' defined but not used [-Werror=unused-function]
    2608 | static void bpf_prog_update_prog_stats(struct bpf_prog *prog,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


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

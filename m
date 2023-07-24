Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F185A44
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jul 2023 02:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690167394; x=1721703394;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R3176xjpkJfIlyvDc+9mjVAYXUSeyxgQCuZSigS9f7I=;
  b=iFzd8NJPyNfgd+xkFILWEq+i0/4AhhHPGwT0oHsIwMt/Ha9LEpJ2Sbm8
   DnEuCLJP0cXMjmMLawaQo6I8+FB74NCp0UfTpeFUqaNQXNOCdXLrgly02
   tRhNzAes72/s1sUH2oLDy1r1PMo4YuCM1A4qqcmXOam21PubFUMzwuQ5a
   qylP+YCqpYcTO//2jODteRPoE6KeBMuJx5ijWBy3CSqtHH7L/cH2ZCsKG
   hF60HdPdDfZpGwGcUCIGt0z6PZ0gqgZqWnuY9eNFGyg0h1LZdDFkDni3+
   vyR9OX3854YOUaWSr/A7qeYB7bTZj0YCHjMYJ0j8jsBlhOSqbV2KBKAX8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="352229431"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="352229431"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 19:56:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="899352036"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="899352036"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 23 Jul 2023 19:56:32 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNlkJ-0009RR-0k;
	Mon, 24 Jul 2023 02:56:28 +0000
Date: Mon, 24 Jul 2023 10:56:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/missed_stats_3 1/7] kernel/bpf/trampoline.c:824:21:
 error: 'BPF_PROG_NO_START_TIME' undeclared
Message-ID: <202307241059.MyWOQ7yh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/missed_stats_3
head:   903afc5b7a9fa7c9bff7f7dc86d955b637fb1fd9
commit: 04fef13e9772949ac2d598ed21fd26c6e43746ac [1/7] bpf: Move update_prog_stats to syscall object
config: loongarch-randconfig-r091-20230723 (https://download.01.org/0day-ci/archive/20230724/202307241059.MyWOQ7yh-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230724/202307241059.MyWOQ7yh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307241059.MyWOQ7yh-lkp@intel.com/

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

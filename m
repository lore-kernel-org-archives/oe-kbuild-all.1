Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F30CA58
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 12:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693054675; x=1724590675;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=050b9mD+Z4GRkWwOWeW+tcmz0gRJ1Go2R01hHBpVfAw=;
  b=H0c5JYGWyRnsi7FI/l3VJva/pMtzionCYknRcg66bQ25/FMBSD171yOa
   yu/E2PO61P3j2swTmHCuh62SOyCFX9Ybrlk8eo/U2tGGVm+32HS/1ZVqx
   Fih0UWEZM9A/t35MR3lsLzsNllUoSxvKdyAYnIAy2M/GEZtySe+k6J2z6
   COr1IzciojfjdD2kS9B1vSYPaG1PJ9wJ+r+qVfa+ib1BDi64meF4o103c
   FKm0CVtd/hIKkqiQqotJ8YYP+r3U8HhTlH1t0VmkaOdADU4qTYJFsypn/
   jRdEvthhtWZT0XQ9Q+6MxShBotFlUos6/22uzwzaYsqXbW8Xw5AcQM16U
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="355203911"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="355203911"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 05:57:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="827855449"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="827855449"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Aug 2023 05:57:54 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZsrR-0004ip-1U;
	Sat, 26 Aug 2023 12:57:53 +0000
Date: Sat, 26 Aug 2023 20:56:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/missed_stats_3 1/7] include/linux/bpf.h:2650:13:
 warning: 'bpf_prog_update_prog_stats' defined but not used
Message-ID: <202308262036.ajA38Yei-lkp@intel.com>
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
commit: 3d25b22ba2534fedca5325362b88adab8ac6c651 [1/7] bpf: Move update_prog_stats to syscall object
config: i386-buildonly-randconfig-r004-20230720 (https://download.01.org/0day-ci/archive/20230826/202308262036.ajA38Yei-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308262036.ajA38Yei-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308262036.ajA38Yei-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/filter.h:9,
                    from kernel/sysctl.c:35:
>> include/linux/bpf.h:2650:13: warning: 'bpf_prog_update_prog_stats' defined but not used [-Wunused-function]
    2650 | static void bpf_prog_update_prog_stats(struct bpf_prog *prog,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/bpf_prog_update_prog_stats +2650 include/linux/bpf.h

  2649	
> 2650	static void bpf_prog_update_prog_stats(struct bpf_prog *prog,
  2651					       u64 start)
  2652	{
  2653	}
  2654	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3A4CA51
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 09:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kxiU6GX7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699004062; x=1730540062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=690r+vzF34AfZaREjSQcr5YGlKz7NHYUsxN8NB8grsI=;
  b=kxiU6GX7t6D+iU5AAC81xTJAIlGspcX117AinEwV6mcsGeZ/4V8ABtlq
   YtY7KnwTM/SY5C08L/9Q326JtAKbp/AWA+5SSs0xHGIatSUZiWSjuWJFg
   xrC7TU4s+azzGrbY40T3/4Puo7ADpSU3qBRwozVdX7c79iiXgdEqVK0i6
   tzQNmm3fR9pOETmSnpA7f186eI37Xd9m7BffZwvjCqNdhIBXNF6uY6jrD
   cBvH/e5SU3QxSJg2GWkEt725mYbxMENH+a3ZZ8Awi7dUa2Z2zEF1NEUBy
   LOBA/t98zi0qep7Km5tcHZqmCdlkdLfCSmoNr54BYxNdd5yn+gIz8p+I4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="368260160"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="368260160"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 02:34:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="827430385"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="827430385"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 Nov 2023 02:34:12 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyqZ8-0002Q2-0T;
	Fri, 03 Nov 2023 09:34:10 +0000
Date: Fri, 3 Nov 2023 17:33:30 +0800
From: kernel test robot <lkp@intel.com>
To: Sandipan Das <sandipan.das@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>
Subject: arch/x86/events/amd/uncore.c:941:52: warning: '%d' directive output
 may be truncated writing between 1 and 10 bytes into a region of size 8
Message-ID: <202311031741.yEh7UtVb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f6f76a6a29f36d2f3e4510d0bde5046672f6924
commit: 25e56847821f7375bdee7dae1027c7917d07ce4b perf/x86/amd/uncore: Add memory controller support
date:   4 weeks ago
config: x86_64-randconfig-001-20231101 (https://download.01.org/0day-ci/archive/20231103/202311031741.yEh7UtVb-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311031741.yEh7UtVb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311031741.yEh7UtVb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/events/amd/uncore.c: In function 'amd_uncore_umc_ctx_init':
>> arch/x86/events/amd/uncore.c:941:52: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 8 [-Wformat-truncation=]
       snprintf(pmu->name, sizeof(pmu->name), "amd_umc_%d", index);
                                                       ^~
   arch/x86/events/amd/uncore.c:941:43: note: directive argument in the range [0, 2147483647]
       snprintf(pmu->name, sizeof(pmu->name), "amd_umc_%d", index);
                                              ^~~~~~~~~~~~
   arch/x86/events/amd/uncore.c:941:4: note: 'snprintf' output between 10 and 19 bytes into a destination of size 16
       snprintf(pmu->name, sizeof(pmu->name), "amd_umc_%d", index);
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/events/amd/uncore.c: At top level:
   cc1: warning: unrecognized command line option '-Wno-attribute-alias'


vim +941 arch/x86/events/amd/uncore.c

   900	
   901	static
   902	int amd_uncore_umc_ctx_init(struct amd_uncore *uncore, unsigned int cpu)
   903	{
   904		DECLARE_BITMAP(gmask, UNCORE_GROUP_MAX) = { 0 };
   905		u8 group_num_pmus[UNCORE_GROUP_MAX] = { 0 };
   906		u8 group_num_pmcs[UNCORE_GROUP_MAX] = { 0 };
   907		union amd_uncore_info info;
   908		struct amd_uncore_pmu *pmu;
   909		int index = 0, gid, i;
   910	
   911		if (pmu_version < 2)
   912			return 0;
   913	
   914		/* Run just once */
   915		if (uncore->init_done)
   916			return amd_uncore_ctx_init(uncore, cpu);
   917	
   918		/* Find unique groups */
   919		for_each_online_cpu(i) {
   920			info = *per_cpu_ptr(uncore->info, i);
   921			gid = info.split.gid;
   922			if (test_bit(gid, gmask))
   923				continue;
   924	
   925			__set_bit(gid, gmask);
   926			group_num_pmus[gid] = hweight32(info.split.aux_data);
   927			group_num_pmcs[gid] = info.split.num_pmcs;
   928			uncore->num_pmus += group_num_pmus[gid];
   929		}
   930	
   931		uncore->pmus = kzalloc(sizeof(*uncore->pmus) * uncore->num_pmus,
   932				       GFP_KERNEL);
   933		if (!uncore->pmus) {
   934			uncore->num_pmus = 0;
   935			goto done;
   936		}
   937	
   938		for_each_set_bit(gid, gmask, UNCORE_GROUP_MAX) {
   939			for (i = 0; i < group_num_pmus[gid]; i++) {
   940				pmu = &uncore->pmus[index];
 > 941				snprintf(pmu->name, sizeof(pmu->name), "amd_umc_%d", index);
   942				pmu->num_counters = group_num_pmcs[gid] / group_num_pmus[gid];
   943				pmu->msr_base = MSR_F19H_UMC_PERF_CTL + i * pmu->num_counters * 2;
   944				pmu->rdpmc_base = -1;
   945				pmu->group = gid;
   946	
   947				pmu->ctx = alloc_percpu(struct amd_uncore_ctx *);
   948				if (!pmu->ctx)
   949					goto done;
   950	
   951				pmu->pmu = (struct pmu) {
   952					.task_ctx_nr	= perf_invalid_context,
   953					.attr_groups	= amd_uncore_umc_attr_groups,
   954					.name		= pmu->name,
   955					.event_init	= amd_uncore_umc_event_init,
   956					.add		= amd_uncore_add,
   957					.del		= amd_uncore_del,
   958					.start		= amd_uncore_umc_start,
   959					.stop		= amd_uncore_stop,
   960					.read		= amd_uncore_read,
   961					.capabilities	= PERF_PMU_CAP_NO_EXCLUDE | PERF_PMU_CAP_NO_INTERRUPT,
   962					.module		= THIS_MODULE,
   963				};
   964	
   965				if (perf_pmu_register(&pmu->pmu, pmu->pmu.name, -1)) {
   966					free_percpu(pmu->ctx);
   967					pmu->ctx = NULL;
   968					goto done;
   969				}
   970	
   971				pr_info("%d %s counters detected\n", pmu->num_counters,
   972					pmu->pmu.name);
   973	
   974				index++;
   975			}
   976		}
   977	
   978	done:
   979		uncore->num_pmus = index;
   980		uncore->init_done = true;
   981	
   982		return amd_uncore_ctx_init(uncore, cpu);
   983	}
   984	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

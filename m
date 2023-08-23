Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1929C131
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 12:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692793980; x=1724329980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I3empSyXnpZloaFDiStHJ5B/+45Qa5xTBmz6es7Rr5Q=;
  b=jB+PT9p62n11pXn+mKBU7kqKdccYvZFlblADCLOqgnqAYkmXdcmG+sF4
   X/0EWEqyu3nQQZvTjqq+/562fQcatdTrCJtSdLRGdxxInvW+kkyLeJpCW
   2TZE2vQZ77skAz709R8RSqV0m213JVAcZe13SW7mO4m3ylo+LD7xb0z86
   bnrkU6bhkZYl4dae0+MIZlhV6w5dtcvMb3W4Xcxp16pyZ26y7UmGpicpl
   rP48JPyXfNXtAgj5VU8gZojvzSobfJL8SpxrkGPkObfKYumscvNOkXkZj
   o26qb3IlKJl6CJXXC7uCo9nGmsam1wk279AxV/KqElj8iQmxGDlk5SI7f
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="359132936"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="359132936"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 05:32:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="730204126"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="730204126"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 23 Aug 2023 05:32:58 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYn2f-0001Bo-0U;
	Wed, 23 Aug 2023 12:32:57 +0000
Date: Wed, 23 Aug 2023 20:32:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/2] kernel/sched/core.c:4797:6:
 warning: no previous declaration for '__balance_callbacks'
Message-ID: <202308232039.iAc5K2Az-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   10800b39da4031ac30a74e28be12b1d7c8860b32
commit: a2f552f49c9084dcc48b2066888d06a324e34b98 [1/2] ANDROID: GKI: vendor code needs __balance_callbacks access
config: i386-randconfig-062-20230822 (https://download.01.org/0day-ci/archive/20230823/202308232039.iAc5K2Az-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308232039.iAc5K2Az-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308232039.iAc5K2Az-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/core.c:3495:6: warning: no previous declaration for 'sched_set_stop_task' [-Wmissing-declarations]
    void sched_set_stop_task(int cpu, struct task_struct *stop)
         ^~~~~~~~~~~~~~~~~~~
>> kernel/sched/core.c:4797:6: warning: no previous declaration for '__balance_callbacks' [-Wmissing-declarations]
    void __balance_callbacks(struct rq *rq)
         ^~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_HAS_NONLEAF_PMD_YOUNG
   Depends on [n]: PGTABLE_LEVELS [=2]>2
   Selected by [y]:
   - X86 [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]


vim +/__balance_callbacks +4797 kernel/sched/core.c

  4796	
> 4797	void __balance_callbacks(struct rq *rq)
  4798	{
  4799		do_balance_callbacks(rq, __splice_balance_callbacks(rq, false));
  4800	}
  4801	EXPORT_SYMBOL_GPL(__balance_callbacks);
  4802	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43A4C2F7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 12:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693052606; x=1724588606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A9+oDFMcuFRFdWh//PApHpAvGQzwfBypXe+liHZ3O1c=;
  b=bem9hE0g0lz7QCTxCpJqKY/n41gxWzzY74Br0t7R9Ab9p1/PIf8hn0K+
   OuJugM2pzAYzryV7167VtZ4Ycs2efovBllD+tMi82kKK5Ai2oPyuttR7n
   1YGqXVCxMrkr4Lcb7iYx9/Oeh7kk2DIKrMkN430TQIVI3x4ya77MpDkJC
   paeRMAnT0Io2Z7Rru96ZcRcO4843lbbvrS0AIj0u39DDrD+KWDxiuvs/K
   gfjOZYBBuq/j1U6nmtNwoGm+cs+PIAwT87DFJT5kLoIi3vt4du8sweSpx
   6qIKA1l1KtDXPOfoUjEOS4TGqx1zsqmpBp7tZwHxLZr2WMr6ap0egrGRg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="355201358"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="355201358"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 05:23:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="807806360"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="807806360"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 26 Aug 2023 05:23:24 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZsK3-0004fv-3A;
	Sat, 26 Aug 2023 12:23:23 +0000
Date: Sat, 26 Aug 2023 20:23:18 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:sched-setscheduler-hide 6/9]
 drivers/cpufreq/cppc_cpufreq.c:242:15: error: too few arguments to function
 'sched_set_dl'
Message-ID: <202308262003.40lCLvIm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux sched-setscheduler-hide
head:   e586c67baa1c537a793f135e324cc56df2b6585b
commit: d70e8ba918c698ee2b48006d483001b8a345ad62 [6/9] cpufreq: cppc: Convert to use sched_set_dl()
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230826/202308262003.40lCLvIm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308262003.40lCLvIm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308262003.40lCLvIm-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/cpufreq/cppc_cpufreq.c: In function 'cppc_freq_invariance_init':
>> drivers/cpufreq/cppc_cpufreq.c:242:15: error: too few arguments to function 'sched_set_dl'
     242 |         ret = sched_set_dl(kworker_fie->task);
         |               ^~~~~~~~~~~~
   In file included from arch/arm64/include/asm/compat.h:28,
                    from arch/arm64/include/asm/stat.h:13,
                    from include/linux/stat.h:6,
                    from include/linux/module.h:13,
                    from drivers/cpufreq/cppc_cpufreq.c:15:
   include/linux/sched.h:1920:13: note: declared here
    1920 | extern void sched_set_dl(struct task_struct *p, unsigned long long flags);
         |             ^~~~~~~~~~~~


vim +/sched_set_dl +242 drivers/cpufreq/cppc_cpufreq.c

   222	
   223	static void __init cppc_freq_invariance_init(void)
   224	{
   225		int ret;
   226	
   227		if (fie_disabled != FIE_ENABLED && fie_disabled != FIE_DISABLED) {
   228			fie_disabled = FIE_ENABLED;
   229			if (cppc_perf_ctrs_in_pcc()) {
   230				pr_info("FIE not enabled on systems with registers in PCC\n");
   231				fie_disabled = FIE_DISABLED;
   232			}
   233		}
   234	
   235		if (fie_disabled)
   236			return;
   237	
   238		kworker_fie = kthread_create_worker(0, "cppc_fie");
   239		if (IS_ERR(kworker_fie))
   240			return;
   241	
 > 242		ret = sched_set_dl(kworker_fie->task);
   243		if (ret) {
   244			pr_warn("%s: failed to set SCHED_DEADLINE: %d\n", __func__,
   245				ret);
   246			kthread_destroy_worker(kworker_fie);
   247			return;
   248		}
   249	}
   250	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

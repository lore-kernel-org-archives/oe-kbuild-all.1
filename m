Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55D3D513
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 14:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694010089; x=1725546089;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9bRNE6Ud093lBU+0wvty7BjyuJ9N2r33eSY+wPj50nw=;
  b=euyBMehdSb4G8bLpxgeVWDNPTHTmQcNZx1eGmwdt1uceZmbC3ElBGS9S
   6sX5BgA0XS8Svfk3s5YVNrmXqOzIZ8iryf2He71MePsQMdMKuVq2mS09F
   0sB+KoOz9ezvH5NIa7WX7gzsw9szaNi5G6EAfKU7oRcRVjK5eK0URYLFe
   MjtfOpN3KZk7ACra8ig0mV234Q5kos1mpPvUnPCjuGrtnUYfsn3CHezi8
   Szhsw0b1S6gcyxIWoUklVz7QizCHHXx63bXRIxi1uk+P61l4feAyURW7m
   7l7MuxWtzJH881NQlTN9DZKu3VHueqCR+YLXOrvCFjW8cOFH0VnQusZ7P
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="376991962"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="376991962"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 07:21:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="865148075"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="865148075"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 06 Sep 2023 07:21:14 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdtP5-0000Hb-39;
	Wed, 06 Sep 2023 14:21:11 +0000
Date: Wed, 6 Sep 2023 22:21:08 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:sched-setscheduler-hide 6/12]
 drivers/cpufreq/cppc_cpufreq.c:242:13: error: void value not ignored as it
 ought to be
Message-ID: <202309062246.ptoOKwYC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux sched-setscheduler-hide
head:   557fb1e21399de5f674beb93fa6793adce124cc2
commit: 80447b0e3eaf96dd618b010bf308735c3631afe1 [6/12] cpufreq: cppc: Convert to use sched_set_dl()
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230906/202309062246.ptoOKwYC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230906/202309062246.ptoOKwYC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309062246.ptoOKwYC-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/cpufreq/cppc_cpufreq.c: In function 'cppc_freq_invariance_init':
>> drivers/cpufreq/cppc_cpufreq.c:242:13: error: void value not ignored as it ought to be
     242 |         ret = sched_set_dl(kworker_fie->task, 0);
         |             ^


vim +242 drivers/cpufreq/cppc_cpufreq.c

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
 > 242		ret = sched_set_dl(kworker_fie->task, 0);
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

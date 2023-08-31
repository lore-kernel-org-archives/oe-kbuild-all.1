Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D481C20
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 06:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693464289; x=1725000289;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p6GtrpYhaIlVvQrJC9VrwWujDOukufdpFpj0sJyYG8Y=;
  b=baSNNl0ItdcaTdHNkpdp8endly8cbg22pWG2tUIiDQoAIX1R8vcv9OLi
   OfOeLDm+zcaBFouwclu9/cV6ZCupANe3yUFNCkjBm9bmoCSO4KdgkHNaq
   y4uRYxhpIX+ojTf+iYV7bhjYbzJRdjvVa1UTFMcXxC2rk4arLLJdOeJwh
   ++lDAziy6geTSABSbvCut5CFQNhPxrmSleRtkf9f1Vs/Jtv4l0+DfYXYS
   fD85r6FTl5A0/UdSIiK2pDRfSpul6R0tm+lgDoqiVUKM9dPZ3BE3BAs0d
   1ZmDUQfPD0zHJViaWzCWrmafJJfOgepPoXIPly6lrkgEAETo44kO/2aw3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="373234595"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="373234595"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 23:44:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="862911013"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="862911013"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 30 Aug 2023 23:44:32 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbbPq-000B2j-0i;
	Thu, 31 Aug 2023 06:44:30 +0000
Date: Thu, 31 Aug 2023 14:43:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 5681/11516] kernel/sched/pelt.c:477:5:
 warning: no previous declaration for 'sched_pelt_multiplier'
Message-ID: <202308311447.w4hymchJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jing-Ting,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   2a9967e15f99010ec06ac089b42a2ac20f2a57cb
commit: 0baa11384bf87212556a5cdce26a471ccadd11c7 [5681/11516] FROMLIST: sched/pelt: Introduce PELT multiplier
config: x86_64-randconfig-r032-20230831 (https://download.01.org/0day-ci/archive/20230831/202308311447.w4hymchJ-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308311447.w4hymchJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308311447.w4hymchJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:49:0:
>> kernel/sched/pelt.c:477:5: warning: no previous declaration for 'sched_pelt_multiplier' [-Wmissing-declarations]
    int sched_pelt_multiplier(struct ctl_table *table, int write, void *buffer,
        ^~~~~~~~~~~~~~~~~~~~~


vim +/sched_pelt_multiplier +477 kernel/sched/pelt.c

   476	
 > 477	int sched_pelt_multiplier(struct ctl_table *table, int write, void *buffer,
   478				  size_t *lenp, loff_t *ppos)
   479	{
   480		static DEFINE_MUTEX(mutex);
   481		unsigned int old;
   482		int ret;
   483	
   484		mutex_lock(&mutex);
   485		old = sysctl_sched_pelt_multiplier;
   486		ret = proc_dointvec(table, write, buffer, lenp, ppos);
   487		if (ret)
   488			goto undo;
   489		if (!write)
   490			goto done;
   491	
   492		switch (sysctl_sched_pelt_multiplier)  {
   493		case 1:
   494			fallthrough;
   495		case 2:
   496			fallthrough;
   497		case 4:
   498			WRITE_ONCE(sched_pelt_lshift,
   499				   sysctl_sched_pelt_multiplier >> 1);
   500			goto done;
   501		default:
   502			ret = -EINVAL;
   503		}
   504	
   505	undo:
   506		sysctl_sched_pelt_multiplier = old;
   507	done:
   508		mutex_unlock(&mutex);
   509	
   510		return ret;
   511	}
   512	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

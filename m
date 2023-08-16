Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7204110949
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 17:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692207527; x=1723743527;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OzBzM+LJ4cH0n2kDSToVYwTsbyvmEicQZfZQFoxD4XY=;
  b=Q7+LdmOBJyBxCLzI3AYVRRhZzPbDpscEIkRHTaSoyckVKvHNuaz3hYjS
   WY6ojDEmRFkLxsnTeVaaf+Ap9r+p002Ipp278HLRPNu0c6Cp799BJG4iN
   wR8B4NIIonGuYqBC5r3ChCbX4exnmdOzSMa+zYJxaO7hKZR8YgrBmcqOk
   kZSMEXSc7RB57NREDh2zqcVIeYd3ylasxXS228HiWarldBsHw8Ia9LlOm
   MWyKLxWeSZUBaFVKw3S5AyEUdpvMuFFVCLOm2TYLXJozsORKYVIGUZW8F
   IuLGtuxjzUO/UNQEiwHmqpNgCYUHWoXTokoCGXfzYAesUTUNXqc2Lm+pJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="376322520"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="376322520"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:38:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="763716113"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="763716113"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 16 Aug 2023 10:38:45 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWKTk-0000TX-1P;
	Wed, 16 Aug 2023 17:38:44 +0000
Date: Thu, 17 Aug 2023 01:37:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 5681/11175] kernel/sched/pelt.c:477:5:
 warning: no previous declaration for 'sched_pelt_multiplier'
Message-ID: <202308170105.DditwAlp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   7fa88611307e911f9fe45ef28d4471210b4d8de5
commit: 0baa11384bf87212556a5cdce26a471ccadd11c7 [5681/11175] FROMLIST: sched/pelt: Introduce PELT multiplier
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230817/202308170105.DditwAlp-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308170105.DditwAlp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308170105.DditwAlp-lkp@intel.com/

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

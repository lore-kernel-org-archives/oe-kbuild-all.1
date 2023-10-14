Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42487E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 01:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hKRPR79a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697246607; x=1728782607;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OWd8yeXWh/QmZFqFTKZcuDqz7NEFJH8tNExX/Nn5/z0=;
  b=hKRPR79a3GQilcfxC0RRQD6ihnkDPHSpZ68PgJHndjShfhGA9lbq+OyS
   MgG/unm/t0w9KbyH4yYVYHIf1QvtP4O4cA+T6/8tJQA2cQ0rMnK1MUV+R
   /8EDTg1Vcxl0kCQB3O4qjvWrI7unJRwJ6Ow3A5MBn6W47Cp2bttVYW9Nd
   VhpTV0LkFQNC+NgVVS6y883PEuuapa/MBsXnG1jsme9ssyI8nnZ6mYNAl
   XzjCXBDrfgon/GiAlqE7VedK+5h5nR4/vjA5tPrUWA5aol5xcmCTkqkfB
   5ayvS9UyAScO71bDfJ4rogWau1/OahM6vXit4qr09An7CJ+71bi9MeB3O
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="449482798"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="449482798"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 18:23:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="704860597"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="704860597"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 13 Oct 2023 18:23:25 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrTNC-0005aD-3D;
	Sat, 14 Oct 2023 01:23:23 +0000
Date: Sat, 14 Oct 2023 09:22:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 5681/15654] kernel/sched/pelt.c:477:5:
 warning: no previous declaration for 'sched_pelt_multiplier'
Message-ID: <202310140924.uFU6u9qa-lkp@intel.com>
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
head:   9328ee4b7727c8df425941cd05ce1bc2a917a434
commit: 0baa11384bf87212556a5cdce26a471ccadd11c7 [5681/15654] FROMLIST: sched/pelt: Introduce PELT multiplier
config: x86_64-randconfig-r032-20230831 (https://download.01.org/0day-ci/archive/20231014/202310140924.uFU6u9qa-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140924.uFU6u9qa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140924.uFU6u9qa-lkp@intel.com/

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

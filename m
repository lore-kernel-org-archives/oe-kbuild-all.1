Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4400E358B3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Nov 2023 22:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BnSZQ96w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700258732; x=1731794732;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1IVjDq3G/P6Y2vbUx/l6WBUETHMRvGam3Dp/Q4hnVV4=;
  b=BnSZQ96wOz4tpP5UIUFMNQ0qKJE6CNZueQKxYXrEUYGPyv8LrYITJRr+
   TjItA8W2oEUO91hPyW/1dSojHZySSdQRa7LwP0wRnyjF1sE94sdvxlury
   qX/5AoxqB640govgCKcP0NMEvA2w8ws4DE0VTMyNGm84OX8z87QkdXzdM
   V1OQ26cdUmfYBaWEDFzwJGcr+1hJ1n5HZaeQf713bA2dexVcFp0B1mG3s
   TDoBUBGVB8wdZq/7GAsR3t/ioZVgS1IPmQXLpdjmXULqrc/OoRXQSX+lr
   HWO2JB6Tb2wBtlt/pYbuTWlgmeSNqsGBF4uAspq/u0lRd1r6PLlLAGRyy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="422470016"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="422470016"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 14:05:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="765728309"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="765728309"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 17 Nov 2023 14:05:29 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r46xp-0003CD-26;
	Fri, 17 Nov 2023 22:05:26 +0000
Date: Sat, 18 Nov 2023 06:04:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Frederic Weisbecker <frederic@kernel.org>
Subject: kernel/locking/locktorture.c:127:23: sparse: sparse: symbol
 'call_rcu_chain' was not declared. Should it be static?
Message-ID: <202311180505.EMP8W0WO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6bc40e44f1ddef16a787f3501b97f1fff909177c
commit: 7f993623e9ebcd633c0f760991e5078b95a37db3 locktorture: Add call_rcu_chains module parameter
date:   8 weeks ago
config: sparc-randconfig-r021-20230427 (https://download.01.org/0day-ci/archive/20231118/202311180505.EMP8W0WO-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231118/202311180505.EMP8W0WO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311180505.EMP8W0WO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/locking/locktorture.c:127:23: sparse: sparse: symbol 'call_rcu_chain' was not declared. Should it be static?
   kernel/locking/locktorture.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   kernel/locking/locktorture.c:496:12: sparse: sparse: context imbalance in 'torture_mutex_lock' - wrong count at exit
   kernel/locking/locktorture.c:512:13: sparse: sparse: context imbalance in 'torture_mutex_unlock' - wrong count at exit
   kernel/locking/locktorture.c:570:12: sparse: sparse: context imbalance in 'torture_ww_mutex_lock' - wrong count at exit
   kernel/locking/locktorture.c:614:13: sparse: sparse: context imbalance in 'torture_ww_mutex_unlock' - wrong count at exit
   kernel/locking/locktorture.c:665:12: sparse: sparse: context imbalance in 'torture_rtmutex_lock' - wrong count at exit
   kernel/locking/locktorture.c:689:13: sparse: sparse: context imbalance in 'torture_rtmutex_unlock' - wrong count at exit
   kernel/locking/locktorture.c:729:12: sparse: sparse: context imbalance in 'torture_rwsem_down_write' - wrong count at exit
   kernel/locking/locktorture.c:745:13: sparse: sparse: context imbalance in 'torture_rwsem_up_write' - wrong count at exit
   kernel/locking/locktorture.c:751:12: sparse: sparse: context imbalance in 'torture_rwsem_down_read' - wrong count at exit
   kernel/locking/locktorture.c:769:13: sparse: sparse: context imbalance in 'torture_rwsem_up_read' - wrong count at exit
   kernel/locking/locktorture.c:799:12: sparse: sparse: context imbalance in 'torture_percpu_rwsem_down_write' - wrong count at exit
   kernel/locking/locktorture.c:806:13: sparse: sparse: context imbalance in 'torture_percpu_rwsem_up_write' - wrong count at exit
   kernel/locking/locktorture.c: note: in included file (through include/linux/fs.h, include/linux/proc_fs.h, arch/sparc/include/asm/prom.h, ...):
   include/linux/percpu-rwsem.h:70:9: sparse: sparse: context imbalance in 'torture_percpu_rwsem_down_read' - wrong count at exit
   include/linux/percpu-rwsem.h:121:9: sparse: sparse: context imbalance in 'torture_percpu_rwsem_up_read' - wrong count at exit

vim +/call_rcu_chain +127 kernel/locking/locktorture.c

   122	
   123	struct call_rcu_chain {
   124		struct rcu_head crc_rh;
   125		bool crc_stop;
   126	};
 > 127	struct call_rcu_chain *call_rcu_chain;
   128	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

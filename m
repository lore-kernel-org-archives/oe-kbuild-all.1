Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48FF12B80
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 10:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GwiOOqhU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699006490; x=1730542490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tq34U2KyCZc3RE/4YBif9OHyhpOoO9TTzolXT/dQbzs=;
  b=GwiOOqhUAY+Cko54uPDJXbW7HFbNitWKAveCjL80Ibk8OgnlDi5d2iwW
   0THejZrRJkIwK7Z7xODvFANqgytajqOaaJuDWaM1PolyHudgGKtns5jDB
   OSi+FVSsVFxT0snk3szD4du3zGT4DWpaNuDY2/5eqJaBJwd9aECh8yQix
   IqP6km5Ae3vQMzs7X3stonrMJu8z4Hlj4NWX0D4rJQHJ4nGLfdzyUUky5
   XcO+NHfufRls8wPXXciiXWvw9S8N8qEXecaFsjGGxU84opq83P0JxJFzE
   T+tT+TkGRLxASGoHL4LElre5/mdcxCUc9J6STEPmbLYH6Z1Od7QDtNpFX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="10453873"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="10453873"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 03:14:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="755116586"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="755116586"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 03 Nov 2023 03:14:43 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyrCL-0002RU-1T;
	Fri, 03 Nov 2023 10:14:41 +0000
Date: Fri, 3 Nov 2023 18:14:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/2] kernel/sched/core.c:4797:6:
 warning: no previous prototype for function '__balance_callbacks'
Message-ID: <202311031723.AfPySScv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   c85178cecaaf9206cb7e7742fa3a655f3bdb119f
commit: a2f552f49c9084dcc48b2066888d06a324e34b98 [1/2] ANDROID: GKI: vendor code needs __balance_callbacks access
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231103/202311031723.AfPySScv-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311031723.AfPySScv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311031723.AfPySScv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/core.c:3495:6: warning: no previous prototype for function 'sched_set_stop_task' [-Wmissing-prototypes]
   void sched_set_stop_task(int cpu, struct task_struct *stop)
        ^
   kernel/sched/core.c:3495:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void sched_set_stop_task(int cpu, struct task_struct *stop)
   ^
   static 
>> kernel/sched/core.c:4797:6: warning: no previous prototype for function '__balance_callbacks' [-Wmissing-prototypes]
   void __balance_callbacks(struct rq *rq)
        ^
   kernel/sched/core.c:4797:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __balance_callbacks(struct rq *rq)
   ^
   static 
   2 warnings generated.


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

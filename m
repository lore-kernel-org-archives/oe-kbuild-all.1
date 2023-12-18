Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A3363A8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 05:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KmN438Tm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702877007; x=1734413007;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m34XNGTQqRzVUNxQ/hz29KOeaGQukFqX4yylZ6L4R4E=;
  b=KmN438Tm/3kvnsyRiLtJYwdjl1cLPvrj1+ExKBsTXcUpiLWbRuFEfSNu
   a92SZD8vaDEz124YvKJZx495xM7Llz3b2DninTzbKd/iBBIEvrv9eN9PN
   Q8euo9LhUdOUcXgjYFzthZlwLBbiCB6CAJaYAywSr52VDKexCSm3KWkk0
   k6rQyOv9tWIMnF7IsKiTmH6TJ5Uptb2lKjkkNl6CgsJL8yMhTpisD+5Fe
   n/l3574qv0HU/UpjbwIsmJAa1I2oUJJOkRbK48RQcM5NTjQ7tuiUwgZil
   sAN+idm9RJ+fFyum4vVkQeSk/ikk0Dgix0A+o/e0AqzA4VFJ3qRq75saI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="459783007"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="459783007"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 21:23:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="17042647"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 17 Dec 2023 21:23:26 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rF667-0003nJ-0c;
	Mon, 18 Dec 2023 05:23:23 +0000
Date: Mon, 18 Dec 2023 13:22:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/2] kernel/sched/core.c:4854:6:
 error: no previous prototype for function '__balance_callbacks'
Message-ID: <202312181334.JDngriy0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   abea1cb16e43c1dbbcad5b826fe6952c343f59fb
commit: fdaddcab764a1219457d72273a96e2afb30b8824 [1/2] ANDROID: GKI: vendor code needs __balance_callbacks access
config: x86_64-sof-customedconfig-compile-test-defconfig (https://download.01.org/0day-ci/archive/20231218/202312181334.JDngriy0-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231218/202312181334.JDngriy0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312181334.JDngriy0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/core.c:13:
   kernel/sched/sched.h:1770:15: error: cast from 'void (*)(struct rq *)' to 'void (*)(struct callback_head *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
           head->func = (void (*)(struct callback_head *))func;
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:3543:6: error: no previous prototype for function 'sched_set_stop_task' [-Werror,-Wmissing-prototypes]
   void sched_set_stop_task(int cpu, struct task_struct *stop)
        ^
   kernel/sched/core.c:3543:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void sched_set_stop_task(int cpu, struct task_struct *stop)
   ^
   static 
   kernel/sched/core.c:4796:10: error: cast from 'void (*)(struct callback_head *)' to 'void (*)(struct rq *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
                   func = (void (*)(struct rq *))head->func;
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:4820:10: error: cast from 'void (*)(struct rq *)' to 'void (*)(struct callback_head *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
           .func = (void (*)(struct callback_head *))balance_push,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/core.c:4854:6: error: no previous prototype for function '__balance_callbacks' [-Werror,-Wmissing-prototypes]
   void __balance_callbacks(struct rq *rq)
        ^
   kernel/sched/core.c:4854:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __balance_callbacks(struct rq *rq)
   ^
   static 
   5 errors generated.


vim +/__balance_callbacks +4854 kernel/sched/core.c

  4853	
> 4854	void __balance_callbacks(struct rq *rq)
  4855	{
  4856		do_balance_callbacks(rq, __splice_balance_callbacks(rq, false));
  4857	}
  4858	EXPORT_SYMBOL_GPL(__balance_callbacks);
  4859	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

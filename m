Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF64B10E1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 08:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UMtoCrpn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697962671; x=1729498671;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TrX0uQgqcrvCG+xH/c7d75nNVmQdv00viX+QxOQHGtE=;
  b=UMtoCrpnAP7EUTGTZgOp4c4/yg3Jy86WGuiMatWPnapBkZFn23qJEqRp
   TlyFCDRIPwMCIw/t0txtnNhjFZeFfn9y/Zc0Ro0YVS3ONqy550qeqRPvT
   Jte5ZfGwQFZy7x4G8bzznrnl95MDkmzcAaLJQ6MDo2cGoWSmkCoAXShMf
   uecjNO9rhvaW3/MYjVj5cUJwXDjJsH6M4Lu+uCjctGG2TAIwnS+/gM71/
   8hEUuz4tYnXJL3viY3whYqptRbQ7SLYwIcHJohuX5CoE3u5J8aztHWoi8
   HwXIO8nGjEJiPXsJgnIZ9MWsxX+QvR9c73sSUaStkKbzJCeiIHV8VVjnF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="383889434"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="383889434"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 01:17:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="874363431"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="874363431"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 22 Oct 2023 01:17:46 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quTea-0005jQ-2D;
	Sun, 22 Oct 2023 08:17:44 +0000
Date: Sun, 22 Oct 2023 16:16:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 10515/27779]
 kernel/sched/core.c:94:22: sparse: sparse: incorrect type in initializer
 (different address spaces)
Message-ID: <202310221646.lGCxGUWU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   5e99400d74d7ef9bfc7820db76dba30eeeafa3ab
commit: 6765da7d2c9df8ea051ef8eefccd550e0bb62534 [10515/27779] ANDROID: GKI: core: Export for runqueues
config: i386-randconfig-061-20231022 (https://download.01.org/0day-ci/archive/20231022/202310221646.lGCxGUWU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231022/202310221646.lGCxGUWU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310221646.lGCxGUWU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sched/core.c:94:22: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:94:22: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:94:22: sparse:     got struct rq *
   kernel/sched/core.c:96:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:96:21: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:96:21: sparse:     got struct rq *
   kernel/sched/core.c:118:22: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:118:22: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:118:22: sparse:     got struct rq *
   kernel/sched/core.c:137:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:137:21: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:137:21: sparse:     got struct rq *
   kernel/sched/core.c:541:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:541:25: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:541:25: sparse:     got struct rq *
   kernel/sched/core.c:2205:14: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:2205:14: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:2205:14: sparse:     got struct rq *
   kernel/sched/core.c:2419:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:2419:25: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:2419:25: sparse:     got struct rq *
   kernel/sched/core.c:2661:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:2661:29: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:2661:29: sparse:     got struct rq *
   kernel/sched/core.c:3213:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:3213:25: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:3213:25: sparse:     got struct rq *
   kernel/sched/core.c:3428:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:3428:24: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:3428:24: sparse:     got struct rq *
   kernel/sched/core.c:3448:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:3448:16: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:3448:16: sparse:     got struct rq *
   kernel/sched/core.c:3458:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:3458:24: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:3458:24: sparse:     got struct rq *
   kernel/sched/core.c:3472:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:3472:29: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:3472:29: sparse:     got struct rq *
   kernel/sched/core.c:3619:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:3619:25: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:3619:25: sparse:     got struct rq *
   kernel/sched/core.c:4039:14: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4039:14: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:4039:14: sparse:     got struct rq *
   kernel/sched/core.c:4090:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:4090:17: sparse:    struct task_struct [noderef] <asn:4> *
   kernel/sched/core.c:4090:17: sparse:    struct task_struct *
   kernel/sched/core.c:4654:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4654:25: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:4654:25: sparse:     got struct rq *
   kernel/sched/core.c:4695:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4695:16: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:4695:16: sparse:     got struct rq *
   kernel/sched/core.c:5724:14: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5724:14: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:5724:14: sparse:     got struct rq *
   kernel/sched/core.c:5727:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5727:16: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:5727:16: sparse:     got struct rq *
   kernel/sched/core.c:5738:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5738:13: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:5738:13: sparse:     got struct rq *
   kernel/sched/core.c:6043:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6043:25: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:6043:25: sparse:     got struct rq *
   kernel/sched/core.c:6082:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:6082:9: sparse:    struct task_struct [noderef] <asn:4> *
   kernel/sched/core.c:6082:9: sparse:    struct task_struct *
   kernel/sched/core.c:6649:22: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6649:22: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:6649:22: sparse:     got struct rq *
   kernel/sched/core.c:7985:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:7985:25: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:7985:25: sparse:     got struct rq *
   kernel/sched/core.c:3562:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:3562:39: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:3562:39: sparse:     got struct rq *
   kernel/sched/core.c:3930:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:3930:9: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:3930:9: sparse:     got struct rq *

vim +94 kernel/sched/core.c

fa85ae2418e6843 kernel/sched.c      Peter Zijlstra 2008-01-25   82  
3e71a462dd483ce kernel/sched/core.c Peter Zijlstra 2016-04-28   83  /*
3e71a462dd483ce kernel/sched/core.c Peter Zijlstra 2016-04-28   84   * __task_rq_lock - lock the rq @p resides on.
3e71a462dd483ce kernel/sched/core.c Peter Zijlstra 2016-04-28   85   */
eb58075149b7f03 kernel/sched/core.c Peter Zijlstra 2015-07-31   86  struct rq *__task_rq_lock(struct task_struct *p, struct rq_flags *rf)
3e71a462dd483ce kernel/sched/core.c Peter Zijlstra 2016-04-28   87  	__acquires(rq->lock)
3e71a462dd483ce kernel/sched/core.c Peter Zijlstra 2016-04-28   88  {
3e71a462dd483ce kernel/sched/core.c Peter Zijlstra 2016-04-28   89  	struct rq *rq;
3e71a462dd483ce kernel/sched/core.c Peter Zijlstra 2016-04-28   90  
3e71a462dd483ce kernel/sched/core.c Peter Zijlstra 2016-04-28   91  	lockdep_assert_held(&p->pi_lock);
3e71a462dd483ce kernel/sched/core.c Peter Zijlstra 2016-04-28   92  
3e71a462dd483ce kernel/sched/core.c Peter Zijlstra 2016-04-28   93  	for (;;) {
3e71a462dd483ce kernel/sched/core.c Peter Zijlstra 2016-04-28  @94  		rq = task_rq(p);
3e71a462dd483ce kernel/sched/core.c Peter Zijlstra 2016-04-28   95  		raw_spin_lock(&rq->lock);
3e71a462dd483ce kernel/sched/core.c Peter Zijlstra 2016-04-28   96  		if (likely(rq == task_rq(p) && !task_on_rq_migrating(p))) {
d8ac897137a230e kernel/sched/core.c Matt Fleming   2016-09-21   97  			rq_pin_lock(rq, rf);
3e71a462dd483ce kernel/sched/core.c Peter Zijlstra 2016-04-28   98  			return rq;
3e71a462dd483ce kernel/sched/core.c Peter Zijlstra 2016-04-28   99  		}
3e71a462dd483ce kernel/sched/core.c Peter Zijlstra 2016-04-28  100  		raw_spin_unlock(&rq->lock);
3e71a462dd483ce kernel/sched/core.c Peter Zijlstra 2016-04-28  101  
3e71a462dd483ce kernel/sched/core.c Peter Zijlstra 2016-04-28  102  		while (unlikely(task_on_rq_migrating(p)))
3e71a462dd483ce kernel/sched/core.c Peter Zijlstra 2016-04-28  103  			cpu_relax();
3e71a462dd483ce kernel/sched/core.c Peter Zijlstra 2016-04-28  104  	}
3e71a462dd483ce kernel/sched/core.c Peter Zijlstra 2016-04-28  105  }
3e71a462dd483ce kernel/sched/core.c Peter Zijlstra 2016-04-28  106  

:::::: The code at line 94 was first introduced by commit
:::::: 3e71a462dd483ce508a723356b293731e7d788ea sched/core: Move task_rq_lock() out of line

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

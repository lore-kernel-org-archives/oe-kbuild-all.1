Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AF4320C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Apr 2023 22:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681943528; x=1713479528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kDi7fJSV8pqCJQPC0XT44WR+Z5JweDNyWJLzfm4yzb0=;
  b=VXj9vyDVppYtz5uLmDU0DdBFHtnTf4Mma9aXSKiZjzRLWJLA6fNsrecM
   XF+XACLEPpEbTkMPfn1m5j97tSfcuuvdKjjWjy1+q9jXE9NA5za3LhHHN
   zuVvgj1zyRK4WnsZxErxzeKp+9CDTmVLcfVkuK7tvvROh4R/IlSl1m9X5
   eOgJPpQa7eqEAi6AXTHwypZ8EnpPLoHDfOGEIOsTmpttqdWRhN0WmpGtG
   OQfiY0ujYNSYuXvFrLNwFh0yfrPIOIH76VIAvzEcv82mYBdmcTF/90AoG
   CI4cwfkBQGagyvSpeGCg4tJLWzJquOpXermLRbZDPDaVZMfNjlra+fWm8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="329752116"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; 
   d="scan'208";a="329752116"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 15:32:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="760907889"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; 
   d="scan'208";a="760907889"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 19 Apr 2023 15:32:06 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppGLN-000fF8-1C;
	Wed, 19 Apr 2023 22:32:05 +0000
Date: Thu, 20 Apr 2023 06:31:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 10722/27000]
 kernel/sched/core.c:94:22: sparse: sparse: incorrect type in initializer
 (different address spaces)
Message-ID: <202304200646.KYq9dCsV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   0108362f3305895e7647eadd89008241bcf32ae6
commit: a0212dbcef6d8b619371eb766da024aaf25e877b [10722/27000] ANDROID: GKI: core: Export for runqueues
config: i386-randconfig-s003 (https://download.01.org/0day-ci/archive/20230420/202304200646.KYq9dCsV-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android12-5.4
        git checkout a0212dbcef6d8b619371eb766da024aaf25e877b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash kernel/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304200646.KYq9dCsV-lkp@intel.com/

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
   kernel/sched/core.c:2379:14: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:2379:14: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:2379:14: sparse:     got struct rq *
   kernel/sched/core.c:2593:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:2593:25: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:2593:25: sparse:     got struct rq *
   kernel/sched/core.c:2835:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:2835:29: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:2835:29: sparse:     got struct rq *
   kernel/sched/core.c:3392:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:3392:25: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:3392:25: sparse:     got struct rq *
   kernel/sched/core.c:3607:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:3607:24: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:3607:24: sparse:     got struct rq *
   kernel/sched/core.c:3627:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:3627:16: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:3627:16: sparse:     got struct rq *
   kernel/sched/core.c:3637:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:3637:24: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:3637:24: sparse:     got struct rq *
   kernel/sched/core.c:3651:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:3651:29: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:3651:29: sparse:     got struct rq *
   kernel/sched/core.c:3798:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:3798:25: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:3798:25: sparse:     got struct rq *
   kernel/sched/core.c:4218:14: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4218:14: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:4218:14: sparse:     got struct rq *
   kernel/sched/core.c:4269:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:4269:17: sparse:    struct task_struct [noderef] <asn:4> *
   kernel/sched/core.c:4269:17: sparse:    struct task_struct *
   kernel/sched/core.c:4833:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4833:25: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:4833:25: sparse:     got struct rq *
   kernel/sched/core.c:4874:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4874:16: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:4874:16: sparse:     got struct rq *
   kernel/sched/core.c:5908:14: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5908:14: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:5908:14: sparse:     got struct rq *
   kernel/sched/core.c:5911:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5911:16: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:5911:16: sparse:     got struct rq *
   kernel/sched/core.c:5922:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5922:13: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:5922:13: sparse:     got struct rq *
   kernel/sched/core.c:6227:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6227:25: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:6227:25: sparse:     got struct rq *
   kernel/sched/core.c:6266:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:6266:9: sparse:    struct task_struct [noderef] <asn:4> *
   kernel/sched/core.c:6266:9: sparse:    struct task_struct *
   kernel/sched/core.c:6833:22: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6833:22: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:6833:22: sparse:     got struct rq *
   kernel/sched/core.c:8171:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8171:25: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:8171:25: sparse:     got struct rq *
   kernel/sched/core.c:3741:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:3741:39: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:3741:39: sparse:     got struct rq *
   kernel/sched/core.c:4109:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4109:9: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:4109:9: sparse:     got struct rq *

vim +94 kernel/sched/core.c

fa85ae2418e684 kernel/sched.c      Peter Zijlstra 2008-01-25   82  
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28   83  /*
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28   84   * __task_rq_lock - lock the rq @p resides on.
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28   85   */
eb58075149b7f0 kernel/sched/core.c Peter Zijlstra 2015-07-31   86  struct rq *__task_rq_lock(struct task_struct *p, struct rq_flags *rf)
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28   87  	__acquires(rq->lock)
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28   88  {
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28   89  	struct rq *rq;
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28   90  
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28   91  	lockdep_assert_held(&p->pi_lock);
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28   92  
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28   93  	for (;;) {
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  @94  		rq = task_rq(p);
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28   95  		raw_spin_lock(&rq->lock);
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28   96  		if (likely(rq == task_rq(p) && !task_on_rq_migrating(p))) {
d8ac897137a230 kernel/sched/core.c Matt Fleming   2016-09-21   97  			rq_pin_lock(rq, rf);
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28   98  			return rq;
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28   99  		}
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  100  		raw_spin_unlock(&rq->lock);
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  101  
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  102  		while (unlikely(task_on_rq_migrating(p)))
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  103  			cpu_relax();
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  104  	}
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  105  }
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  106  

:::::: The code at line 94 was first introduced by commit
:::::: 3e71a462dd483ce508a723356b293731e7d788ea sched/core: Move task_rq_lock() out of line

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

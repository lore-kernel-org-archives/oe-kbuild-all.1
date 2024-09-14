Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45F91CEAC2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 09:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726306557; cv=none; b=o/ZNbg8+7Do6L4FJMbxLKC+NmIDMhj697QK++3W/gGeuujxn2VbdeQu+mholD9bRF1WS3qCnh8sFBXzBFsmq1X9EdgEWxFgV/iL2CBMCJ6w0qUxETmR82b0oQ/hZh1FrFH4T30XR5d4ICnz8z+vN8UhPmo2gkEacUJ8lypWro4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726306557; c=relaxed/simple;
	bh=TtsHHh2BX9VBu/ho7+0mp+2uT3CI6/5obJcvrblJQMo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YsMw7stQri/3UvoznUuSl4bUOM9NRpfJEVnjVpvmb6VnQwQf2PqDCT0Y7H5R1ZUgRc772J5OKNPxwfevtdBKNkI6AfuX2MvmN9oZURHZnbUdSrltu3jD97AM3gzPbgAbLtD6OzIibVdCaYf4bY5mopjoRcgfOUYRfnv7WciBJ8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GT9vP6XL; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GT9vP6XL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726306555; x=1757842555;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TtsHHh2BX9VBu/ho7+0mp+2uT3CI6/5obJcvrblJQMo=;
  b=GT9vP6XL/Drgs/3AHSUD8Z2X0uCm4xP0RQ57kHrcoATCp6DS2b/45nk6
   liOobIa0glxa1K3Rpw26Lk4wSNWiiNnWXF5WRcwBNx2P3wb1w/oWRtdZz
   szlQcE+dpr0brmHIwnwy5pS6O01Zd2Wq+2amoMQRD5if7MbIHlqr7/ens
   XKseERvatgzu43U44S7qUCFrzmpG9yblZxJYOYtiGcetxiLhEmTIRv1NM
   PTT3KGfNMPolnLo/5lI8on3ZLvxKdHIyUK4a5ND8+fdHZq3EpbZlgH78q
   9JdgxkGs/NMSPP2LQ/CsNs2xanmXISeV142iWuxzrXXcJT24IFdkm2oUX
   Q==;
X-CSE-ConnectionGUID: VQSN6qT5QF+8ogk3fskPQQ==
X-CSE-MsgGUID: NNkQUf3VR/6T1jgw7vf8Ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="28954385"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="28954385"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 02:35:54 -0700
X-CSE-ConnectionGUID: QeRrHXnhSzeii/rz4yecew==
X-CSE-MsgGUID: r00maLjHQxCMY7W0w/8bgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="67978294"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Sep 2024 02:35:53 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spPC2-0007ao-2z;
	Sat, 14 Sep 2024 09:35:50 +0000
Date: Sat, 14 Sep 2024 17:35:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 9386/30000] kernel/sched/core.c:94:22:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202409141735.sVQzUr8f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   d62984adb112e9b02a3e754e0b5b3295d7501600
commit: 6765da7d2c9df8ea051ef8eefccd550e0bb62534 [9386/30000] ANDROID: GKI: core: Export for runqueues
config: x86_64-randconfig-121-20240913 (https://download.01.org/0day-ci/archive/20240914/202409141735.sVQzUr8f-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141735.sVQzUr8f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141735.sVQzUr8f-lkp@intel.com/

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
   kernel/sched/core.c:303:19: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:303:19: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:303:19: sparse:     got struct rq *
   kernel/sched/core.c:541:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:541:25: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:541:25: sparse:     got struct rq *
   kernel/sched/core.c:569:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:569:9: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:569:9: sparse:     got struct rq *
   kernel/sched/core.c:569:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:569:9: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:569:9: sparse:     got struct rq *
   kernel/sched/core.c:569:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:569:9: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:569:9: sparse:     got struct rq *
   kernel/sched/core.c:569:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:569:9: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:569:9: sparse:     got struct rq *
   kernel/sched/core.c:569:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:569:9: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:569:9: sparse:     got struct rq *
   kernel/sched/core.c:569:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:569:9: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:569:9: sparse:     got struct rq *
   kernel/sched/core.c:569:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:569:9: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:569:9: sparse:     got struct rq *
   kernel/sched/core.c:569:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:569:9: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:569:9: sparse:     got struct rq *
   kernel/sched/core.c:569:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:569:9: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:569:9: sparse:     got struct rq *
   kernel/sched/core.c:569:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:569:9: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:569:9: sparse:     got struct rq *
   kernel/sched/core.c:569:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:569:9: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:569:9: sparse:     got struct rq *
   kernel/sched/core.c:569:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] <asn:4> *parent @@
   kernel/sched/core.c:569:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:569:9: sparse:     got struct sched_domain [noderef] <asn:4> *parent
   kernel/sched/core.c:600:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:600:25: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:600:25: sparse:     got struct rq *
   kernel/sched/core.c:1517:14: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:1517:14: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:1517:14: sparse:     got struct rq *
   kernel/sched/core.c:1564:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:1564:25: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:1564:25: sparse:     got struct rq *
   kernel/sched/core.c:1586:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:1586:13: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:1586:13: sparse:     got struct rq *
   kernel/sched/core.c:1611:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:1611:25: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:1611:25: sparse:     got struct rq *
   kernel/sched/core.c:1755:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:1755:9: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:1755:9: sparse:     got struct rq *
   kernel/sched/core.c:1924:22: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:1924:22: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:1924:22: sparse:     got struct rq *
   kernel/sched/core.c:2160:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:2160:40: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:2160:40: sparse:     got struct rq *
   kernel/sched/core.c:2176:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:2176:9: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:2176:9: sparse:     got struct rq *
   kernel/sched/core.c:2205:14: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:2205:14: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:2205:14: sparse:     got struct rq *
   kernel/sched/core.c:2216:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:2216:17: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:2216:17: sparse:     got struct rq *
   kernel/sched/core.c:2216:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:2216:17: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:2216:17: sparse:     got struct rq *
   kernel/sched/core.c:2216:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:2216:17: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:2216:17: sparse:     got struct rq *
   kernel/sched/core.c:2216:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:2216:17: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:2216:17: sparse:     got struct rq *
   kernel/sched/core.c:2216:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:2216:17: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:2216:17: sparse:     got struct rq *
   kernel/sched/core.c:2216:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@

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
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FA71E507
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 15:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727623179; cv=none; b=UxOq43g4QmONYGx+OjLuUwFMgrlPGfoAaw2PqPD+8Utkyj8WIa5aRjgZn5N1sAr53Ssp0D2uVgUDj0UdEH383ec0zx0/YgLr5j6ebLdSP9TBQ/t/ggtRRUgLYOE2m6TbdQUOHWb2zgGTaOC+AwB8SYG48T441Rf7IA2ue8gpV5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727623179; c=relaxed/simple;
	bh=F/ge3/DoDNIGm2c+sZuaGMVEplI3xbrbi/MfVRDfeNw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hUmsSv5+vHEZuN4Lw9hgmLRnkHIyCWe5hOHT20v0bfQLzjdRw1+rMFhFKq8BT+XMEKXD+smxdEPtEWk5Fa8XkfPE9R9C70ZtK/xdnPl+bXgvzE/GHNLYtHW/ZjHe6JO43w0sQtxRTIr20DE+oeetQa3JmeAdq5fc3Srus+ZPr/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=njRtRU0n; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="njRtRU0n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727623178; x=1759159178;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F/ge3/DoDNIGm2c+sZuaGMVEplI3xbrbi/MfVRDfeNw=;
  b=njRtRU0naNFRGvYxlvy62bGIM58worE3ptPj400kTeBLjYiZZji8MIYt
   uT2o2kadsQi4qdAQs7Ch6ZbZF+2Lm3/y4Bau8dN3d5Ensqa4QoE0mCXAV
   izb8SVb+fvHHfxU9VsnrOv12wOQCG9Kg0Oz/sF3vyKUNd89xQrcybBHfz
   A0HPc8Mh4V7hY3Um/TATRfEWte1kXrGRlonitd7FqqACdaU6D2aSsua/2
   qQAgGNcUwCxCGoXCylkPoJMqRxXMnMNBgI+JtSDO1oaxDgkUEJNLba06y
   2EtLXwPk+tD49meL5HPQKS6TOjzb3z7xOUIHnN6ladm93caLVQH8rAHwk
   A==;
X-CSE-ConnectionGUID: pb6dE+J2QK66CZ2VE7Fp2g==
X-CSE-MsgGUID: o8SsoKptQAmbqKV1wbbmYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="49234666"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="49234666"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 08:19:35 -0700
X-CSE-ConnectionGUID: 93miVwseSpWnbXw/lUaLjw==
X-CSE-MsgGUID: VUIUMpdASYOfUjX6GtKM5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="103839415"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 Sep 2024 08:19:33 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suvhr-000OOL-12;
	Sun, 29 Sep 2024 15:19:31 +0000
Date: Sun, 29 Sep 2024 23:19:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 7845/30000] kernel/sched/core.c:94:22:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202409292326.P9whWFEN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   1cca65ac6abc0751e6bd0dfdd9564925e2a7ff07
commit: a0212dbcef6d8b619371eb766da024aaf25e877b [7845/30000] ANDROID: GKI: core: Export for runqueues
config: x86_64-randconfig-121-20240929 (https://download.01.org/0day-ci/archive/20240929/202409292326.P9whWFEN-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409292326.P9whWFEN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409292326.P9whWFEN-lkp@intel.com/

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
   kernel/sched/core.c:1691:14: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:1691:14: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:1691:14: sparse:     got struct rq *
   kernel/sched/core.c:1738:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:1738:25: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:1738:25: sparse:     got struct rq *
   kernel/sched/core.c:1760:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:1760:13: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:1760:13: sparse:     got struct rq *
   kernel/sched/core.c:1785:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:1785:25: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:1785:25: sparse:     got struct rq *
   kernel/sched/core.c:1929:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:1929:9: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:1929:9: sparse:     got struct rq *
   kernel/sched/core.c:1958:26: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:1958:26: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:1958:26: sparse:     got struct rq *
   kernel/sched/core.c:1959:26: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:1959:26: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:1959:26: sparse:     got struct rq *
   kernel/sched/core.c:1996:18: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:1996:18: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:1996:18: sparse:     got struct rq *
   kernel/sched/core.c:1997:18: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:1997:18: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:1997:18: sparse:     got struct rq *
   kernel/sched/core.c:2098:22: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:2098:22: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:2098:22: sparse:     got struct rq *
   kernel/sched/core.c:2334:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:2334:40: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:2334:40: sparse:     got struct rq *
   kernel/sched/core.c:2350:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:2350:9: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:2350:9: sparse:     got struct rq *
   kernel/sched/core.c:2379:14: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:2379:14: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:2379:14: sparse:     got struct rq *
   kernel/sched/core.c:2390:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:2390:17: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:2390:17: sparse:     got struct rq *
   kernel/sched/core.c:2390:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:2390:17: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:2390:17: sparse:     got struct rq *
   kernel/sched/core.c:2390:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:2390:17: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:2390:17: sparse:     got struct rq *
   kernel/sched/core.c:2390:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:2390:17: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:2390:17: sparse:     got struct rq *
   kernel/sched/core.c:2390:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:2390:17: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:2390:17: sparse:     got struct rq *
   kernel/sched/core.c:2390:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:2390:17: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:2390:17: sparse:     got struct rq *
   kernel/sched/core.c:2390:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:2390:17: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:2390:17: sparse:     got struct rq *
   kernel/sched/core.c:2390:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:2390:17: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:2390:17: sparse:     got struct rq *
   kernel/sched/core.c:2390:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:2390:17: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:2390:17: sparse:     got struct rq *
   kernel/sched/core.c:2390:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:2390:17: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:2390:17: sparse:     got struct rq *
   kernel/sched/core.c:2390:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:2390:17: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:2390:17: sparse:     got struct rq *
   kernel/sched/core.c:2390:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] <asn:4> *parent @@
   kernel/sched/core.c:2390:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:2390:17: sparse:     got struct sched_domain [noderef] <asn:4> *parent
   kernel/sched/core.c:2492:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:2492:25: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:2492:25: sparse:     got struct rq *
   kernel/sched/core.c:2518:26: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:2518:26: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/sched/core.c:2518:26: sparse:     got struct rq *
   kernel/sched/core.c:2541:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct rq * @@

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

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6645342A9D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 16:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765730736; cv=none; b=fni91XY4DxVVpi/umr5VC0M3g6PmMh6ejwvzLpwjTVoVe0jOJ5tJBrm7hUvHpbhc3eH8lBNoNcc3r4sj2F0aDDXyjLi3vnaVC+LzHKvG+mHGzufcfQlAWgLz5ZWivdG31DGFqBT0A5MW2wrsWO5D7cte70sZiF9Qhj1gbve26qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765730736; c=relaxed/simple;
	bh=7/hDRqUtlRDGIGSCzoiQltCJ5i0qrPI5kcSq25Nnc14=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ltFw9XXz3KAvQObhi3zx8WQ7C0dIdmatzKs3RKaqWhPhGbDvsLmF9ktAIA/rcPfW+swTUmj+mL0JVhAv1rUH/aVUGQcT2T7alyszFFJhtufLhwb8nletNNQSeTwyicKKTl2lthv//6OsxiNjq5XdkR2SFB/NlZz1cipGTcy06Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oj2YJBCt; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oj2YJBCt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765730734; x=1797266734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7/hDRqUtlRDGIGSCzoiQltCJ5i0qrPI5kcSq25Nnc14=;
  b=Oj2YJBCttf4FNgd1ceb+4p6gAwgnZxugJpiSpIzOSR8gXi4gUZGZtwzg
   CharuF4XQlDOR3lX7LiTWrAr7IySDK6mo/oT+rRMtjfWJJHIq1cTD2d27
   L1BlkkFomEWsSLg1q9e6GZJBPvh1F1j7jYfajMuDnLCOaTWbul/oPhGmM
   EZA46WlT60/nLd4yMqFb6PYCZINUjsAt9ylqB6ai1/w12lzpW0DXtFGpx
   doabYevOYNhmhP1vQGV1VCX3+lWFfvtk1Udyr64Wqy5dnxVmCdDmcngF1
   Y390iteCC1RpCaJOh4JHjnOpdWbUY8E9cN7xj6iaHWjt/HntPua6opYGL
   Q==;
X-CSE-ConnectionGUID: 2gaVFL/NT4uLHLQp7Fo+Sg==
X-CSE-MsgGUID: yc0xOppSQueJemoS83kuEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="79109000"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="79109000"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 08:45:34 -0800
X-CSE-ConnectionGUID: DM3Pf7qeRvWqplkoSXteEQ==
X-CSE-MsgGUID: Tq2+7WcqT4CybZM3yrOfRQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Dec 2025 08:45:33 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUpDu-000000009CD-3Rrv;
	Sun, 14 Dec 2025 16:45:30 +0000
Date: Mon, 15 Dec 2025 00:44:31 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: include/linux/rbtree.h:74:9: sparse: sparse: incompatible types in
 comparison expression (different address spaces):
Message-ID: <202512150042.fpiqhcnF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 885fc8ac0a4dc70f5d87b80b0977292870e35c60 nstree: make iterator generic
date:   3 months ago
config: m68k-randconfig-r133-20251214 (https://download.01.org/0day-ci/archive/20251215/202512150042.fpiqhcnF-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512150042.fpiqhcnF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150042.fpiqhcnF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/nstree.c: note: in included file (through include/linux/ns_common.h, include/linux/nstree.h):
>> include/linux/rbtree.h:74:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rbtree.h:74:9: sparse:    struct rb_node [noderef] __rcu *
   include/linux/rbtree.h:74:9: sparse:    struct rb_node *

vim +74 include/linux/rbtree.h

^1da177e4c3f41 Linus Torvalds 2005-04-16  67  
d72da4a4d973d8 Peter Zijlstra 2015-05-27  68  static inline void rb_link_node_rcu(struct rb_node *node, struct rb_node *parent,
d72da4a4d973d8 Peter Zijlstra 2015-05-27  69  				    struct rb_node **rb_link)
d72da4a4d973d8 Peter Zijlstra 2015-05-27  70  {
d72da4a4d973d8 Peter Zijlstra 2015-05-27  71  	node->__rb_parent_color = (unsigned long)parent;
d72da4a4d973d8 Peter Zijlstra 2015-05-27  72  	node->rb_left = node->rb_right = NULL;
d72da4a4d973d8 Peter Zijlstra 2015-05-27  73  
d72da4a4d973d8 Peter Zijlstra 2015-05-27 @74  	rcu_assign_pointer(*rb_link, node);
d72da4a4d973d8 Peter Zijlstra 2015-05-27  75  }
d72da4a4d973d8 Peter Zijlstra 2015-05-27  76  

:::::: The code at line 74 was first introduced by commit
:::::: d72da4a4d973d8a0a0d3c97e7cdebf287fbe3a99 rbtree: Make lockless searches non-fatal

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Rusty Russell <rusty@rustcorp.com.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

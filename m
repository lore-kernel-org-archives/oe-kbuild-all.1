Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1DA139D
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Dec 2023 06:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J8rcM8QH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701583668; x=1733119668;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mtOeoCx4l4zfsbqJ7foiBlF5AN3k6ugAPkOMvELQueY=;
  b=J8rcM8QHQQa64yTmrOp5brA6Wf9Iy+4S2zM0YKJWki7PPTD6JqWnLo4p
   +fxH8VYCpTv+4ArTmHIM+HkqnFmfjkiD+R2xeVByaYGqHyPmZT7K7gBtU
   EWxIkQRlRda23eX2jD+GBbvyGXdfZquCyDo/Cx35AC/19OpPrX+rLng7D
   B1pnXMwoeobwnS/PlxPnc/ER+vp/ZvIGxeVA7pw990qIgVFEunJl8rzoF
   mhQmbyqaLRSy4R9zQSXBbKqamU2X0mRvnaaHL8o3rSUuPIuP/bmglZtbH
   bDkl2aapoBc5Cx1QAzkb5QSToDbKkLEWDHV9sUEosi0dhWcyVV2frpvy1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="373049275"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="373049275"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 22:07:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="770187874"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="770187874"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 02 Dec 2023 22:07:43 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9fdk-0006I0-2d;
	Sun, 03 Dec 2023 06:07:40 +0000
Date: Sun, 3 Dec 2023 14:07:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: fs/bcachefs/btree_cache.c:456:15: sparse: sparse: Using plain
 integer as NULL pointer
Message-ID: <202312021327.zVWlbqlu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   815fb87b753055df2d9e50f6cd80eb10235fe3e9
commit: 1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a bcachefs: Initial commit
date:   6 weeks ago
config: hexagon-randconfig-r121-20231119 (https://download.01.org/0day-ci/archive/20231202/202312021327.zVWlbqlu-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231202/202312021327.zVWlbqlu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312021327.zVWlbqlu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/bcachefs/btree_cache.c:456:15: sparse: sparse: Using plain integer as NULL pointer
   fs/bcachefs/btree_cache.c:468:15: sparse: sparse: Using plain integer as NULL pointer
   fs/bcachefs/btree_cache.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   fs/bcachefs/btree_cache.c: note: in included file (through include/linux/backing-dev-defs.h, fs/bcachefs/bcachefs.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +456 fs/bcachefs/btree_cache.c

   450	
   451	int bch2_btree_cache_cannibalize_lock(struct bch_fs *c, struct closure *cl)
   452	{
   453		struct btree_cache *bc = &c->btree_cache;
   454		struct task_struct *old;
   455	
 > 456		old = cmpxchg(&bc->alloc_lock, NULL, current);
   457		if (old == NULL || old == current)
   458			goto success;
   459	
   460		if (!cl) {
   461			trace_btree_node_cannibalize_lock_fail(c);
   462			return -ENOMEM;
   463		}
   464	
   465		closure_wait(&bc->alloc_wait, cl);
   466	
   467		/* Try again, after adding ourselves to waitlist */
   468		old = cmpxchg(&bc->alloc_lock, NULL, current);
   469		if (old == NULL || old == current) {
   470			/* We raced */
   471			closure_wake_up(&bc->alloc_wait);
   472			goto success;
   473		}
   474	
   475		trace_btree_node_cannibalize_lock_fail(c);
   476		return -EAGAIN;
   477	
   478	success:
   479		trace_btree_node_cannibalize_lock(c);
   480		return 0;
   481	}
   482	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

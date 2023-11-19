Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECBC1A592
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Nov 2023 21:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bkTkoz0/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700430326; x=1731966326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HU0p3CbWSWu0mTEMjJkPI32kfesmO2jT6GSlf+DcvPw=;
  b=bkTkoz0/ohXakJ+3EdbyY4wvm9bvgzl7TVSbHoYH676VxnjTqtWsLect
   s2Z5B3WDScvH1MCHWB3mgsz97JWtnit+wsr+jw3OrWVHfyyqV0ftdbWQK
   4fqsMF3Yw20T4GPYVOELhZ078nDXog8621k+u7SpIeKQTH+IlnK9foUGe
   LnrOvgPO1uDwn3l1mP9CJdlSE+GfIRN+7XdRi3LTNRYhjdCDjofufhYtC
   pchdM2WZwaI+ahEDpH96J8vrzO9Z7Paz3EyeLpvciG646FG+kncYS3+Ac
   QUdNgkS5PNw8LDZp4pFmKlzpjkzuGxYCve3N5ehIT3Q8rFk5VyVrU5hTJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="376558226"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="376558226"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 13:45:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="909921347"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="909921347"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 19 Nov 2023 13:45:24 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4pbW-0005bG-03;
	Sun, 19 Nov 2023 21:45:22 +0000
Date: Mon, 20 Nov 2023 05:44:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: fs/bcachefs/btree_cache.c:456:15: sparse: sparse: Using plain
 integer as NULL pointer
Message-ID: <202311200512.l1n53SlO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   037266a5f7239ead1530266f7d7af153d2a867fa
commit: 1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a bcachefs: Initial commit
date:   4 weeks ago
config: hexagon-randconfig-r121-20231119 (https://download.01.org/0day-ci/archive/20231120/202311200512.l1n53SlO-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231120/202311200512.l1n53SlO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311200512.l1n53SlO-lkp@intel.com/

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

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CAA1FBEA6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jan 2026 07:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768116861; cv=none; b=HW3vZ0LDhbFwxFa+m/67hVDx9vDPp8MiCYpDyQMsw4Q8Bu1XSPtXO2OcJtthgQHKPW5Qqr/W+BQLPGgtL6xQJfXIBmtpZx8oC4KzmBVWAilTrWBxNGEUSBH0BgbYivfWgRHVzTyY3rZmP5HyqWj24EE0zQXk4uFYAVTvoWhnkq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768116861; c=relaxed/simple;
	bh=JAvRsYzm4/wg0RWHArC3UcGbfI4j44/ZrF53Ze4BNNM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PzzUb9xFVIFXxy+HCt6kaatdu1UooLpYa+ZpiZiKvQCH/eeQdsns2sz747w3r9hDTjLau+QdDYPg1XBvl1vMi0PkFLRAQz0rMx9/9Ve/xYv2vMY/FoM5XFEwVV1AjQ55e5YFkbF41ob8jdOLNrOccKuA2huUBbIWQO2ZDcpK+E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cxLepRdv; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cxLepRdv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768116860; x=1799652860;
  h=date:from:to:cc:subject:message-id;
  bh=JAvRsYzm4/wg0RWHArC3UcGbfI4j44/ZrF53Ze4BNNM=;
  b=cxLepRdv8PMyuDKN87BIXzhHinWmDmESocs9i2fJTVcmv9mJbeUDr1dY
   nRl4hKNeyKT/vwQ05w5eZO5OE/T0vo/djYJKJz2Ems69E/QxA7Q4Cozqi
   EVc0rXMO0jhhS5kQKmODktvzHjcfFm2ej6fs8RbAX1l/P4bdejDgPK11K
   H6RuowYSr2WgnSwXsrC0Koj06XoW51s1Ixo4ShJ4J06t6tiP6i9Ji6/Ck
   zJzKSnD7bvJ9sPnDX3RAa1xVHIlCFUpjQU7S2+EinFEVoiuUDxogIkWym
   pYRHtYpJuJSSix+NRsU8hPK8r6/FcCmAHLZInh2HJPibvGHpdrqA7vK5K
   g==;
X-CSE-ConnectionGUID: CefkaXI1SmSRC1TF8gPxhQ==
X-CSE-MsgGUID: M8ie/BpcTdCP+HW72leW3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="80067848"
X-IronPort-AV: E=Sophos;i="6.21,218,1763452800"; 
   d="scan'208";a="80067848"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 23:34:19 -0800
X-CSE-ConnectionGUID: LR09EUWnQbGe8BG3BCITPw==
X-CSE-MsgGUID: Ooj/h/N6RKG07tqpH20yTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,218,1763452800"; 
   d="scan'208";a="203736056"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Jan 2026 23:34:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vepxn-000000009lQ-2ZXr;
	Sun, 11 Jan 2026 07:34:15 +0000
Date: Sun, 11 Jan 2026 15:33:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 140/184]
 fs/bcachefs/data/copygc.c:581:34: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202601111507.3dKXVD2z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   686cc9fa789ce9e9e5b08c25601eeadbb648d250
commit: 88633d63152451a41ce7b7913e49ac6d6107c314 [140/184] bcachefs: Allocator now directly wakes up copygc when necessary
config: hexagon-randconfig-r134-20260111 (https://download.01.org/0day-ci/archive/20260111/202601111507.3dKXVD2z-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260111/202601111507.3dKXVD2z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601111507.3dKXVD2z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/bcachefs/data/copygc.c:581:34: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct [noderef] __rcu *thread @@     got struct task_struct *t @@
   fs/bcachefs/data/copygc.c:581:34: sparse:     expected struct task_struct [noderef] __rcu *thread
   fs/bcachefs/data/copygc.c:581:34: sparse:     got struct task_struct *t
>> fs/bcachefs/data/copygc.c:583:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *thread @@
   fs/bcachefs/data/copygc.c:583:42: sparse:     expected struct task_struct *tsk
   fs/bcachefs/data/copygc.c:583:42: sparse:     got struct task_struct [noderef] __rcu *thread

vim +581 fs/bcachefs/data/copygc.c

1c6fdbd8f2465d fs/bcachefs/movinggc.c    Kent Overstreet 2017-03-16  557  
e6d1161530bcd6 fs/bcachefs/movinggc.c    Kent Overstreet 2020-07-11  558  int bch2_copygc_start(struct bch_fs *c)
1c6fdbd8f2465d fs/bcachefs/movinggc.c    Kent Overstreet 2017-03-16  559  {
1c6fdbd8f2465d fs/bcachefs/movinggc.c    Kent Overstreet 2017-03-16  560  	if (c->opts.nochanges)
1c6fdbd8f2465d fs/bcachefs/movinggc.c    Kent Overstreet 2017-03-16  561  		return 0;
1c6fdbd8f2465d fs/bcachefs/movinggc.c    Kent Overstreet 2017-03-16  562  
1c6fdbd8f2465d fs/bcachefs/movinggc.c    Kent Overstreet 2017-03-16  563  	if (bch2_fs_init_fault("copygc_start"))
1c6fdbd8f2465d fs/bcachefs/movinggc.c    Kent Overstreet 2017-03-16  564  		return -ENOMEM;
1c6fdbd8f2465d fs/bcachefs/movinggc.c    Kent Overstreet 2017-03-16  565  
7705b3d5de918b fs/bcachefs/data/copygc.c Kent Overstreet 2025-11-29  566  	if (!c->copygc.wq &&
7705b3d5de918b fs/bcachefs/data/copygc.c Kent Overstreet 2025-11-29  567  	    !(c->copygc.wq = alloc_workqueue("bcachefs_copygc",
7705b3d5de918b fs/bcachefs/data/copygc.c Kent Overstreet 2025-11-29  568  				WQ_HIGHPRI|WQ_FREEZABLE|WQ_MEM_RECLAIM|WQ_CPU_INTENSIVE, 1)))
7705b3d5de918b fs/bcachefs/data/copygc.c Kent Overstreet 2025-11-29  569  		return bch_err_throw(c, ENOMEM_fs_other_alloc);
7705b3d5de918b fs/bcachefs/data/copygc.c Kent Overstreet 2025-11-29  570  
7705b3d5de918b fs/bcachefs/data/copygc.c Kent Overstreet 2025-11-29  571  	if (!c->copygc.thread) {
7705b3d5de918b fs/bcachefs/data/copygc.c Kent Overstreet 2025-11-29  572  		struct task_struct *t =
7705b3d5de918b fs/bcachefs/data/copygc.c Kent Overstreet 2025-11-29  573  			kthread_create(bch2_copygc_thread, c, "bch-copygc/%s", c->name);
7705b3d5de918b fs/bcachefs/data/copygc.c Kent Overstreet 2025-11-29  574  		int ret = PTR_ERR_OR_ZERO(t);
e46c181af9e230 fs/bcachefs/movinggc.c    Kent Overstreet 2023-09-11  575  		bch_err_msg(c, ret, "creating copygc thread");
cf904c8d964fa4 fs/bcachefs/movinggc.c    Kent Overstreet 2023-12-16  576  		if (ret)
d4bf5eecd78a90 fs/bcachefs/movinggc.c    Kent Overstreet 2022-07-18  577  			return ret;
1c6fdbd8f2465d fs/bcachefs/movinggc.c    Kent Overstreet 2017-03-16  578  
1c6fdbd8f2465d fs/bcachefs/movinggc.c    Kent Overstreet 2017-03-16  579  		get_task_struct(t);
1c6fdbd8f2465d fs/bcachefs/movinggc.c    Kent Overstreet 2017-03-16  580  
cb70f3a81f829a fs/bcachefs/data/copygc.c Kent Overstreet 2025-11-29 @581  		c->copygc.thread = t;
88633d63152451 fs/bcachefs/data/copygc.c Kent Overstreet 2024-10-18  582  		rcu_assign_pointer(c->copygc.thread, t);
cb70f3a81f829a fs/bcachefs/data/copygc.c Kent Overstreet 2025-11-29 @583  		wake_up_process(c->copygc.thread);
7705b3d5de918b fs/bcachefs/data/copygc.c Kent Overstreet 2025-11-29  584  	}
1c6fdbd8f2465d fs/bcachefs/movinggc.c    Kent Overstreet 2017-03-16  585  
1c6fdbd8f2465d fs/bcachefs/movinggc.c    Kent Overstreet 2017-03-16  586  	return 0;
1c6fdbd8f2465d fs/bcachefs/movinggc.c    Kent Overstreet 2017-03-16  587  }
1c6fdbd8f2465d fs/bcachefs/movinggc.c    Kent Overstreet 2017-03-16  588  

:::::: The code at line 581 was first introduced by commit
:::::: cb70f3a81f829a0b9217057bb638905881dc02c1 bcachefs: struct bch_fs_ec, bch_fs_copygc

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

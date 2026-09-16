Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F1A3DE440
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Sep 2026 05:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789535881; cv=none; b=Dc7WXhno8wThLuk5/qJqfHKHD4OBCOQCojDe9bOQ33hkFG2Wa5OlTSouANRJCTKfW6XN3sWv2JJdmFB9gMuILF+y0jkb5sp2Y3L3qaVAfu78ZYyUjJn58IjC+1TeOQpbYgy8hpjr0blC+ee+c76h+v8LutPjX4Qf4a5UWSucsiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789535881; c=relaxed/simple;
	bh=fYPosjx1+8ieJFlE2L65DLJR42rogTwSrm9DpisWIlI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mdi6WCNea+yRgPOIp3VYZp/mhVzA/PSCTK300/ZMUT9rGeSbH7AjNbHo6OJJRiQUe3zSO17jQWGgtJge0mbcvYE13q96dwpyvTER4lOi/p0yCYnm48KhW2LdjijKmSwkcUMT5N9WzGTXgZ+I9LEHT2mzY/SlGlllHLaMv82ph2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TEFvIeXI; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TEFvIeXI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789535878; x=1821071878;
  h=date:from:to:cc:subject:message-id;
  bh=fYPosjx1+8ieJFlE2L65DLJR42rogTwSrm9DpisWIlI=;
  b=TEFvIeXIM24mr8DiXR7hDj3LgP++OnwFiawNuiEGoXR5v4tKLfHM1AuP
   m05ci2O/mkrqWOPwMqqSaA/IroWf34THh5ta/4Hkg9KWPhKsE5sBjfimb
   Y1+WnLRXEL5yw+bO1QkB0oqQT3/nEOZcU4mku1LYJltCUBWb/qYYWmu+2
   WbfJvOLO10kvCW67vY6XjZFUgU/3MUQVSDIQXZjkB9crq9R9v+DQDPWes
   s69RqHGdHXFTBudN0Pn/KiggFY7J0uI626iWJ+kIed0rJJrkIjVOV5ZDc
   flo64bNuQi7U6MQHlsrydyDImKzwNPXvy2AAARmi6wm0lBVYNTY+At9HD
   w==;
X-CSE-ConnectionGUID: juLYT8emTYOrcbyD3b3O+g==
X-CSE-MsgGUID: 1/RAqmbfQOyd4G6IG4b5xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107416573"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="107416573"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 22:17:57 -0700
X-CSE-ConnectionGUID: a0YbDUxTRQ2Kcgyeslt8WQ==
X-CSE-MsgGUID: HlI+hU2VTNuFPQX19T2zGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="267017288"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 Sep 2026 22:17:56 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6i1p-000000005X9-0QYy;
	Wed, 16 Sep 2026 05:17:53 +0000
Date: Wed, 16 Sep 2026 13:17:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:trace_sched_wakeup_backtrace 140/332]
 fs/bcachefs/data/copygc.c:581:34: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202609161357.3wdof49W-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs trace_sched_wakeup_backtrace
head:   9e7cbd4ad9c7a7ba461dbba9185628c006e200cd
commit: 88633d63152451a41ce7b7913e49ac6d6107c314 [140/332] bcachefs: Allocator now directly wakes up copygc when necessary
config: openrisc-randconfig-r112-20260915 (https://download.01.org/0day-ci/archive/20260916/202609161357.3wdof49W-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260916/202609161357.3wdof49W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609161357.3wdof49W-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/bcachefs/data/copygc.c:581:34: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct [noderef] __rcu *thread @@     got struct task_struct *t @@
   fs/bcachefs/data/copygc.c:581:34: sparse:     expected struct task_struct [noderef] __rcu *thread
   fs/bcachefs/data/copygc.c:581:34: sparse:     got struct task_struct *t
>> fs/bcachefs/data/copygc.c:583:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *thread @@
   fs/bcachefs/data/copygc.c:583:42: sparse:     expected struct task_struct *tsk
   fs/bcachefs/data/copygc.c:583:42: sparse:     got struct task_struct [noderef] __rcu *thread

vim +581 fs/bcachefs/data/copygc.c

1c6fdbd8f2465dd fs/bcachefs/movinggc.c    Kent Overstreet 2017-03-16  557  
e6d1161530bcd63 fs/bcachefs/movinggc.c    Kent Overstreet 2020-07-11  558  int bch2_copygc_start(struct bch_fs *c)
1c6fdbd8f2465dd fs/bcachefs/movinggc.c    Kent Overstreet 2017-03-16  559  {
1c6fdbd8f2465dd fs/bcachefs/movinggc.c    Kent Overstreet 2017-03-16  560  	if (c->opts.nochanges)
1c6fdbd8f2465dd fs/bcachefs/movinggc.c    Kent Overstreet 2017-03-16  561  		return 0;
1c6fdbd8f2465dd fs/bcachefs/movinggc.c    Kent Overstreet 2017-03-16  562  
1c6fdbd8f2465dd fs/bcachefs/movinggc.c    Kent Overstreet 2017-03-16  563  	if (bch2_fs_init_fault("copygc_start"))
1c6fdbd8f2465dd fs/bcachefs/movinggc.c    Kent Overstreet 2017-03-16  564  		return -ENOMEM;
1c6fdbd8f2465dd fs/bcachefs/movinggc.c    Kent Overstreet 2017-03-16  565  
7705b3d5de918bd fs/bcachefs/data/copygc.c Kent Overstreet 2025-11-29  566  	if (!c->copygc.wq &&
7705b3d5de918bd fs/bcachefs/data/copygc.c Kent Overstreet 2025-11-29  567  	    !(c->copygc.wq = alloc_workqueue("bcachefs_copygc",
7705b3d5de918bd fs/bcachefs/data/copygc.c Kent Overstreet 2025-11-29  568  				WQ_HIGHPRI|WQ_FREEZABLE|WQ_MEM_RECLAIM|WQ_CPU_INTENSIVE, 1)))
7705b3d5de918bd fs/bcachefs/data/copygc.c Kent Overstreet 2025-11-29  569  		return bch_err_throw(c, ENOMEM_fs_other_alloc);
7705b3d5de918bd fs/bcachefs/data/copygc.c Kent Overstreet 2025-11-29  570  
7705b3d5de918bd fs/bcachefs/data/copygc.c Kent Overstreet 2025-11-29  571  	if (!c->copygc.thread) {
7705b3d5de918bd fs/bcachefs/data/copygc.c Kent Overstreet 2025-11-29  572  		struct task_struct *t =
7705b3d5de918bd fs/bcachefs/data/copygc.c Kent Overstreet 2025-11-29  573  			kthread_create(bch2_copygc_thread, c, "bch-copygc/%s", c->name);
7705b3d5de918bd fs/bcachefs/data/copygc.c Kent Overstreet 2025-11-29  574  		int ret = PTR_ERR_OR_ZERO(t);
e46c181af9e230c fs/bcachefs/movinggc.c    Kent Overstreet 2023-09-11  575  		bch_err_msg(c, ret, "creating copygc thread");
cf904c8d964fa47 fs/bcachefs/movinggc.c    Kent Overstreet 2023-12-16  576  		if (ret)
d4bf5eecd78a90d fs/bcachefs/movinggc.c    Kent Overstreet 2022-07-18  577  			return ret;
1c6fdbd8f2465dd fs/bcachefs/movinggc.c    Kent Overstreet 2017-03-16  578  
1c6fdbd8f2465dd fs/bcachefs/movinggc.c    Kent Overstreet 2017-03-16  579  		get_task_struct(t);
1c6fdbd8f2465dd fs/bcachefs/movinggc.c    Kent Overstreet 2017-03-16  580  
cb70f3a81f829a0 fs/bcachefs/data/copygc.c Kent Overstreet 2025-11-29 @581  		c->copygc.thread = t;
88633d63152451a fs/bcachefs/data/copygc.c Kent Overstreet 2024-10-18  582  		rcu_assign_pointer(c->copygc.thread, t);
cb70f3a81f829a0 fs/bcachefs/data/copygc.c Kent Overstreet 2025-11-29 @583  		wake_up_process(c->copygc.thread);
7705b3d5de918bd fs/bcachefs/data/copygc.c Kent Overstreet 2025-11-29  584  	}
1c6fdbd8f2465dd fs/bcachefs/movinggc.c    Kent Overstreet 2017-03-16  585  
1c6fdbd8f2465dd fs/bcachefs/movinggc.c    Kent Overstreet 2017-03-16  586  	return 0;
1c6fdbd8f2465dd fs/bcachefs/movinggc.c    Kent Overstreet 2017-03-16  587  }
1c6fdbd8f2465dd fs/bcachefs/movinggc.c    Kent Overstreet 2017-03-16  588  

:::::: The code at line 581 was first introduced by commit
:::::: cb70f3a81f829a0b9217057bb638905881dc02c1 bcachefs: struct bch_fs_ec, bch_fs_copygc

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

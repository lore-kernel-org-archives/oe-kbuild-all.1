Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1105A26299
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Feb 2026 01:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771034224; cv=none; b=WXgQ3GXiAc+5ATjCuEsIohW9NfwXd634GBXbDVacCqv+uxqIXTNISpwUXiiEfgPNr9m5AaIb4t0M2PaDsOKT7Nm3PmWjPU42DOoc6iBZf26+JfiQyUn0jxyWZfWvqRe1cVIkir1IJAYq+EqjoyWh1yiuCBiQVGXSSPh0sHEOV2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771034224; c=relaxed/simple;
	bh=uEUhBTCr/mGenEk5V1ZjS0fzk7FvGJADZpTv1xFydLs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cUV4iUnf+s2G04ZCkmBlG424YRTsH6iKt09Tt2iySV7xOX9dUC76W1IBp/Fc0tuGKHH6/02Zn84AQUGG1/+JSnHv5ftmzY6TmkWb5UfNE4eChCVWTMTSZ48DD8v1mZPXFqOkq0pp+Bt+i7GwbEIX1w9AdS+xpDtrcrvuyS5sZ3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ewil3Bvb; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ewil3Bvb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771034223; x=1802570223;
  h=date:from:to:cc:subject:message-id;
  bh=uEUhBTCr/mGenEk5V1ZjS0fzk7FvGJADZpTv1xFydLs=;
  b=Ewil3BvbyRh5e24umLWWRyXGDdGLee9YPIfnKbxmogiI2oJm6GN8819u
   XeheAoenprkjdWBx+bkakHcQxrOerPWngNMRT/lXifAEf5+v3z08wdBmo
   FEYYMQxjak5e6lT6pFLzyqWdO6Sw4eURVZw7r7e0XBRZiEyyzSIGwhEBx
   wu2/YbJjMdg1bzkGCWFa+vnEthfuCA9JYaf8S0EFxNUy8glPXQ/7HvPAf
   FsTYR38sktmMbnnt1aICEjGBTRFj2rA483YzMSlzqF+lW4no6RUTXG9B5
   69ABJPca1AkneER8JGqf+88W+yANKAQImEa8TdkN/GyivkwEXYylDkhvX
   w==;
X-CSE-ConnectionGUID: OCUTqT3qSc+LZXRJNt84WQ==
X-CSE-MsgGUID: 3p58h5yhQOCFkyCJyXdeUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="72114833"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="72114833"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 17:57:02 -0800
X-CSE-ConnectionGUID: aKS6EtpOQpWaUa4R+IdSdw==
X-CSE-MsgGUID: ugDit8XwQAu+/4+5i34yhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="250745052"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Feb 2026 17:56:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr4u1-00000000w2U-3qyP;
	Sat, 14 Feb 2026 01:56:57 +0000
Date: Sat, 14 Feb 2026 09:56:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 140/387]
 fs/bcachefs/data/copygc.c:581:34: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202602140951.Mta6FVvv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   81724235384fc832cc568c7bf14bc604a22fc4ee
commit: 88633d63152451a41ce7b7913e49ac6d6107c314 [140/387] bcachefs: Allocator now directly wakes up copygc when necessary
config: parisc-randconfig-r134-20260214 (https://download.01.org/0day-ci/archive/20260214/202602140951.Mta6FVvv-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602140951.Mta6FVvv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602140951.Mta6FVvv-lkp@intel.com/

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

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED222623
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jul 2024 00:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719966752; cv=none; b=Rh3SkoP5mbvt4gaHDC2cBmaLl02++RuE9rp/pYEPc+GqgHSK1DrwAR7NVdOW2IjArHXkSKyP0yD+mKWh0eGY1uAXy7Ryg+LIVj+PYHZxmxuFwnRHJh3SCfZ6FfikMDmOYSopd5/6nHFW6oDGtkndAJLw4YFJAA72m20rctTCdO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719966752; c=relaxed/simple;
	bh=Hei4qscZoPJCJQT3mQkoFJ7P/1t4V1SMQ8U6hfXEZ6M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GAhVf1i+jh/kokkURwfbqTnYdgBH1ZSjhHI0/MmJUvJ2WDQkW+O9i79NUNa6dOAMCd2lA9aIL68mMQU8dqMHsmjPgrvctnrRodP3R/1Fp8vVNDrAdsbm4dct4X+qEnwDdqXXeERBeKiWz8nA+NK3bDfqJUcQRAFjeRWm9gi4COM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k/w3Cldb; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k/w3Cldb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719966750; x=1751502750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hei4qscZoPJCJQT3mQkoFJ7P/1t4V1SMQ8U6hfXEZ6M=;
  b=k/w3CldbjrRr8pNhSPfn3wRwt0K4TVuoL6PTnYi8voQowONidBjiP2jW
   dPCv0qoTmDJX6jIjmrDeKfu38DTepeVL9XgvSu2WIlnqrKu/cZBxHQmB2
   MzWuT48vF1IvKc/n4t4P/SYfqbyPgBnvdqRRptk+lyKq4cQfxxottG05O
   xEtvfpk+dbkvjZcVHdiRKbxXMn2H/5UX4IHLc5qc4g8pa5uKCbCcRgFBT
   ZXVBnZVxuUA495rHu4ty/q0hw4UuzLhq7Sg5J1hr4/c9U/PVIROYKytDp
   W+2/M8tC/4RG3DfhaMBAOVn+IhUVIyldXglm4iet27qsBvql0aIFqc/Hh
   w==;
X-CSE-ConnectionGUID: s0sHjnk4SeSUxxMlZQGf+Q==
X-CSE-MsgGUID: EXgeXkzRTHqu29CPpvBe3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="16896001"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="16896001"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 17:32:29 -0700
X-CSE-ConnectionGUID: A15nU7AvRXCHE8OkQd1NkA==
X-CSE-MsgGUID: 2Q794jPQSEOVAIzc6tpbzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="77228885"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Jul 2024 17:32:28 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOnv8-000P1C-1f;
	Wed, 03 Jul 2024 00:32:26 +0000
Date: Wed, 3 Jul 2024 08:31:49 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 48/154] fs/bcachefs/sysfs.c:444:42:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202407030803.OqBsyayc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   b869786d2e8f385020c647f06218cfae6c48ab79
commit: dd74fce05d1783abd351d944290be26eec77db7a [48/154] bcachefs: Allocator now directly wakes up copygc when necessary
config: x86_64-randconfig-122-20240703 (https://download.01.org/0day-ci/archive/20240703/202407030803.OqBsyayc-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407030803.OqBsyayc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407030803.OqBsyayc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/sysfs.c: note: in included file:
   fs/bcachefs/bcachefs.h:998:9: sparse: sparse: array of flexible structures
>> fs/bcachefs/sysfs.c:444:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *copygc_thread @@
   fs/bcachefs/sysfs.c:444:42: sparse:     expected struct task_struct *tsk
   fs/bcachefs/sysfs.c:444:42: sparse:     got struct task_struct [noderef] __rcu *copygc_thread

vim +444 fs/bcachefs/sysfs.c

1c6fdbd8f2465dd Kent Overstreet 2017-03-16  434  
1ada160618d66bc Kent Overstreet 2020-06-15  435  STORE(bch2_fs)
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  436  {
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  437  	struct bch_fs *c = container_of(kobj, struct bch_fs, kobj);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  438  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  439  	if (attr == &sysfs_copy_gc_enabled) {
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  440  		ssize_t ret = strtoul_safe(buf, c->copy_gc_enabled)
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  441  			?: (ssize_t) size;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  442  
e6d1161530bcd63 Kent Overstreet 2020-07-11  443  		if (c->copygc_thread)
e6d1161530bcd63 Kent Overstreet 2020-07-11 @444  			wake_up_process(c->copygc_thread);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  445  		return ret;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  446  	}
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  447  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  448  	if (attr == &sysfs_rebalance_enabled) {
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  449  		ssize_t ret = strtoul_safe(buf, c->rebalance.enabled)
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  450  			?: (ssize_t) size;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  451  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  452  		rebalance_wakeup(c);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  453  		return ret;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  454  	}
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  455  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  456  	sysfs_pd_controller_store(rebalance,	&c->rebalance.pd);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  457  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  458  	sysfs_strtoul(promote_whole_extents,	c->promote_whole_extents);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  459  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  460  	/* Debugging: */
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  461  
3c471b65889aa22 Kent Overstreet 2023-11-26  462  	if (!test_bit(BCH_FS_started, &c->flags))
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  463  		return -EPERM;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  464  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  465  	/* Debugging: */
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  466  
bdae2a7e6020e1c Kent Overstreet 2024-04-13  467  	if (!bch2_write_ref_tryget(c, BCH_WRITE_REF_sysfs))
c45c866761671dd Kent Overstreet 2021-12-24  468  		return -EROFS;
c45c866761671dd Kent Overstreet 2021-12-24  469  
5147b9ae7687589 Kent Overstreet 2024-04-20  470  	if (attr == &sysfs_trigger_btree_cache_shrink) {
c45c866761671dd Kent Overstreet 2021-12-24  471  		struct shrink_control sc;
c45c866761671dd Kent Overstreet 2021-12-24  472  
c45c866761671dd Kent Overstreet 2021-12-24  473  		sc.gfp_mask = GFP_KERNEL;
c45c866761671dd Kent Overstreet 2021-12-24  474  		sc.nr_to_scan = strtoul_or_return(buf);
ecae0bd5173b101 Linus Torvalds  2023-11-02  475  		c->btree_cache.shrink->scan_objects(c->btree_cache.shrink, &sc);
c45c866761671dd Kent Overstreet 2021-12-24  476  	}
c45c866761671dd Kent Overstreet 2021-12-24  477  
5147b9ae7687589 Kent Overstreet 2024-04-20  478  	if (attr == &sysfs_trigger_btree_key_cache_shrink) {
5147b9ae7687589 Kent Overstreet 2024-04-20  479  		struct shrink_control sc;
5147b9ae7687589 Kent Overstreet 2024-04-20  480  
5147b9ae7687589 Kent Overstreet 2024-04-20  481  		sc.gfp_mask = GFP_KERNEL;
5147b9ae7687589 Kent Overstreet 2024-04-20  482  		sc.nr_to_scan = strtoul_or_return(buf);
5147b9ae7687589 Kent Overstreet 2024-04-20  483  		c->btree_key_cache.shrink->scan_objects(c->btree_cache.shrink, &sc);
5147b9ae7687589 Kent Overstreet 2024-04-20  484  	}
b8eec675912ecb7 Kent Overstreet 2022-09-17  485  
68e142405cf4cf0 Kent Overstreet 2024-04-06  486  	if (attr == &sysfs_trigger_gc)
451570a5bc5f72c Kent Overstreet 2020-06-15  487  		bch2_gc_gens(c);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  488  
8058ea64c31c870 Kent Overstreet 2022-04-07  489  	if (attr == &sysfs_trigger_discards)
8058ea64c31c870 Kent Overstreet 2022-04-07  490  		bch2_do_discards(c);
8058ea64c31c870 Kent Overstreet 2022-04-07  491  
0e96f5dcd7ff678 Kent Overstreet 2022-06-13  492  	if (attr == &sysfs_trigger_invalidates)
0e96f5dcd7ff678 Kent Overstreet 2022-06-13  493  		bch2_do_invalidates(c);
0e96f5dcd7ff678 Kent Overstreet 2022-06-13  494  
bdae2a7e6020e1c Kent Overstreet 2024-04-13  495  	if (attr == &sysfs_trigger_journal_flush) {
bdae2a7e6020e1c Kent Overstreet 2024-04-13  496  		bch2_journal_flush_all_pins(&c->journal);
bdae2a7e6020e1c Kent Overstreet 2024-04-13  497  		bch2_journal_meta(&c->journal);
bdae2a7e6020e1c Kent Overstreet 2024-04-13  498  	}
bdae2a7e6020e1c Kent Overstreet 2024-04-13  499  

:::::: The code at line 444 was first introduced by commit
:::::: e6d1161530bcd632ad10b6aa0ad511abb146dbcc bcachefs: Make copygc thread global

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

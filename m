Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C688192B71
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Oct 2024 20:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729457149; cv=none; b=SJYkwSD8/fhOCre31vwmv9qhqOFuS84cBtkjoJmgQG2FVEb53LIW/ZZAncIEKjK3dyFLqCw8HPURn3S34Do7bOH1lnKvwGyE9/aQttuXJ638ABiGEu7GFXBtjFZKfwI4jPjCB+T2axyb6l7uuF2JCQMBlHfXn6QNxUiQjoH8jyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729457149; c=relaxed/simple;
	bh=UJ59FFC+0AtsyxpLNrtGM1s0i7COA7qOV5msg802OhI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UVxYTcwgfTa5fa8eYEsOlxsFdIYOWFB/rvz8HpzvbJ4pri75K6+Se6XRK7VQec/+sf4z0VhMeRzL61Kpj2PE/9q1atgYzAxATQ/WadXxTqH70jZOduwfEOr0XIwJs99kIbLF911BQThy3jau9jFCJN369/qa6sVGLgXSJv8cXx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DxbydaAD; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DxbydaAD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729457147; x=1760993147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UJ59FFC+0AtsyxpLNrtGM1s0i7COA7qOV5msg802OhI=;
  b=DxbydaADgDnzsyIszJga4vGRDsItyZk0aY0Jl+7OOj+39ydYhtfxyCIe
   QLOh87w0KZqWt5ubrp6gh2oe+/WZwcsLD9xKIy4Vk1rRb4cABbqYQwa2n
   xZFgndSSIO56CgoaAvsBOiHIJAngT7jIdFAGcBaZrz1fuhhuBuqX8H7sg
   PHPfVKgS+EIZnNb3q13e9HZXG8ks1aMRl+z5vL4RH6noW1wXLzk4OO5Z6
   ruOzMFu+UV+yGtMNNM6sc5/dM9FkrgJ4moS/tEQMu3eVn1V93PM2Bg7HW
   4gPBQikTqP9ktd9HbeRzSGDc8eSQWP/tA7SrLYRzMwTzynOeTJJ+ThZLn
   w==;
X-CSE-ConnectionGUID: IG0n9dRXRCGC4I4QxzCSJg==
X-CSE-MsgGUID: F3NkCgoIQ9yiyf06bA98xA==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="28811026"
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="28811026"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 13:45:46 -0700
X-CSE-ConnectionGUID: vKa0iMu1TJOY4+N6SKBwgQ==
X-CSE-MsgGUID: eHVxnPNxQLuTDVqsMRlDLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="84399260"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Oct 2024 13:45:45 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2co3-000QnE-0P;
	Sun, 20 Oct 2024 20:45:43 +0000
Date: Mon, 21 Oct 2024 04:45:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 68/106]
 fs/bcachefs/sysfs.c:426:42: sparse: sparse: incorrect type in argument 1
 (different address spaces)
Message-ID: <202410210410.yQbCseaZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   1ea1b6b00bf8140fea10830567c5f34b600bb774
commit: 16acec50b816558b6c994051237bb1ce8bee2d18 [68/106] bcachefs: Allocator now directly wakes up copygc when necessary
config: x86_64-randconfig-123-20241021 (https://download.01.org/0day-ci/archive/20241021/202410210410.yQbCseaZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241021/202410210410.yQbCseaZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410210410.yQbCseaZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/sysfs.c: note: in included file:
   fs/bcachefs/bcachefs.h:998:9: sparse: sparse: array of flexible structures
>> fs/bcachefs/sysfs.c:426:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *copygc_thread @@
   fs/bcachefs/sysfs.c:426:42: sparse:     expected struct task_struct *tsk
   fs/bcachefs/sysfs.c:426:42: sparse:     got struct task_struct [noderef] __rcu *copygc_thread

vim +426 fs/bcachefs/sysfs.c

1c6fdbd8f2465d Kent Overstreet 2017-03-16  416  
1ada160618d66b Kent Overstreet 2020-06-15  417  STORE(bch2_fs)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  418  {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  419  	struct bch_fs *c = container_of(kobj, struct bch_fs, kobj);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  420  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  421  	if (attr == &sysfs_copy_gc_enabled) {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  422  		ssize_t ret = strtoul_safe(buf, c->copy_gc_enabled)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  423  			?: (ssize_t) size;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  424  
e6d1161530bcd6 Kent Overstreet 2020-07-11  425  		if (c->copygc_thread)
e6d1161530bcd6 Kent Overstreet 2020-07-11 @426  			wake_up_process(c->copygc_thread);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  427  		return ret;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  428  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  429  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  430  	if (attr == &sysfs_rebalance_enabled) {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  431  		ssize_t ret = strtoul_safe(buf, c->rebalance.enabled)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  432  			?: (ssize_t) size;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  433  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  434  		rebalance_wakeup(c);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  435  		return ret;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  436  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  437  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  438  	sysfs_pd_controller_store(rebalance,	&c->rebalance.pd);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  439  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  440  	/* Debugging: */
1c6fdbd8f2465d Kent Overstreet 2017-03-16  441  
3c471b65889aa2 Kent Overstreet 2023-11-26  442  	if (!test_bit(BCH_FS_started, &c->flags))
1c6fdbd8f2465d Kent Overstreet 2017-03-16  443  		return -EPERM;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  444  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  445  	/* Debugging: */
1c6fdbd8f2465d Kent Overstreet 2017-03-16  446  
bdae2a7e6020e1 Kent Overstreet 2024-04-13  447  	if (!bch2_write_ref_tryget(c, BCH_WRITE_REF_sysfs))
c45c866761671d Kent Overstreet 2021-12-24  448  		return -EROFS;
c45c866761671d Kent Overstreet 2021-12-24  449  
5147b9ae768758 Kent Overstreet 2024-04-20  450  	if (attr == &sysfs_trigger_btree_cache_shrink) {
7a51608d012546 Kent Overstreet 2024-09-04  451  		struct btree_cache *bc = &c->btree_cache;
c45c866761671d Kent Overstreet 2021-12-24  452  		struct shrink_control sc;
c45c866761671d Kent Overstreet 2021-12-24  453  
c45c866761671d Kent Overstreet 2021-12-24  454  		sc.gfp_mask = GFP_KERNEL;
c45c866761671d Kent Overstreet 2021-12-24  455  		sc.nr_to_scan = strtoul_or_return(buf);
7a51608d012546 Kent Overstreet 2024-09-04  456  		bc->live[0].shrink->scan_objects(bc->live[0].shrink, &sc);
c45c866761671d Kent Overstreet 2021-12-24  457  	}
c45c866761671d Kent Overstreet 2021-12-24  458  
5147b9ae768758 Kent Overstreet 2024-04-20  459  	if (attr == &sysfs_trigger_btree_key_cache_shrink) {
5147b9ae768758 Kent Overstreet 2024-04-20  460  		struct shrink_control sc;
5147b9ae768758 Kent Overstreet 2024-04-20  461  
5147b9ae768758 Kent Overstreet 2024-04-20  462  		sc.gfp_mask = GFP_KERNEL;
5147b9ae768758 Kent Overstreet 2024-04-20  463  		sc.nr_to_scan = strtoul_or_return(buf);
2c377d8a71db32 Kent Overstreet 2024-09-05  464  		c->btree_key_cache.shrink->scan_objects(c->btree_key_cache.shrink, &sc);
5147b9ae768758 Kent Overstreet 2024-04-20  465  	}
b8eec675912ecb Kent Overstreet 2022-09-17  466  
68e142405cf4cf Kent Overstreet 2024-04-06  467  	if (attr == &sysfs_trigger_gc)
451570a5bc5f72 Kent Overstreet 2020-06-15  468  		bch2_gc_gens(c);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  469  
8058ea64c31c87 Kent Overstreet 2022-04-07  470  	if (attr == &sysfs_trigger_discards)
8058ea64c31c87 Kent Overstreet 2022-04-07  471  		bch2_do_discards(c);
8058ea64c31c87 Kent Overstreet 2022-04-07  472  
0e96f5dcd7ff67 Kent Overstreet 2022-06-13  473  	if (attr == &sysfs_trigger_invalidates)
0e96f5dcd7ff67 Kent Overstreet 2022-06-13  474  		bch2_do_invalidates(c);
0e96f5dcd7ff67 Kent Overstreet 2022-06-13  475  
bdae2a7e6020e1 Kent Overstreet 2024-04-13  476  	if (attr == &sysfs_trigger_journal_flush) {
bdae2a7e6020e1 Kent Overstreet 2024-04-13  477  		bch2_journal_flush_all_pins(&c->journal);
bdae2a7e6020e1 Kent Overstreet 2024-04-13  478  		bch2_journal_meta(&c->journal);
bdae2a7e6020e1 Kent Overstreet 2024-04-13  479  	}
bdae2a7e6020e1 Kent Overstreet 2024-04-13  480  
a1e7a97f22bf68 Kent Overstreet 2024-06-28  481  	if (attr == &sysfs_trigger_journal_writes)
a1e7a97f22bf68 Kent Overstreet 2024-06-28  482  		bch2_journal_do_writes(&c->journal);
a1e7a97f22bf68 Kent Overstreet 2024-06-28  483  
d06a26d24db090 Kent Overstreet 2024-07-11  484  	if (attr == &sysfs_trigger_freelist_wakeup)
d06a26d24db090 Kent Overstreet 2024-07-11  485  		closure_wake_up(&c->freelist_wait);
d06a26d24db090 Kent Overstreet 2024-07-11  486  

:::::: The code at line 426 was first introduced by commit
:::::: e6d1161530bcd632ad10b6aa0ad511abb146dbcc bcachefs: Make copygc thread global

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

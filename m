Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9DB18FC9F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 05:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739512589; cv=none; b=O9+wvM0JkDsHvNIMD+1OuxEdpynl70XmrKDeSdv0F3pSQbI87N+3yN8dCLN4BngSZJs/+CSAFaq9z2wYAlEldu38NWl/w4LwiT4/4cBwdXLOlRtksniJfLCm2wYSgbj5njqiSueJqT/btdzb42Jh0/bcfi6pT8yZOS+dvbuup+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739512589; c=relaxed/simple;
	bh=fT9g61+vXIzYb+wgp/15Qf6aJDBc0KjoRrWATDJPRbI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G8nmT3+wAP8mo1F29OV5gzCQ/V6UHcQglXp5cSJ4Tmt7JjNWzBmySxc8cWtZatrSbYsnR/Ovys++ZNh1f7gatC+BwazBldh++TxqjxMOwv8y6x3Je8Us/qRM2mJSYgNtAmJ14NHWKhyhif5oFnTJMDwcn4kY8mJreAcrE1gXKew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HgUAzu77; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HgUAzu77"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739512587; x=1771048587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fT9g61+vXIzYb+wgp/15Qf6aJDBc0KjoRrWATDJPRbI=;
  b=HgUAzu77+agKJKMeyl0agN3oljx9q4WVw9I6b51/wipe7XY5fH6pqBW5
   f7GOij2TTUf6fK/4uNmNm+c9L9ypWIZb7g0ggkCA2uHG/ff8apCYVCmvv
   0O+d5dHXMO+qhfc8EURjtntMTxCYjH54DSHrj4FclFb9tfxd7bJVouaJg
   6vpAkndOCs0mWopdMYhrSSdnxFqPUtqwVRFCH6yc+ITjXxQA5h6genYyP
   YlH2yJ2bGoAq6bgl7HEfPTHZnGL0J8cJQ0ovZi+MG18JjHuLBGxZ58NK5
   fDJL3hpNMztY1Xj3uxIJGDG5U7KTLRQhL8+GG6nEU/pIhWmOvLCarfzEj
   A==;
X-CSE-ConnectionGUID: UenVblvGRluWSt/E5EnvBw==
X-CSE-MsgGUID: k2d7equ8TeGwWDr8J6ePwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="50878533"
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; 
   d="scan'208";a="50878533"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 21:56:24 -0800
X-CSE-ConnectionGUID: 1Ie+RN9vRsqlylJwWg2wJg==
X-CSE-MsgGUID: nNDCOjjXT06zI//YihDfKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; 
   d="scan'208";a="113547009"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Feb 2025 21:56:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiogX-00197t-0k;
	Fri, 14 Feb 2025 05:56:21 +0000
Date: Fri, 14 Feb 2025 13:55:25 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis/dev 24/26] lib/rhashtable.c:1044:9: sparse:
 sparse: incorrect type in argument 1 (different base types)
Message-ID: <202502141338.0BkD4OJ1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   9c8d14ce8aff2d38bf494f5d5436a302e3236842
commit: ceabb5fc7296d7eb499e124f402584ce3e90c7ff [24/26] rhashtable: Enable capability analysis
config: i386-randconfig-r123-20250214 (https://download.01.org/0day-ci/archive/20250214/202502141338.0BkD4OJ1-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502141338.0BkD4OJ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502141338.0BkD4OJ1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/rhashtable.c: note: in included file (through include/linux/rhashtable.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assert_shared_cap'
   lib/rhashtable.c: note: in included file (through include/linux/workqueue.h, include/linux/rhashtable.h):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   lib/rhashtable.c: note: in included file (through include/linux/rhashtable.h):
   include/linux/bit_spinlock.h:19:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   lib/rhashtable.c: note: in included file (through include/linux/rhashtable.h):
   include/linux/bit_spinlock.h:19:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__try_acquire_cap'
   lib/rhashtable.c: note: in included file (through include/linux/rhashtable.h):
   include/linux/bit_spinlock.h:19:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_cap'
   lib/rhashtable.c: note: in included file (through include/linux/rhashtable.h):
   include/linux/bit_spinlock.h:19:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__release_cap'
   lib/rhashtable.c: note: in included file (through include/linux/rhashtable.h):
   include/linux/bit_spinlock.h:19:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   lib/rhashtable.c: note: in included file (through include/linux/rhashtable.h):
   include/linux/bit_spinlock.h:19:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__assert_cap'
   lib/rhashtable.c: note: in included file (through include/linux/rhashtable.h):
   include/linux/bit_spinlock.h:19:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__assert_shared_cap'
   lib/rhashtable.c: note: in included file (through include/linux/rhashtable.h):
   include/linux/bit_spinlock.h:19:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   lib/rhashtable.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   lib/rhashtable.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_cap'
   lib/rhashtable.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_cap'
   lib/rhashtable.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_cap'
   lib/rhashtable.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   lib/rhashtable.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assert_cap'
   lib/rhashtable.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assert_shared_cap'
   lib/rhashtable.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:11:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:11:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:11:1: sparse: sparse: multiple definitions for function '__try_acquire_cap'
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:11:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_cap'
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:11:1: sparse: sparse: multiple definitions for function '__release_cap'
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:11:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:11:1: sparse: sparse: multiple definitions for function '__assert_cap'
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:11:1: sparse: sparse: multiple definitions for function '__assert_shared_cap'
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
>> lib/rhashtable.c:1044:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_lock const *var @@     got struct mutex * @@
   lib/rhashtable.c:1044:9: sparse:     expected struct local_lock const *var
   lib/rhashtable.c:1044:9: sparse:     got struct mutex *
>> lib/rhashtable.c:1045:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_lock const *var @@     got struct spinlock * @@
   lib/rhashtable.c:1045:9: sparse:     expected struct local_lock const *var
   lib/rhashtable.c:1045:9: sparse:     got struct spinlock *
   lib/rhashtable.c: note: in included file (through include/linux/workqueue.h, include/linux/rhashtable.h):
   include/linux/rcupdate.h:891:9: sparse: sparse: context imbalance in 'rhashtable_walk_stop' - unexpected unlock

vim +1044 lib/rhashtable.c

31ccde2dacea83 Herbert Xu       2015-03-24   990  
7e1e77636e3607 Thomas Graf      2014-08-02   991  /**
7e1e77636e3607 Thomas Graf      2014-08-02   992   * rhashtable_init - initialize a new hash table
7e1e77636e3607 Thomas Graf      2014-08-02   993   * @ht:		hash table to be initialized
7e1e77636e3607 Thomas Graf      2014-08-02   994   * @params:	configuration parameters
7e1e77636e3607 Thomas Graf      2014-08-02   995   *
7e1e77636e3607 Thomas Graf      2014-08-02   996   * Initializes a new hash table based on the provided configuration
7e1e77636e3607 Thomas Graf      2014-08-02   997   * parameters. A table can be configured either with a variable or
7e1e77636e3607 Thomas Graf      2014-08-02   998   * fixed length key:
7e1e77636e3607 Thomas Graf      2014-08-02   999   *
7e1e77636e3607 Thomas Graf      2014-08-02  1000   * Configuration Example 1: Fixed length keys
7e1e77636e3607 Thomas Graf      2014-08-02  1001   * struct test_obj {
7e1e77636e3607 Thomas Graf      2014-08-02  1002   *	int			key;
7e1e77636e3607 Thomas Graf      2014-08-02  1003   *	void *			my_member;
7e1e77636e3607 Thomas Graf      2014-08-02  1004   *	struct rhash_head	node;
7e1e77636e3607 Thomas Graf      2014-08-02  1005   * };
7e1e77636e3607 Thomas Graf      2014-08-02  1006   *
7e1e77636e3607 Thomas Graf      2014-08-02  1007   * struct rhashtable_params params = {
7e1e77636e3607 Thomas Graf      2014-08-02  1008   *	.head_offset = offsetof(struct test_obj, node),
7e1e77636e3607 Thomas Graf      2014-08-02  1009   *	.key_offset = offsetof(struct test_obj, key),
7e1e77636e3607 Thomas Graf      2014-08-02  1010   *	.key_len = sizeof(int),
87545899b52f9c Daniel Borkmann  2014-12-10  1011   *	.hashfn = jhash,
7e1e77636e3607 Thomas Graf      2014-08-02  1012   * };
7e1e77636e3607 Thomas Graf      2014-08-02  1013   *
7e1e77636e3607 Thomas Graf      2014-08-02  1014   * Configuration Example 2: Variable length keys
7e1e77636e3607 Thomas Graf      2014-08-02  1015   * struct test_obj {
7e1e77636e3607 Thomas Graf      2014-08-02  1016   *	[...]
7e1e77636e3607 Thomas Graf      2014-08-02  1017   *	struct rhash_head	node;
7e1e77636e3607 Thomas Graf      2014-08-02  1018   * };
7e1e77636e3607 Thomas Graf      2014-08-02  1019   *
49f7b33e63fec9 Patrick McHardy  2015-03-25  1020   * u32 my_hash_fn(const void *data, u32 len, u32 seed)
7e1e77636e3607 Thomas Graf      2014-08-02  1021   * {
7e1e77636e3607 Thomas Graf      2014-08-02  1022   *	struct test_obj *obj = data;
7e1e77636e3607 Thomas Graf      2014-08-02  1023   *
7e1e77636e3607 Thomas Graf      2014-08-02  1024   *	return [... hash ...];
7e1e77636e3607 Thomas Graf      2014-08-02  1025   * }
7e1e77636e3607 Thomas Graf      2014-08-02  1026   *
7e1e77636e3607 Thomas Graf      2014-08-02  1027   * struct rhashtable_params params = {
7e1e77636e3607 Thomas Graf      2014-08-02  1028   *	.head_offset = offsetof(struct test_obj, node),
87545899b52f9c Daniel Borkmann  2014-12-10  1029   *	.hashfn = jhash,
7e1e77636e3607 Thomas Graf      2014-08-02  1030   *	.obj_hashfn = my_hash_fn,
7e1e77636e3607 Thomas Graf      2014-08-02  1031   * };
7e1e77636e3607 Thomas Graf      2014-08-02  1032   */
9e54dd8b64dccd Kent Overstreet  2024-03-21  1033  int rhashtable_init_noprof(struct rhashtable *ht,
488fb86ee91d3b Herbert Xu       2015-03-20  1034  		    const struct rhashtable_params *params)
7e1e77636e3607 Thomas Graf      2014-08-02  1035  {
7e1e77636e3607 Thomas Graf      2014-08-02  1036  	struct bucket_table *tbl;
7e1e77636e3607 Thomas Graf      2014-08-02  1037  	size_t size;
7e1e77636e3607 Thomas Graf      2014-08-02  1038  
31ccde2dacea83 Herbert Xu       2015-03-24  1039  	if ((!params->key_len && !params->obj_hashfn) ||
02fd97c3d4a8a1 Herbert Xu       2015-03-20  1040  	    (params->obj_hashfn && !params->obj_cmpfn))
7e1e77636e3607 Thomas Graf      2014-08-02  1041  		return -EINVAL;
7e1e77636e3607 Thomas Graf      2014-08-02  1042  
97defe1ecf868b Thomas Graf      2015-01-02  1043  	memset(ht, 0, sizeof(*ht));
97defe1ecf868b Thomas Graf      2015-01-02 @1044  	mutex_init(&ht->mutex);
ba7c95ea3870fe Herbert Xu       2015-03-24 @1045  	spin_lock_init(&ht->lock);
97defe1ecf868b Thomas Graf      2015-01-02  1046  	memcpy(&ht->p, params, sizeof(*params));
97defe1ecf868b Thomas Graf      2015-01-02  1047  
9e54dd8b64dccd Kent Overstreet  2024-03-21  1048  	alloc_tag_record(ht->alloc_tag);
9e54dd8b64dccd Kent Overstreet  2024-03-21  1049  
a998f712f77ea4 Thomas Graf      2015-03-19  1050  	if (params->min_size)
a998f712f77ea4 Thomas Graf      2015-03-19  1051  		ht->p.min_size = roundup_pow_of_two(params->min_size);
a998f712f77ea4 Thomas Graf      2015-03-19  1052  
6d684e54690cae Herbert Xu       2017-04-27  1053  	/* Cap total entries at 2^31 to avoid nelems overflow. */
6d684e54690cae Herbert Xu       2017-04-27  1054  	ht->max_elems = 1u << 31;
2d2ab658d2debc Herbert Xu       2017-04-28  1055  
2d2ab658d2debc Herbert Xu       2017-04-28  1056  	if (params->max_size) {
2d2ab658d2debc Herbert Xu       2017-04-28  1057  		ht->p.max_size = rounddown_pow_of_two(params->max_size);
6d684e54690cae Herbert Xu       2017-04-27  1058  		if (ht->p.max_size < ht->max_elems / 2)
6d684e54690cae Herbert Xu       2017-04-27  1059  			ht->max_elems = ht->p.max_size * 2;
2d2ab658d2debc Herbert Xu       2017-04-28  1060  	}
6d684e54690cae Herbert Xu       2017-04-27  1061  
48e75b430670eb Florian Westphal 2017-05-01  1062  	ht->p.min_size = max_t(u16, ht->p.min_size, HASH_MIN_SIZE);
a998f712f77ea4 Thomas Graf      2015-03-19  1063  
3a324606bbabfc Herbert Xu       2015-12-16  1064  	size = rounded_hashtable_size(&ht->p);
3a324606bbabfc Herbert Xu       2015-12-16  1065  
31ccde2dacea83 Herbert Xu       2015-03-24  1066  	ht->key_len = ht->p.key_len;
31ccde2dacea83 Herbert Xu       2015-03-24  1067  	if (!params->hashfn) {
31ccde2dacea83 Herbert Xu       2015-03-24  1068  		ht->p.hashfn = jhash;
31ccde2dacea83 Herbert Xu       2015-03-24  1069  
31ccde2dacea83 Herbert Xu       2015-03-24  1070  		if (!(ht->key_len & (sizeof(u32) - 1))) {
31ccde2dacea83 Herbert Xu       2015-03-24  1071  			ht->key_len /= sizeof(u32);
31ccde2dacea83 Herbert Xu       2015-03-24  1072  			ht->p.hashfn = rhashtable_jhash2;
31ccde2dacea83 Herbert Xu       2015-03-24  1073  		}
31ccde2dacea83 Herbert Xu       2015-03-24  1074  	}
31ccde2dacea83 Herbert Xu       2015-03-24  1075  
2d22ecf6db1c39 Davidlohr Bueso  2018-08-21  1076  	/*
2d22ecf6db1c39 Davidlohr Bueso  2018-08-21  1077  	 * This is api initialization and thus we need to guarantee the
2d22ecf6db1c39 Davidlohr Bueso  2018-08-21  1078  	 * initial rhashtable allocation. Upon failure, retry with the
2d22ecf6db1c39 Davidlohr Bueso  2018-08-21  1079  	 * smallest possible size with __GFP_NOFAIL semantics.
2d22ecf6db1c39 Davidlohr Bueso  2018-08-21  1080  	 */
b9ecfdaa1090b5 Herbert Xu       2015-03-24  1081  	tbl = bucket_table_alloc(ht, size, GFP_KERNEL);
2d22ecf6db1c39 Davidlohr Bueso  2018-08-21  1082  	if (unlikely(tbl == NULL)) {
2d22ecf6db1c39 Davidlohr Bueso  2018-08-21  1083  		size = max_t(u16, ht->p.min_size, HASH_MIN_SIZE);
2d22ecf6db1c39 Davidlohr Bueso  2018-08-21  1084  		tbl = bucket_table_alloc(ht, size, GFP_KERNEL | __GFP_NOFAIL);
2d22ecf6db1c39 Davidlohr Bueso  2018-08-21  1085  	}
7e1e77636e3607 Thomas Graf      2014-08-02  1086  
545a148e43bed6 Ying Xue         2015-01-07  1087  	atomic_set(&ht->nelems, 0);
a5b6846f9e1a08 Daniel Borkmann  2015-03-12  1088  
7e1e77636e3607 Thomas Graf      2014-08-02  1089  	RCU_INIT_POINTER(ht->tbl, tbl);
7e1e77636e3607 Thomas Graf      2014-08-02  1090  
57699a40b4f269 Ying Xue         2015-01-16  1091  	INIT_WORK(&ht->run_work, rht_deferred_worker);
97defe1ecf868b Thomas Graf      2015-01-02  1092  
7e1e77636e3607 Thomas Graf      2014-08-02  1093  	return 0;
7e1e77636e3607 Thomas Graf      2014-08-02  1094  }
9e54dd8b64dccd Kent Overstreet  2024-03-21  1095  EXPORT_SYMBOL_GPL(rhashtable_init_noprof);
7e1e77636e3607 Thomas Graf      2014-08-02  1096  

:::::: The code at line 1044 was first introduced by commit
:::::: 97defe1ecf868b8127f8e62395499d6a06e4c4b1 rhashtable: Per bucket locks & deferred expansion/shrinking

:::::: TO: Thomas Graf <tgraf@suug.ch>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

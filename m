Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CEF346AD5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 19:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766519656; cv=none; b=PeefVEnusLdpLJ4GinO2AjxRJv3wGRumSTcda3eJceDd37LIcdOfalSsqiLwWgvOR65uRqCB80bhnJPNBzw4L7ZeFV19m3VjDX3pI9PsHsCKlOrkK0fgsbe3gEJqS6Yyw2Ccad1nvXsNt07USIxwW9YSbznh/7kylQ4Ofl3ZmLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766519656; c=relaxed/simple;
	bh=V+vm1B1+HXsii4rCr/uEOZKP1NMQA1OJjuQGdM4AmwM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fou0k5YlhzphJdCmhsLJ03wSX+RqFsFrz7eeprR2uNld1L3HYBBJtunwUZFjb2AXby7DpXS/05I3IyPy5HeLXX4AueRDXO0JpzLz7DVmSZtbguMyaUXjUb+Bh4Ef1EN5RzUelSvF2zvxEdin3FosJf36KOOLeiV7qs3CS5P3KN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CRJmj7fJ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CRJmj7fJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766519653; x=1798055653;
  h=date:from:to:cc:subject:message-id;
  bh=V+vm1B1+HXsii4rCr/uEOZKP1NMQA1OJjuQGdM4AmwM=;
  b=CRJmj7fJEbDOj6Ve81IFN1PVTmmT5TsNDjKCZJxFhpVoFh+uo0ee3qbT
   +nB7FHS1712fEeSV5ST+8NdowfBOntGg6RVtNVWfb1Lt6NFIYOEWJT52V
   hfnQxDIEQhZf/687PClcZeZlxe9npwIktn/ctw/jlK6Js40YTozBK6WDE
   CWY2KKQLu9hQ6epWyr/lA7eaHEaV1RZh3IHXfmAoWe8fPA+sGwibJBxNz
   eiyPN1gDpVNEoN2GW0AFhJ6v/o1UPoW2zWG1gplXyi93O3ebui0p8fcyQ
   7Iz1O2fiPMwjJ8yI8QZDQraG8kE2y/aTQA0cfunIBzP0dppUoQb2dPqBg
   g==;
X-CSE-ConnectionGUID: tUl6s1mkSAuIw4aaRge6Cg==
X-CSE-MsgGUID: JIFKYfbfRwi6uOkB1XBEsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="79005858"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="79005858"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 11:54:12 -0800
X-CSE-ConnectionGUID: 5BWREx28Qt+gt09SynsYFQ==
X-CSE-MsgGUID: 1+DuO6/AQvSFdtukr7u9Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="223340684"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 23 Dec 2025 11:54:10 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY8SI-000000002KF-18oJ;
	Tue, 23 Dec 2025 19:54:03 +0000
Date: Wed, 24 Dec 2025 03:53:13 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Elver <elver@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:locking/core 35/39] lib/rhashtable.c:1039:9:
 sparse: sparse: incorrect type in argument 1 (different base types)
Message-ID: <202512240338.nJ7MXrMz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
head:   77b4ebc9e43b02f3c50dab48963d969964ea83ef
commit: 078d1288b6dd1f2d9ecff5021861beada37b5133 [35/39] rhashtable: Enable context analysis
config: um-randconfig-r134-20251223 (https://download.01.org/0day-ci/archive/20251224/202512240338.nJ7MXrMz-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512240338.nJ7MXrMz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512240338.nJ7MXrMz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_ctx_lock'
   lib/rhashtable.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_lock'
   lib/rhashtable.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_ctx_lock'
   lib/rhashtable.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_lock'
   lib/rhashtable.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__acquire_ctx_lock'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_lock'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_lock'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_lock'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__release_ctx_lock'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_lock'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__assume_ctx_lock'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_lock'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:332:40: sparse: sparse: multiple definitions for function '__this_cpu_local_lock'
   include/linux/local_lock_internal.h:326:37: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_ctx_lock'
   lib/rhashtable.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_lock'
   lib/rhashtable.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_lock'
   lib/rhashtable.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_lock'
   lib/rhashtable.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_ctx_lock'
   lib/rhashtable.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_lock'
   lib/rhashtable.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_ctx_lock'
   lib/rhashtable.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_lock'
   lib/rhashtable.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/mm.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_ctx_lock'
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/mm.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_lock'
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/mm.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_lock'
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/mm.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_lock'
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/mm.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_ctx_lock'
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/mm.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_lock'
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/mm.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_ctx_lock'
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/mm.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_lock'
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
>> lib/rhashtable.c:1039:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct mutex * @@
   lib/rhashtable.c:1039:9: sparse:     expected struct __context_bitlock const *var
   lib/rhashtable.c:1039:9: sparse:     got struct mutex *
>> lib/rhashtable.c:1040:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct spinlock * @@
   lib/rhashtable.c:1040:9: sparse:     expected struct __context_bitlock const *var
   lib/rhashtable.c:1040:9: sparse:     got struct spinlock *

vim +1039 lib/rhashtable.c

31ccde2dacea837 Herbert Xu       2015-03-24   985  
7e1e77636e36075 Thomas Graf      2014-08-02   986  /**
7e1e77636e36075 Thomas Graf      2014-08-02   987   * rhashtable_init - initialize a new hash table
7e1e77636e36075 Thomas Graf      2014-08-02   988   * @ht:		hash table to be initialized
7e1e77636e36075 Thomas Graf      2014-08-02   989   * @params:	configuration parameters
7e1e77636e36075 Thomas Graf      2014-08-02   990   *
7e1e77636e36075 Thomas Graf      2014-08-02   991   * Initializes a new hash table based on the provided configuration
7e1e77636e36075 Thomas Graf      2014-08-02   992   * parameters. A table can be configured either with a variable or
7e1e77636e36075 Thomas Graf      2014-08-02   993   * fixed length key:
7e1e77636e36075 Thomas Graf      2014-08-02   994   *
7e1e77636e36075 Thomas Graf      2014-08-02   995   * Configuration Example 1: Fixed length keys
7e1e77636e36075 Thomas Graf      2014-08-02   996   * struct test_obj {
7e1e77636e36075 Thomas Graf      2014-08-02   997   *	int			key;
7e1e77636e36075 Thomas Graf      2014-08-02   998   *	void *			my_member;
7e1e77636e36075 Thomas Graf      2014-08-02   999   *	struct rhash_head	node;
7e1e77636e36075 Thomas Graf      2014-08-02  1000   * };
7e1e77636e36075 Thomas Graf      2014-08-02  1001   *
7e1e77636e36075 Thomas Graf      2014-08-02  1002   * struct rhashtable_params params = {
7e1e77636e36075 Thomas Graf      2014-08-02  1003   *	.head_offset = offsetof(struct test_obj, node),
7e1e77636e36075 Thomas Graf      2014-08-02  1004   *	.key_offset = offsetof(struct test_obj, key),
7e1e77636e36075 Thomas Graf      2014-08-02  1005   *	.key_len = sizeof(int),
87545899b52f9c8 Daniel Borkmann  2014-12-10  1006   *	.hashfn = jhash,
7e1e77636e36075 Thomas Graf      2014-08-02  1007   * };
7e1e77636e36075 Thomas Graf      2014-08-02  1008   *
7e1e77636e36075 Thomas Graf      2014-08-02  1009   * Configuration Example 2: Variable length keys
7e1e77636e36075 Thomas Graf      2014-08-02  1010   * struct test_obj {
7e1e77636e36075 Thomas Graf      2014-08-02  1011   *	[...]
7e1e77636e36075 Thomas Graf      2014-08-02  1012   *	struct rhash_head	node;
7e1e77636e36075 Thomas Graf      2014-08-02  1013   * };
7e1e77636e36075 Thomas Graf      2014-08-02  1014   *
49f7b33e63fec9d Patrick McHardy  2015-03-25  1015   * u32 my_hash_fn(const void *data, u32 len, u32 seed)
7e1e77636e36075 Thomas Graf      2014-08-02  1016   * {
7e1e77636e36075 Thomas Graf      2014-08-02  1017   *	struct test_obj *obj = data;
7e1e77636e36075 Thomas Graf      2014-08-02  1018   *
7e1e77636e36075 Thomas Graf      2014-08-02  1019   *	return [... hash ...];
7e1e77636e36075 Thomas Graf      2014-08-02  1020   * }
7e1e77636e36075 Thomas Graf      2014-08-02  1021   *
7e1e77636e36075 Thomas Graf      2014-08-02  1022   * struct rhashtable_params params = {
7e1e77636e36075 Thomas Graf      2014-08-02  1023   *	.head_offset = offsetof(struct test_obj, node),
87545899b52f9c8 Daniel Borkmann  2014-12-10  1024   *	.hashfn = jhash,
7e1e77636e36075 Thomas Graf      2014-08-02  1025   *	.obj_hashfn = my_hash_fn,
7e1e77636e36075 Thomas Graf      2014-08-02  1026   * };
7e1e77636e36075 Thomas Graf      2014-08-02  1027   */
9e54dd8b64dccdf Kent Overstreet  2024-03-21  1028  int rhashtable_init_noprof(struct rhashtable *ht,
488fb86ee91d3b1 Herbert Xu       2015-03-20  1029  		    const struct rhashtable_params *params)
7e1e77636e36075 Thomas Graf      2014-08-02  1030  {
7e1e77636e36075 Thomas Graf      2014-08-02  1031  	struct bucket_table *tbl;
7e1e77636e36075 Thomas Graf      2014-08-02  1032  	size_t size;
7e1e77636e36075 Thomas Graf      2014-08-02  1033  
31ccde2dacea837 Herbert Xu       2015-03-24  1034  	if ((!params->key_len && !params->obj_hashfn) ||
02fd97c3d4a8a14 Herbert Xu       2015-03-20  1035  	    (params->obj_hashfn && !params->obj_cmpfn))
7e1e77636e36075 Thomas Graf      2014-08-02  1036  		return -EINVAL;
7e1e77636e36075 Thomas Graf      2014-08-02  1037  
97defe1ecf868b8 Thomas Graf      2015-01-02  1038  	memset(ht, 0, sizeof(*ht));
97defe1ecf868b8 Thomas Graf      2015-01-02 @1039  	mutex_init(&ht->mutex);
ba7c95ea3870fe7 Herbert Xu       2015-03-24 @1040  	spin_lock_init(&ht->lock);
97defe1ecf868b8 Thomas Graf      2015-01-02  1041  	memcpy(&ht->p, params, sizeof(*params));
97defe1ecf868b8 Thomas Graf      2015-01-02  1042  
9e54dd8b64dccdf Kent Overstreet  2024-03-21  1043  	alloc_tag_record(ht->alloc_tag);
9e54dd8b64dccdf Kent Overstreet  2024-03-21  1044  
a998f712f77ea48 Thomas Graf      2015-03-19  1045  	if (params->min_size)
a998f712f77ea48 Thomas Graf      2015-03-19  1046  		ht->p.min_size = roundup_pow_of_two(params->min_size);
a998f712f77ea48 Thomas Graf      2015-03-19  1047  
6d684e54690caef Herbert Xu       2017-04-27  1048  	/* Cap total entries at 2^31 to avoid nelems overflow. */
6d684e54690caef Herbert Xu       2017-04-27  1049  	ht->max_elems = 1u << 31;
2d2ab658d2debcb Herbert Xu       2017-04-28  1050  
2d2ab658d2debcb Herbert Xu       2017-04-28  1051  	if (params->max_size) {
2d2ab658d2debcb Herbert Xu       2017-04-28  1052  		ht->p.max_size = rounddown_pow_of_two(params->max_size);
6d684e54690caef Herbert Xu       2017-04-27  1053  		if (ht->p.max_size < ht->max_elems / 2)
6d684e54690caef Herbert Xu       2017-04-27  1054  			ht->max_elems = ht->p.max_size * 2;
2d2ab658d2debcb Herbert Xu       2017-04-28  1055  	}
6d684e54690caef Herbert Xu       2017-04-27  1056  
48e75b430670ebd Florian Westphal 2017-05-01  1057  	ht->p.min_size = max_t(u16, ht->p.min_size, HASH_MIN_SIZE);
a998f712f77ea48 Thomas Graf      2015-03-19  1058  
3a324606bbabfc3 Herbert Xu       2015-12-16  1059  	size = rounded_hashtable_size(&ht->p);
3a324606bbabfc3 Herbert Xu       2015-12-16  1060  
31ccde2dacea837 Herbert Xu       2015-03-24  1061  	ht->key_len = ht->p.key_len;
31ccde2dacea837 Herbert Xu       2015-03-24  1062  	if (!params->hashfn) {
31ccde2dacea837 Herbert Xu       2015-03-24  1063  		ht->p.hashfn = jhash;
31ccde2dacea837 Herbert Xu       2015-03-24  1064  
31ccde2dacea837 Herbert Xu       2015-03-24  1065  		if (!(ht->key_len & (sizeof(u32) - 1))) {
31ccde2dacea837 Herbert Xu       2015-03-24  1066  			ht->key_len /= sizeof(u32);
31ccde2dacea837 Herbert Xu       2015-03-24  1067  			ht->p.hashfn = rhashtable_jhash2;
31ccde2dacea837 Herbert Xu       2015-03-24  1068  		}
31ccde2dacea837 Herbert Xu       2015-03-24  1069  	}
31ccde2dacea837 Herbert Xu       2015-03-24  1070  
2d22ecf6db1c390 Davidlohr Bueso  2018-08-21  1071  	/*
2d22ecf6db1c390 Davidlohr Bueso  2018-08-21  1072  	 * This is api initialization and thus we need to guarantee the
2d22ecf6db1c390 Davidlohr Bueso  2018-08-21  1073  	 * initial rhashtable allocation. Upon failure, retry with the
2d22ecf6db1c390 Davidlohr Bueso  2018-08-21  1074  	 * smallest possible size with __GFP_NOFAIL semantics.
2d22ecf6db1c390 Davidlohr Bueso  2018-08-21  1075  	 */
b9ecfdaa1090b59 Herbert Xu       2015-03-24  1076  	tbl = bucket_table_alloc(ht, size, GFP_KERNEL);
2d22ecf6db1c390 Davidlohr Bueso  2018-08-21  1077  	if (unlikely(tbl == NULL)) {
2d22ecf6db1c390 Davidlohr Bueso  2018-08-21  1078  		size = max_t(u16, ht->p.min_size, HASH_MIN_SIZE);
2d22ecf6db1c390 Davidlohr Bueso  2018-08-21  1079  		tbl = bucket_table_alloc(ht, size, GFP_KERNEL | __GFP_NOFAIL);
2d22ecf6db1c390 Davidlohr Bueso  2018-08-21  1080  	}
7e1e77636e36075 Thomas Graf      2014-08-02  1081  
545a148e43bed67 Ying Xue         2015-01-07  1082  	atomic_set(&ht->nelems, 0);
a5b6846f9e1a080 Daniel Borkmann  2015-03-12  1083  
7e1e77636e36075 Thomas Graf      2014-08-02  1084  	RCU_INIT_POINTER(ht->tbl, tbl);
7e1e77636e36075 Thomas Graf      2014-08-02  1085  
57699a40b4f2694 Ying Xue         2015-01-16  1086  	INIT_WORK(&ht->run_work, rht_deferred_worker);
97defe1ecf868b8 Thomas Graf      2015-01-02  1087  
7e1e77636e36075 Thomas Graf      2014-08-02  1088  	return 0;
7e1e77636e36075 Thomas Graf      2014-08-02  1089  }
9e54dd8b64dccdf Kent Overstreet  2024-03-21  1090  EXPORT_SYMBOL_GPL(rhashtable_init_noprof);
7e1e77636e36075 Thomas Graf      2014-08-02  1091  

:::::: The code at line 1039 was first introduced by commit
:::::: 97defe1ecf868b8127f8e62395499d6a06e4c4b1 rhashtable: Per bucket locks & deferred expansion/shrinking

:::::: TO: Thomas Graf <tgraf@suug.ch>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

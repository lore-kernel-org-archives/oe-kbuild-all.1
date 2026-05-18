Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CC9391845
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 May 2026 19:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779134271; cv=none; b=hI4wdTi6xtAMz87CZjHxj4GS/bx9ysM7R8gU3cYYHIy1/jE5EPrSUgz24xKkf9vhdkrIM2wgQi80LOEsJVHFuJpP3QJpNDQtXwnUNuTqQLMMQzuB/4QLGCwxoo2AytypgtfI/ylYIRk7Shja8Dgp4w9AUYoklAfSm2L4h08tf2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779134271; c=relaxed/simple;
	bh=7u440M2zvdV/qrtK9Q9q16jZmNfZ7wdvVXyLTb/1ZQA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Gd6yv6xISmJU21kScCGIBEB5MgtzOHaDTd6x0B8Jofdijcp6zQptizso7CkRzKV/1IAEgoVxCGccaYHwxcVd5Dgax7BPr/Aj+knH0WOLaWkbZKJiN4ZSfDBYhGrH9ThqcLZlEW0FbGeR0AixKo6N4hnVVxKCxGIpWMlCU9mwn+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CC7xFdBy; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CC7xFdBy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779134270; x=1810670270;
  h=date:from:to:cc:subject:message-id;
  bh=7u440M2zvdV/qrtK9Q9q16jZmNfZ7wdvVXyLTb/1ZQA=;
  b=CC7xFdByWLwelV5UBdSptfajmKz0oGOHN2WH8VliPwu8ItJspe48qO5W
   utiix04SobOxljaKEO3ly3hQPyPfASbjyWW0jw4N1tQKLr3am7PtzxZOy
   VkoTzjVsytturpjsprnehrdnmTt4lKyiiyDNsTZYUT4Eqxnbk4g5KgYfy
   Mg5ySS9z2tP8QO8Hel0pYfS2ZZxKE0zHTgMqxc91dXo9Cdg6hQ+Y4rPBp
   MhATgy5dC+/TX2DAIbYa1voj0zpdPRJNPFAHQxb6SV2PaNUfUcB7K92eY
   Mb+dRv9lTEb5Qz0C4o1nHZYmb1svxR3t9V3P9B6fvL6b0qs8vs73hXMKR
   w==;
X-CSE-ConnectionGUID: t/QxgQmJRgyMaaDP0QR/5w==
X-CSE-MsgGUID: ZjHET6auRVefBLbS1usfzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="102674729"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="102674729"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 12:57:48 -0700
X-CSE-ConnectionGUID: agbcN/gAQ6iVTH0FIN4EEg==
X-CSE-MsgGUID: ePsCWR/aS66Qp0SYRz8Qxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="277642294"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 May 2026 12:57:46 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP45v-000000003LW-0LQH;
	Mon, 18 May 2026 19:57:43 +0000
Date: Tue, 19 May 2026 03:56:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rppt:gfp-to-kmalloc/v0.1 14/238]
 drivers/md/bcache/bset.c:330:41: error: too many arguments to function
 'get_order'; expected 1, have 2
Message-ID: <202605190307.NxZoOFJI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git gfp-to-kmalloc/v0.1
head:   cf8f69ff9142effba4d8d9a70a1a4f275044376c
commit: 0481d1dfb6cc95e2c2f4df47869dd9dbf8003f49 [14/238] bcache: replace __get_free_pages() with kmalloc()
config: openrisc-randconfig-r072-20260519 (https://download.01.org/0day-ci/archive/20260519/202605190307.NxZoOFJI-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190307.NxZoOFJI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605190307.NxZoOFJI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/workqueue.h:9,
                    from include/linux/mm_types.h:19,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/xarray.h:16,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs/super_types.h:7,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/blkdev.h:9,
                    from drivers/md/bcache/util.h:6,
                    from drivers/md/bcache/bset.c:11:
   drivers/md/bcache/bset.c: In function 'bch_btree_keys_alloc':
>> drivers/md/bcache/bset.c:330:41: error: too many arguments to function 'get_order'; expected 1, have 2
     330 |                 : kmalloc(PAGE_SIZE << (get_order(bset_tree_bytes(b), gfp)));
         |                                         ^~~~~~~~~                     ~~~
   include/linux/alloc_tag.h:253:16: note: in definition of macro 'alloc_hooks_tag'
     253 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   include/linux/slab.h:956:49: note: in expansion of macro 'alloc_hooks'
     956 | #define kmalloc(...)                            alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   drivers/md/bcache/bset.c:330:19: note: in expansion of macro 'kmalloc'
     330 |                 : kmalloc(PAGE_SIZE << (get_order(bset_tree_bytes(b), gfp)));
         |                   ^~~~~~~
   In file included from arch/openrisc/include/asm/page.h:78,
                    from arch/openrisc/include/asm/processor.h:19,
                    from arch/openrisc/include/asm/thread_info.h:22,
                    from include/linux/thread_info.h:62,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/openrisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/shrinker.h:8,
                    from include/linux/list_lru.h:13:
   include/asm-generic/getorder.h:29:48: note: declared here
      29 | static __always_inline __attribute_const__ int get_order(unsigned long size)
         |                                                ^~~~~~~~~
>> include/linux/slab.h:956:61: error: too few arguments to function 'kmalloc_noprof'; expected 2, have 1
     956 | #define kmalloc(...)                            alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                                                             ^~~~~~~~~~~~~~
   include/linux/alloc_tag.h:253:16: note: in definition of macro 'alloc_hooks_tag'
     253 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   include/linux/slab.h:956:49: note: in expansion of macro 'alloc_hooks'
     956 | #define kmalloc(...)                            alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   drivers/md/bcache/bset.c:330:19: note: in expansion of macro 'kmalloc'
     330 |                 : kmalloc(PAGE_SIZE << (get_order(bset_tree_bytes(b), gfp)));
         |                   ^~~~~~~
   In file included from include/linux/fs.h:45:
   include/linux/slab.h:941:46: note: declared here
     941 | static __always_inline __alloc_size(1) void *kmalloc_noprof(size_t size, gfp_t flags)
         |                                              ^~~~~~~~~~~~~~
>> drivers/md/bcache/bset.c:330:41: error: too many arguments to function 'get_order'; expected 1, have 2
     330 |                 : kmalloc(PAGE_SIZE << (get_order(bset_tree_bytes(b), gfp)));
         |                                         ^~~~~~~~~                     ~~~
   include/linux/alloc_tag.h:257:24: note: in definition of macro 'alloc_hooks_tag'
     257 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:956:49: note: in expansion of macro 'alloc_hooks'
     956 | #define kmalloc(...)                            alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   drivers/md/bcache/bset.c:330:19: note: in expansion of macro 'kmalloc'
     330 |                 : kmalloc(PAGE_SIZE << (get_order(bset_tree_bytes(b), gfp)));
         |                   ^~~~~~~
   include/asm-generic/getorder.h:29:48: note: declared here
      29 | static __always_inline __attribute_const__ int get_order(unsigned long size)
         |                                                ^~~~~~~~~
>> include/linux/slab.h:956:61: error: too few arguments to function 'kmalloc_noprof'; expected 2, have 1
     956 | #define kmalloc(...)                            alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                                                             ^~~~~~~~~~~~~~
   include/linux/alloc_tag.h:257:24: note: in definition of macro 'alloc_hooks_tag'
     257 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:956:49: note: in expansion of macro 'alloc_hooks'
     956 | #define kmalloc(...)                            alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   drivers/md/bcache/bset.c:330:19: note: in expansion of macro 'kmalloc'
     330 |                 : kmalloc(PAGE_SIZE << (get_order(bset_tree_bytes(b), gfp)));
         |                   ^~~~~~~
   include/linux/slab.h:941:46: note: declared here
     941 | static __always_inline __alloc_size(1) void *kmalloc_noprof(size_t size, gfp_t flags)
         |                                              ^~~~~~~~~~~~~~
>> drivers/md/bcache/bset.c:330:41: error: too many arguments to function 'get_order'; expected 1, have 2
     330 |                 : kmalloc(PAGE_SIZE << (get_order(bset_tree_bytes(b), gfp)));
         |                                         ^~~~~~~~~                     ~~~
   include/linux/alloc_tag.h:260:24: note: in definition of macro 'alloc_hooks_tag'
     260 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:956:49: note: in expansion of macro 'alloc_hooks'
     956 | #define kmalloc(...)                            alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   drivers/md/bcache/bset.c:330:19: note: in expansion of macro 'kmalloc'
     330 |                 : kmalloc(PAGE_SIZE << (get_order(bset_tree_bytes(b), gfp)));
         |                   ^~~~~~~
   include/asm-generic/getorder.h:29:48: note: declared here
      29 | static __always_inline __attribute_const__ int get_order(unsigned long size)
         |                                                ^~~~~~~~~
>> include/linux/slab.h:956:61: error: too few arguments to function 'kmalloc_noprof'; expected 2, have 1
     956 | #define kmalloc(...)                            alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                                                             ^~~~~~~~~~~~~~
   include/linux/alloc_tag.h:260:24: note: in definition of macro 'alloc_hooks_tag'
     260 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:956:49: note: in expansion of macro 'alloc_hooks'
     956 | #define kmalloc(...)                            alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   drivers/md/bcache/bset.c:330:19: note: in expansion of macro 'kmalloc'
     330 |                 : kmalloc(PAGE_SIZE << (get_order(bset_tree_bytes(b), gfp)));
         |                   ^~~~~~~
   include/linux/slab.h:941:46: note: declared here
     941 | static __always_inline __alloc_size(1) void *kmalloc_noprof(size_t size, gfp_t flags)
         |                                              ^~~~~~~~~~~~~~
>> drivers/md/bcache/bset.c:330:17: error: pointer/integer type mismatch in conditional expression [-Wint-conversion]
     330 |                 : kmalloc(PAGE_SIZE << (get_order(bset_tree_bytes(b), gfp)));
         |                 ^
   drivers/md/bcache/bset.c:336:41: error: too many arguments to function 'get_order'; expected 1, have 2
     336 |                 : kmalloc(PAGE_SIZE << (get_order(bset_prev_bytes(b), gfp)));
         |                                         ^~~~~~~~~                     ~~~
   include/linux/alloc_tag.h:253:16: note: in definition of macro 'alloc_hooks_tag'
     253 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   include/linux/slab.h:956:49: note: in expansion of macro 'alloc_hooks'
     956 | #define kmalloc(...)                            alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   drivers/md/bcache/bset.c:336:19: note: in expansion of macro 'kmalloc'
     336 |                 : kmalloc(PAGE_SIZE << (get_order(bset_prev_bytes(b), gfp)));
         |                   ^~~~~~~
   include/asm-generic/getorder.h:29:48: note: declared here
      29 | static __always_inline __attribute_const__ int get_order(unsigned long size)
         |                                                ^~~~~~~~~
>> include/linux/slab.h:956:61: error: too few arguments to function 'kmalloc_noprof'; expected 2, have 1
     956 | #define kmalloc(...)                            alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                                                             ^~~~~~~~~~~~~~
   include/linux/alloc_tag.h:253:16: note: in definition of macro 'alloc_hooks_tag'
     253 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   include/linux/slab.h:956:49: note: in expansion of macro 'alloc_hooks'
     956 | #define kmalloc(...)                            alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   drivers/md/bcache/bset.c:336:19: note: in expansion of macro 'kmalloc'
     336 |                 : kmalloc(PAGE_SIZE << (get_order(bset_prev_bytes(b), gfp)));
         |                   ^~~~~~~
   include/linux/slab.h:941:46: note: declared here
     941 | static __always_inline __alloc_size(1) void *kmalloc_noprof(size_t size, gfp_t flags)
         |                                              ^~~~~~~~~~~~~~
   drivers/md/bcache/bset.c:336:41: error: too many arguments to function 'get_order'; expected 1, have 2
     336 |                 : kmalloc(PAGE_SIZE << (get_order(bset_prev_bytes(b), gfp)));
         |                                         ^~~~~~~~~                     ~~~
   include/linux/alloc_tag.h:257:24: note: in definition of macro 'alloc_hooks_tag'
     257 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:956:49: note: in expansion of macro 'alloc_hooks'
     956 | #define kmalloc(...)                            alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   drivers/md/bcache/bset.c:336:19: note: in expansion of macro 'kmalloc'
     336 |                 : kmalloc(PAGE_SIZE << (get_order(bset_prev_bytes(b), gfp)));
         |                   ^~~~~~~
   include/asm-generic/getorder.h:29:48: note: declared here
      29 | static __always_inline __attribute_const__ int get_order(unsigned long size)
         |                                                ^~~~~~~~~
>> include/linux/slab.h:956:61: error: too few arguments to function 'kmalloc_noprof'; expected 2, have 1
     956 | #define kmalloc(...)                            alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                                                             ^~~~~~~~~~~~~~
   include/linux/alloc_tag.h:257:24: note: in definition of macro 'alloc_hooks_tag'
     257 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:956:49: note: in expansion of macro 'alloc_hooks'
     956 | #define kmalloc(...)                            alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   drivers/md/bcache/bset.c:336:19: note: in expansion of macro 'kmalloc'
     336 |                 : kmalloc(PAGE_SIZE << (get_order(bset_prev_bytes(b), gfp)));
         |                   ^~~~~~~
   include/linux/slab.h:941:46: note: declared here
     941 | static __always_inline __alloc_size(1) void *kmalloc_noprof(size_t size, gfp_t flags)
         |                                              ^~~~~~~~~~~~~~
   drivers/md/bcache/bset.c:336:41: error: too many arguments to function 'get_order'; expected 1, have 2
     336 |                 : kmalloc(PAGE_SIZE << (get_order(bset_prev_bytes(b), gfp)));
         |                                         ^~~~~~~~~                     ~~~
   include/linux/alloc_tag.h:260:24: note: in definition of macro 'alloc_hooks_tag'
     260 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:956:49: note: in expansion of macro 'alloc_hooks'
     956 | #define kmalloc(...)                            alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   drivers/md/bcache/bset.c:336:19: note: in expansion of macro 'kmalloc'
     336 |                 : kmalloc(PAGE_SIZE << (get_order(bset_prev_bytes(b), gfp)));
         |                   ^~~~~~~
   include/asm-generic/getorder.h:29:48: note: declared here
      29 | static __always_inline __attribute_const__ int get_order(unsigned long size)
         |                                                ^~~~~~~~~
>> include/linux/slab.h:956:61: error: too few arguments to function 'kmalloc_noprof'; expected 2, have 1
     956 | #define kmalloc(...)                            alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                                                             ^~~~~~~~~~~~~~
   include/linux/alloc_tag.h:260:24: note: in definition of macro 'alloc_hooks_tag'
     260 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:956:49: note: in expansion of macro 'alloc_hooks'
     956 | #define kmalloc(...)                            alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   drivers/md/bcache/bset.c:336:19: note: in expansion of macro 'kmalloc'
     336 |                 : kmalloc(PAGE_SIZE << (get_order(bset_prev_bytes(b), gfp)));
         |                   ^~~~~~~
   include/linux/slab.h:941:46: note: declared here
     941 | static __always_inline __alloc_size(1) void *kmalloc_noprof(size_t size, gfp_t flags)
         |                                              ^~~~~~~~~~~~~~
   drivers/md/bcache/bset.c:336:17: error: pointer/integer type mismatch in conditional expression [-Wint-conversion]
     336 |                 : kmalloc(PAGE_SIZE << (get_order(bset_prev_bytes(b), gfp)));
         |                 ^


vim +/get_order +330 drivers/md/bcache/bset.c

   313	
   314	int bch_btree_keys_alloc(struct btree_keys *b,
   315				 unsigned int page_order,
   316				 gfp_t gfp)
   317	{
   318		struct bset_tree *t = b->set;
   319	
   320		BUG_ON(t->data);
   321	
   322		b->page_order = page_order;
   323	
   324		t->data = kmalloc(PAGE_SIZE << (b->page_order), __GFP_COMP|gfp);
   325		if (!t->data)
   326			goto err;
   327	
   328		t->tree = bset_tree_bytes(b) < PAGE_SIZE
   329			? kmalloc(bset_tree_bytes(b), gfp)
 > 330			: kmalloc(PAGE_SIZE << (get_order(bset_tree_bytes(b), gfp)));
   331		if (!t->tree)
   332			goto err;
   333	
   334		t->prev = bset_prev_bytes(b) < PAGE_SIZE
   335			? kmalloc(bset_prev_bytes(b), gfp)
   336			: kmalloc(PAGE_SIZE << (get_order(bset_prev_bytes(b), gfp)));
   337		if (!t->prev)
   338			goto err;
   339	
   340		return 0;
   341	err:
   342		bch_btree_keys_free(b);
   343		return -ENOMEM;
   344	}
   345	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

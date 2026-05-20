Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64ECA233924
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 May 2026 04:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779251910; cv=none; b=D+C0Xume2C3Bp+zz8kB4F6OJfNvl+PQvezyiLNvnCCBj1NezwwX/pPonUwS6rbRhh3VQMyi46ZspXSaskigLwGicGQ0lo+yeadpgm/9FCZaph0rJgMYsQy3GosKNoaLfsEg7FFcD0MAF7Jeml7x5AXvMJJC2ZIQfj0TVcTJZTuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779251910; c=relaxed/simple;
	bh=OCD1r4gJamRch+JSONjQZMURzO1whM/RLrRrNSQKWZE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mUHqkL5ImpPwvYZzZaLa5JiVDBDFHI2DfvKFTzsT35962VeGwnuH7EnyXRWwQ/fDXDiCwzrW2DH+elmkJlBpmVRrQp8NVEWULSoX97Ayjn8p1k+Kc3EN+GZifyJt5oI3lw5o2ohRSkTOE6WAp6kQx5achqqRMt91flQQPfx0dlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b9lMdhGk; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b9lMdhGk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779251909; x=1810787909;
  h=date:from:to:cc:subject:message-id;
  bh=OCD1r4gJamRch+JSONjQZMURzO1whM/RLrRrNSQKWZE=;
  b=b9lMdhGkYlKJ6sV1GRw8XyINaPbqAj4uc3p2Isd+ix78Yu6qkha/k81R
   STSPxkALTRCCLF9mTwgxZiCryqZLgAE/K9LzQuXnel2ts+ceLOEERLcbi
   wmSSlPBM3NpJpyPrbq3qMhpL8WOtitGE5Qvd64ZrODOMLpnYBzH/gMLVW
   eu8OUQrbOrciNIkA7WbrsfsNqzdUAtu7mBwB2qM/LADzs+ynIQh15UBtS
   MHfsAUjLsXNAdk5l+PIqksV8vob37Kn/TtjCFrZdePOfsWJyuq+BcZihj
   FSg0rQHSqyVC/7NhTBC5FR0pKESrwXPtnNPwNCJDtT6HaRZPlY2tHVYrY
   w==;
X-CSE-ConnectionGUID: EMY6eDrySgq1wzP9FPv0Zg==
X-CSE-MsgGUID: T54YBwPLScKnaPeI1TCNtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="80121134"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="80121134"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 21:38:28 -0700
X-CSE-ConnectionGUID: eaHtfEvZSCOWnS3QLv/LYQ==
X-CSE-MsgGUID: QtZaWNpIRPyUBz1MTBZx5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="278122193"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 19 May 2026 21:38:27 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPYhL-000000002Sb-201c;
	Wed, 20 May 2026 04:38:23 +0000
Date: Wed, 20 May 2026 12:37:36 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:arena_slab 63/63] kernel/bpf/arena.c:963:15: error:
 'struct slab' has no member named 'obj_exts'; did you mean 'objects'?
Message-ID: <202605201210.BlkPbSSh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git arena_slab
head:   cb83f972bd005841d18f7bbff6e50d9bcbf0adf8
commit: cb83f972bd005841d18f7bbff6e50d9bcbf0adf8 [63/63] bpf,slab: Add slub-backed allocator for bpf_arena
config: x86_64-buildonly-randconfig-004 (https://download.01.org/0day-ci/archive/20260520/202605201210.BlkPbSSh-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605201210.BlkPbSSh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605201210.BlkPbSSh-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/arena.c: In function 'arena_alloc_slab_page':
>> kernel/bpf/arena.c:963:15: error: 'struct slab' has no member named 'obj_exts'; did you mean 'objects'?
     963 |         slab->obj_exts = (unsigned long)uaddr32 | BIT_ULL(63);
         |               ^~~~~~~~
         |               objects
   In file included from <command-line>:
   kernel/bpf/arena.c: In function 'arena_slab_uaddr32':
>> kernel/bpf/arena.c:974:47: error: 'const struct slab' has no member named 'obj_exts'; did you mean 'objects'?
     974 |         unsigned long stash = READ_ONCE(slab->obj_exts);
         |                                               ^~~~~~~~
   include/linux/compiler_types.h:679:23: note: in definition of macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/arena.c:974:31: note: in expansion of macro 'READ_ONCE'
     974 |         unsigned long stash = READ_ONCE(slab->obj_exts);
         |                               ^~~~~~~~~
>> kernel/bpf/arena.c:974:47: error: 'const struct slab' has no member named 'obj_exts'; did you mean 'objects'?
     974 |         unsigned long stash = READ_ONCE(slab->obj_exts);
         |                                               ^~~~~~~~
   include/linux/compiler_types.h:679:23: note: in definition of macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/arena.c:974:31: note: in expansion of macro 'READ_ONCE'
     974 |         unsigned long stash = READ_ONCE(slab->obj_exts);
         |                               ^~~~~~~~~
>> kernel/bpf/arena.c:974:47: error: 'const struct slab' has no member named 'obj_exts'; did you mean 'objects'?
     974 |         unsigned long stash = READ_ONCE(slab->obj_exts);
         |                                               ^~~~~~~~
   include/linux/compiler_types.h:679:23: note: in definition of macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/arena.c:974:31: note: in expansion of macro 'READ_ONCE'
     974 |         unsigned long stash = READ_ONCE(slab->obj_exts);
         |                               ^~~~~~~~~
>> kernel/bpf/arena.c:974:47: error: 'const struct slab' has no member named 'obj_exts'; did you mean 'objects'?
     974 |         unsigned long stash = READ_ONCE(slab->obj_exts);
         |                                               ^~~~~~~~
   include/linux/compiler_types.h:679:23: note: in definition of macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/arena.c:974:31: note: in expansion of macro 'READ_ONCE'
     974 |         unsigned long stash = READ_ONCE(slab->obj_exts);
         |                               ^~~~~~~~~
>> kernel/bpf/arena.c:974:47: error: 'const struct slab' has no member named 'obj_exts'; did you mean 'objects'?
     974 |         unsigned long stash = READ_ONCE(slab->obj_exts);
         |                                               ^~~~~~~~
   include/linux/compiler_types.h:679:23: note: in definition of macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/arena.c:974:31: note: in expansion of macro 'READ_ONCE'
     974 |         unsigned long stash = READ_ONCE(slab->obj_exts);
         |                               ^~~~~~~~~
>> kernel/bpf/arena.c:974:47: error: 'const struct slab' has no member named 'obj_exts'; did you mean 'objects'?
     974 |         unsigned long stash = READ_ONCE(slab->obj_exts);
         |                                               ^~~~~~~~
   include/linux/compiler_types.h:635:53: note: in definition of macro '__unqual_scalar_typeof'
     635 | #define __unqual_scalar_typeof(x) __typeof_unqual__(x)
         |                                                     ^
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   kernel/bpf/arena.c:974:31: note: in expansion of macro 'READ_ONCE'
     974 |         unsigned long stash = READ_ONCE(slab->obj_exts);
         |                               ^~~~~~~~~
   In file included from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:369,
                    from include/uapi/linux/filter.h:9,
                    from include/linux/bpf.h:8,
                    from kernel/bpf/arena.c:3:
>> kernel/bpf/arena.c:974:47: error: 'const struct slab' has no member named 'obj_exts'; did you mean 'objects'?
     974 |         unsigned long stash = READ_ONCE(slab->obj_exts);
         |                                               ^~~~~~~~
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   kernel/bpf/arena.c:974:31: note: in expansion of macro 'READ_ONCE'
     974 |         unsigned long stash = READ_ONCE(slab->obj_exts);
         |                               ^~~~~~~~~
   kernel/bpf/arena.c: In function 'arena_free_slab_page':
   kernel/bpf/arena.c:988:26: error: 'struct slab' has no member named 'obj_exts'; did you mean 'objects'?
     988 |         WRITE_ONCE(slab->obj_exts, 0);
         |                          ^~~~~~~~
   include/linux/compiler_types.h:679:23: note: in definition of macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/arena.c:988:9: note: in expansion of macro 'WRITE_ONCE'
     988 |         WRITE_ONCE(slab->obj_exts, 0);
         |         ^~~~~~~~~~
   kernel/bpf/arena.c:988:26: error: 'struct slab' has no member named 'obj_exts'; did you mean 'objects'?
     988 |         WRITE_ONCE(slab->obj_exts, 0);
         |                          ^~~~~~~~
   include/linux/compiler_types.h:679:23: note: in definition of macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/arena.c:988:9: note: in expansion of macro 'WRITE_ONCE'
     988 |         WRITE_ONCE(slab->obj_exts, 0);
         |         ^~~~~~~~~~
   kernel/bpf/arena.c:988:26: error: 'struct slab' has no member named 'obj_exts'; did you mean 'objects'?
     988 |         WRITE_ONCE(slab->obj_exts, 0);
         |                          ^~~~~~~~
   include/linux/compiler_types.h:679:23: note: in definition of macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/arena.c:988:9: note: in expansion of macro 'WRITE_ONCE'
     988 |         WRITE_ONCE(slab->obj_exts, 0);
         |         ^~~~~~~~~~
   kernel/bpf/arena.c:988:26: error: 'struct slab' has no member named 'obj_exts'; did you mean 'objects'?
     988 |         WRITE_ONCE(slab->obj_exts, 0);
         |                          ^~~~~~~~
   include/linux/compiler_types.h:679:23: note: in definition of macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/arena.c:988:9: note: in expansion of macro 'WRITE_ONCE'
     988 |         WRITE_ONCE(slab->obj_exts, 0);
         |         ^~~~~~~~~~
   kernel/bpf/arena.c:988:26: error: 'struct slab' has no member named 'obj_exts'; did you mean 'objects'?
     988 |         WRITE_ONCE(slab->obj_exts, 0);
         |                          ^~~~~~~~
   include/linux/compiler_types.h:679:23: note: in definition of macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'


vim +963 kernel/bpf/arena.c

   917	
   918	/*
   919	 * SLAB_BPF_ARENA support: each arena owns a set of kmem_cache buckets that
   920	 * back kmalloc-style alloc/free for BPF programs. Slab pages are drawn from
   921	 * the arena's page pool, but slub treats them as ordinary direct-map kernel
   922	 * memory (slab_address/virt_to_slab/freepointers all use direct-map VAs).
   923	 * The arena's vmalloc mapping is what BPF programs see; bpf_arena_alloc/free
   924	 * translate between direct-map and arena offset in O(1) by reading the slab
   925	 * page's arena uaddr32 stashed in slab->obj_exts.
   926	 */
   927	
   928	static struct slab *arena_alloc_slab_page(void *arena_p, gfp_t flags, int node,
   929						  unsigned int order, bool allow_spin)
   930	{
   931		struct bpf_arena *arena = arena_p;
   932		long ret_user_va;
   933		u32 uaddr32;
   934		void *kva;
   935		struct page *page;
   936		struct slab *slab;
   937	
   938		if (order)
   939			return NULL;
   940	
   941		/* Propagate allow_spin to the arena page allocator; non-sleeping
   942		 * contexts (BPF NMI/irq-off) take the best-effort path.
   943		 */
   944		ret_user_va = arena_alloc_pages(arena, 0, 1, node, allow_spin);
   945		if (!ret_user_va)
   946			return NULL;
   947	
   948		uaddr32 = (u32)ret_user_va;
   949		kva = (void *)(bpf_arena_get_kern_vm_start(arena) + uaddr32);
   950	
   951		page = vmalloc_to_page(kva);
   952		if (WARN_ON_ONCE(!page))
   953			goto fail;
   954	
   955		__SetPageSlab(page);
   956		slab = page_slab(page);
   957		/*
   958		 * Stash this slab page's arena offset in obj_exts. allocate_slab()
   959		 * skips init_slab_obj_exts() for SLAB_BPF_ARENA caches, so this
   960		 * survives until __free_slab(). High bit set as a presence sentinel
   961		 * (uaddr32 < 4GB so bit 63 is always free).
   962		 */
 > 963		slab->obj_exts = (unsigned long)uaddr32 | BIT_ULL(63);
   964		WRITE_ONCE(arena->slab_pages[uaddr32 >> PAGE_SHIFT], page);
   965	
   966		return slab;
   967	fail:
   968		arena_free_pages(arena, uaddr32, 1, true);
   969		return NULL;
   970	}
   971	
   972	static u32 arena_slab_uaddr32(const struct slab *slab)
   973	{
 > 974		unsigned long stash = READ_ONCE(slab->obj_exts);
   975	
   976		if (WARN_ON_ONCE(!(stash & BIT_ULL(63))))
   977			return 0;
   978		return (u32)stash;
   979	}
   980	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

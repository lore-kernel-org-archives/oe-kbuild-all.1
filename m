Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911AB46AF00
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 May 2026 14:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778684393; cv=none; b=F39KTD/w6m1TOfUxYer1ZycdZtPEqz6VbTIVvhFiOo4H7m3B7MapviMk998pRlaQrcdoy7euEmo7ICnKeLyMKQJmaqABnlJfNsL8Ynk4aI1g4LGYbdoC2omLmNLWdqzEK1GyQoBIdxjoF0ZqOgaZw5blX3BlNBjXdqByh0yjg5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778684393; c=relaxed/simple;
	bh=AiZWi34il+1ipNq6KMZ51z9Ft8Ihs3os2+638QLcLXM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Rb5E8EwpBOzSm6+dWH13ToGl5DDuEQy+LPlj0hXEp9YgCsyya0X+BzD+nmntxhK+4w3VJlbx2yP1yJJTiUXrLm+7PwWVmV98vWPyYTwWipgABr1qqDeZKV6YL/VROgjIALAE7oIFoFjA35oDOkNvf6JKcgGYI0z41YBdRbwkCKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WnsDcSvP; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WnsDcSvP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778684388; x=1810220388;
  h=date:from:to:cc:subject:message-id;
  bh=AiZWi34il+1ipNq6KMZ51z9Ft8Ihs3os2+638QLcLXM=;
  b=WnsDcSvPkayYCCgj6ceg0NGE54fd4VnFv/zKIozO4TptUsXVYHAFpric
   BqoGpMjuKXsGkfTKFXjrPxlVv3fJsooeY5CYtpMU3Q3yprpMkiv0vlYyH
   ZPxxrxuGI/Voe115wFF5Zzl0bfAYgFopNEbKYetscpreEPmTDHuEhckYU
   SD4eXBdHAPI1tpjQ4iOfuXtSYH2EJ8AnrG/FrdRhsCO7XelNoMWhzjcJm
   kY1kjsXUzrN0tFerN0GWPdAZMhyLCH8v1bqJottOYs9czhocERzzXOTuM
   VI7fK5B8jpffMLkvE4dUcL4OVNrJcIcXRoRlYafiUEq6pj5M6u1/K2ngM
   A==;
X-CSE-ConnectionGUID: SnuJreP+QgmqQKEmjoV34w==
X-CSE-MsgGUID: 5JfH4B29TieaUEhf/qsQ8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="83486660"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="83486660"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 07:59:37 -0700
X-CSE-ConnectionGUID: 4O5crilsSN2F/cT6ARxW+w==
X-CSE-MsgGUID: 6mYe4kQwQdeaSSgTmgKV4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="235042117"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 May 2026 07:59:35 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNB3c-000000004Ht-1n8y;
	Wed, 13 May 2026 14:59:32 +0000
Date: Wed, 13 May 2026 22:58:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Harry Yoo (Oracle)" <harry@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [harry:slab-allow-runtime-parameter-tuning-rfc-v1r1-wip 2/6]
 mm/slub.c:7791:46: error: 'USHORT_MAX' undeclared; did you mean 'USHRT_MAX'?
Message-ID: <202605132227.JgQZ1pib-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/harry/linux.git slab-allow-runtime-parameter-tuning-rfc-v1r1-wip
head:   10c188407341817c6baf9dad9c788928f8387800
commit: c31e168e0f0f0b695792c4c9a82bd77ab9d94d12 [2/6] mm/slab: store sheaf capacity for all sheaves
config: powerpc-mpc832x_rdb_defconfig (https://download.01.org/0day-ci/archive/20260513/202605132227.JgQZ1pib-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605132227.JgQZ1pib-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605132227.JgQZ1pib-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:27,
                    from arch/powerpc/include/asm/page.h:11,
                    from arch/powerpc/include/asm/thread_info.h:13,
                    from include/linux/thread_info.h:62,
                    from include/asm-generic/preempt.h:5,
                    from arch/powerpc/include/asm/preempt.h:5,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:8,
                    from mm/slub.c:15:
   mm/slub.c: In function 'calculate_sheaf_capacity':
>> mm/slub.c:7791:46: error: 'USHORT_MAX' undeclared (first use in this function); did you mean 'USHRT_MAX'?
    7791 |         return max_t(unsigned int, capacity, USHORT_MAX);
         |                                              ^~~~~~~~~~
   include/linux/minmax.h:86:38: note: in definition of macro '__cmp_once_unique'
      86 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
         |                                      ^
   include/linux/minmax.h:169:27: note: in expansion of macro '__cmp_once'
     169 | #define max_t(type, x, y) __cmp_once(max, type, x, y)
         |                           ^~~~~~~~~~
   mm/slub.c:7791:16: note: in expansion of macro 'max_t'
    7791 |         return max_t(unsigned int, capacity, USHORT_MAX);
         |                ^~~~~
   mm/slub.c:7791:46: note: each undeclared identifier is reported only once for each function it appears in
    7791 |         return max_t(unsigned int, capacity, USHORT_MAX);
         |                                              ^~~~~~~~~~
   include/linux/minmax.h:86:38: note: in definition of macro '__cmp_once_unique'
      86 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
         |                                      ^
   include/linux/minmax.h:169:27: note: in expansion of macro '__cmp_once'
     169 | #define max_t(type, x, y) __cmp_once(max, type, x, y)
         |                           ^~~~~~~~~~
   mm/slub.c:7791:16: note: in expansion of macro 'max_t'
    7791 |         return max_t(unsigned int, capacity, USHORT_MAX);
         |                ^~~~~


vim +7791 mm/slub.c

  7745	
  7746	static unsigned short calculate_sheaf_capacity(struct kmem_cache *s,
  7747						       struct kmem_cache_args *args)
  7748	
  7749	{
  7750		unsigned int capacity;
  7751		size_t size;
  7752	
  7753	
  7754		if (IS_ENABLED(CONFIG_SLUB_TINY) || s->flags & SLAB_DEBUG_FLAGS)
  7755			return 0;
  7756	
  7757		/*
  7758		 * Bootstrap caches can't have sheaves for now (SLAB_NO_OBJ_EXT).
  7759		 * SLAB_NOLEAKTRACE caches (e.g., kmemleak's object_cache) must not
  7760		 * have sheaves to avoid recursion when sheaf allocation triggers
  7761		 * kmemleak tracking.
  7762		 */
  7763		if (s->flags & (SLAB_NO_OBJ_EXT | SLAB_NOLEAKTRACE))
  7764			return 0;
  7765	
  7766		/*
  7767		 * For now we use roughly similar formula (divided by two as there are
  7768		 * two percpu sheaves) as what was used for percpu partial slabs, which
  7769		 * should result in similar lock contention (barn or list_lock)
  7770		 */
  7771		if (s->size >= PAGE_SIZE)
  7772			capacity = 4;
  7773		else if (s->size >= 1024)
  7774			capacity = 12;
  7775		else if (s->size >= 256)
  7776			capacity = 26;
  7777		else
  7778			capacity = 60;
  7779	
  7780		/* Increment capacity to make sheaf exactly a kmalloc size bucket */
  7781		size = struct_size_t(struct slab_sheaf, objects, capacity);
  7782		size = kmalloc_size_roundup(size);
  7783		capacity = (size - struct_size_t(struct slab_sheaf, objects, 0)) / sizeof(void *);
  7784	
  7785		/*
  7786		 * Respect an explicit request for capacity that's typically motivated by
  7787		 * expected maximum size of kmem_cache_prefill_sheaf() to not end up
  7788		 * using low-performance oversize sheaves
  7789		 */
  7790		capacity = max(capacity, args->sheaf_capacity);
> 7791		return max_t(unsigned int, capacity, USHORT_MAX);
  7792	}
  7793	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A7525634
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jan 2024 14:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706367389; cv=none; b=g1zLicoSaH3T4i9k8x2Xbasnx+XSeUM2dxPc2bSW5Wxp1NJaoRC+pBL6krAV0RplJXpercSuQfDOdLQFt6cR0Tj1Kwq4hRkudmZ2bHXQmyJxNp9rBAAKWqLlgImTB/6nNbiliijpnA1K/dG35zXK/AY9YO8QBX2Nr1xLMrwRQU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706367389; c=relaxed/simple;
	bh=rDY+Sf624J+tU5HbWQBPgcstAHbBGCm654gdaPdOKn8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UrlrySpdz1JWYI0wVXJeYnN7+RP9DLAmAEWCROuZ8seo0BvK+NT8F4TSvc6ff1b2FhsFRGinQWuqLGqzcWL8yLBcCSe+jIEuqI+prnpYT4Vm4Jl0eHxmMCxBQg4Jjvi31vfgTTche8ybDaSAE1/b2ZOpjZ0BBfvOztilh2Kj6xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KY4LSjCO; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KY4LSjCO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706367387; x=1737903387;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rDY+Sf624J+tU5HbWQBPgcstAHbBGCm654gdaPdOKn8=;
  b=KY4LSjCOM7i9xY7JVZQGq1aKBFdSW24PHLKdQ2vjTkKqSK81M4ZE8n6S
   Ntdpujinw7boDdMUsME443ZWsKSiohzCPs7wggzsj6FaoYubxZlwBNvHN
   hUAjHubioUKfPQlgf0BdaoRtKJRkeRiqwVYUG1jHspENLQOMyn9Fl3N6f
   roGSCa7WW/+BGLugBhrQOk/xzGJFM8jutPH0/u6NzesfKoHLXJl0kL0SM
   vbCpb6cjG0Ykx5H4ApnZGP23ZlhQNzRrJvXIE6hVOgOUK7dYxpyrfAZvz
   ioV7WTDPp7mCBeAvdHJYbhRVLhouj2ir0kxTqD6iyLHHuHGi/GlotyOvr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="10069306"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="10069306"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 06:56:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="21651633"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Jan 2024 06:56:24 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTk6Y-0002RO-35;
	Sat, 27 Jan 2024 14:56:22 +0000
Date: Sat, 27 Jan 2024 22:55:34 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:uptr_v3 4/8] kernel/bpf/arena.c:356:15: warning: variable
 'entry' set but not used
Message-ID: <202401272243.6PxZdzJ2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git uptr_v3
head:   f3fb4035708d321fdf10508720d84fa6b917550c
commit: b0aa3d7371f1d22037e035410d6eafb29ec12dc4 [4/8] bpf: Introduce bpf arena.
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240127/202401272243.6PxZdzJ2-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240127/202401272243.6PxZdzJ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401272243.6PxZdzJ2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/arena.c: In function 'arena_free_page':
>> kernel/bpf/arena.c:356:15: warning: variable 'entry' set but not used [-Wunused-but-set-variable]
     356 |         void *entry;
         |               ^~~~~


vim +/entry +356 kernel/bpf/arena.c

   346	
   347	/*
   348	 * If page is presevent in vmalloc area, unmap it from vmalloc area,
   349	 * unmap it from all user space vma-s,
   350	 * and free it.
   351	 */
   352	static void arena_free_page(struct bpf_arena *arena, u32 uptr)
   353	{
   354		struct page *page;
   355		long kbase, kaddr;
 > 356		void *entry;
   357	
   358		kbase = bpf_arena_get_kern_vm_start(arena);
   359		kaddr = kbase + uptr;
   360	
   361		page = vmalloc_to_page((void *)kaddr);
   362		if (IS_ENABLED(CONFIG_DEBUG_VM))
   363			printk("arena_free_page: kaddr %lx page %px uptr %x mapped %d\n",
   364			       kaddr, page, uptr, page ? page_mapped(page) : 0);
   365		if (!page)
   366			return;
   367		vunmap_range(kaddr, kaddr + PAGE_SIZE);
   368		entry = mtree_erase(&arena->mt, (u32)(uptr - (u32)arena->user_vm_start) >> PAGE_SHIFT);
   369		if (page_mapped(page)) { /* mapped by some user process */
   370			struct vma_list *vml;
   371	
   372			list_for_each_entry(vml, &arena->vma_list, head)
   373				zap_page_range_single(vml->vma,
   374						      clear_lo32(arena->user_vm_start) + uptr,
   375						      PAGE_SIZE, NULL);
   376		}
   377		__free_page(page);
   378	}
   379	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

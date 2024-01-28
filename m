Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5324C85
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jan 2024 03:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706411715; cv=none; b=NrL9DxO2SnkgOZ/BXRW5QOQb0iJLlRQkcy/tRtQ7rTHtsw+toV9DARHMV0yS+vMKg6Cr6Fe+E3/G9Mt+CK4DqxmAU1FCKM7/15ABQCHUeA8HuyJuHHscQ6vifWDU7/SrQBD15hsE1l9HjTKoqq8Y/3hp0LqxD9Xi7TwsO380hQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706411715; c=relaxed/simple;
	bh=fa95ivzHB2SILmCWNxHRpK4KiNn614nqFFo73OT43Yw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V4WVePth5Yod26Kbx20kQm4gswW9r10ZywdverEi/8vSPLcklGAhOFlUVgxu1Sb4FLFXNCB38+CBZDBnBEl9QAiBwjADBBclMaNpU+HYpLjGZ7y+4snmq0XtUWpDoOq383vYM5c1zV586hJGBv/DHNso7Xyj7Zq5laaZ/3XPj8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g3+vcBJ+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g3+vcBJ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706411713; x=1737947713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fa95ivzHB2SILmCWNxHRpK4KiNn614nqFFo73OT43Yw=;
  b=g3+vcBJ+3McUT7tY1thYXuQyR5QtliJ5xGqCGUPpZQMrJs4cHiK0DsR6
   ax/d2aZw02vrRan5f6qeOAyeuvcdZA0LXVLJqyZ4cvFOEgi6G0fZtg9pU
   qBTNNZQyGY+Oa5KMF45+u2h6a0JocxTuaHgUFYkYdxdl5/IQCMoYCU9eg
   5DReDapv5Bt4lJ2GdnWPb3VsT8cvPMvg4Ar9EHUG6oBNkKlbrO0JVIx1h
   nXbl5ua7sVwymKyj3/aJuooghtpAt/ul6eKmwmGYZBCQErKE+bDxcwLSj
   3iCFKnXhlS+a0U87nLTmCoJxu66+zC6INyi6gIDhmdn+bHeFDXleal6pn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="9410609"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="9410609"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 19:15:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="906712300"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="906712300"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 27 Jan 2024 19:15:11 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTvdV-00030w-16;
	Sun, 28 Jan 2024 03:15:09 +0000
Date: Sun, 28 Jan 2024 11:14:11 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:uptr_v3 4/8] kernel/bpf/arena.c:316:65: sparse: sparse:
 restricted gfp_t degrades to integer
Message-ID: <202401281140.sdj6NGR4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git uptr_v3
head:   4c66f0e52ab0db474cdbd5591d0569874551b2f9
commit: b0aa3d7371f1d22037e035410d6eafb29ec12dc4 [4/8] bpf: Introduce bpf arena.
config: i386-randconfig-062-20240127 (https://download.01.org/0day-ci/archive/20240128/202401281140.sdj6NGR4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401281140.sdj6NGR4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401281140.sdj6NGR4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/bpf/arena.c:316:65: sparse: sparse: restricted gfp_t degrades to integer
>> kernel/bpf/arena.c:316:76: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted gfp_t [usertype] flags @@     got unsigned int @@
   kernel/bpf/arena.c:316:76: sparse:     expected restricted gfp_t [usertype] flags
   kernel/bpf/arena.c:316:76: sparse:     got unsigned int
   kernel/bpf/arena.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
>> kernel/bpf/arena.c:98:31: sparse: sparse: cast truncates bits from constant value (100010000 becomes 10000)
   kernel/bpf/arena.c:149:40: sparse: sparse: cast truncates bits from constant value (100008000 becomes 8000)

vim +316 kernel/bpf/arena.c

   303	
   304	/*
   305	 * Allocate pages and vmap them into kernel vmalloc area.
   306	 * Later the pages will be mmaped into user space vma.
   307	 */
   308	static long arena_alloc_pages(struct bpf_arena *arena, long page_cnt)
   309	{
   310		struct page **pages;
   311		long pgoff, kaddr, nr_pages = 0;
   312		int ret, i;
   313		u64 kern_vm_start = bpf_arena_get_kern_vm_start(arena);
   314	
   315		/* __GFP_ZERO is needed, since alloc_pages_bulk_array() only fills in non-zero entries */
 > 316		pages = kvmalloc_array(page_cnt, sizeof(struct page *), GFP_KERNEL | ___GFP_ZERO);
   317		if (!pages)
   318			return 0;
   319	
   320		ret = mtree_alloc_range(&arena->mt, &pgoff, arena, page_cnt, 0,
   321					(arena->user_vm_end - arena->user_vm_start) >> PAGE_SHIFT,
   322					GFP_KERNEL);
   323		if (ret)
   324			goto out;
   325	
   326		nr_pages = alloc_pages_bulk_array(GFP_KERNEL, page_cnt, pages);
   327		if (nr_pages != page_cnt)
   328			goto out;
   329	
   330		kaddr = kern_vm_start + (u32)(arena->user_vm_start + pgoff * PAGE_SIZE);
   331		ret = vmap_pages_range(kaddr, kaddr + PAGE_SIZE * page_cnt, PAGE_KERNEL,
   332				       pages, PAGE_SHIFT);
   333		if (IS_ENABLED(CONFIG_DEBUG_VM))
   334			printk("arena_alloc_pages %ld pages kaddr %lx pgoff %ld page[0] %px err %d\n",
   335			       page_cnt, kaddr, pgoff, pages[0], ret);
   336		if (ret)
   337			goto out;
   338		return clear_lo32(arena->user_vm_start) + (u32)(kaddr - kern_vm_start);
   339	out:
   340		if (pages)
   341			for (i = 0; i < nr_pages; i++)
   342				__free_page(pages[i]);
   343		kvfree(pages);
   344		return 0;
   345	}
   346	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

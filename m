Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B434D8DA
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 15:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725897092; cv=none; b=ooYuE8AsXinvIXKw7yOeagpAjC14m9QTxe/pZcAECI9lujeuBAomZ9h9zdbIrxpRTrUcUFgMOjpEhfsAievN7aH590bTRr6mflFA9KlmaiZyb/Ek+JRUaMv+3NeATSl2OYdbB6ei//Ji/rR/66aqrT788vPVwNF4bfqMZ3TN004=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725897092; c=relaxed/simple;
	bh=dGbcJMOE7tRZOblqHOTXXFG4yzNKbsbiuYqBdgJB3ds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eykBoJqOzxONGx+PzYjNbg7K4RIYcYtZV3PJS9p/PU4xazlsl6ki/d2Fj7fMEYZCDn1ujTl8BA2RYG7zSYXrxqs90S8o5QCSubYm/kYGwmoXP/8EefE+XW5m6rdQlvWo+eN2rGdnbz3QSyvvq8wg4te1hVqARaU/AD8/keNVxHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B8Kmf3mC; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B8Kmf3mC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725897090; x=1757433090;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dGbcJMOE7tRZOblqHOTXXFG4yzNKbsbiuYqBdgJB3ds=;
  b=B8Kmf3mC3hiCc8GhEPUyKYC6Dg6/ybezsCNQbvR9gMv/R7+5yrimPMAq
   uj9WQsVQ0v+BxnwFzm1Rg8JcVsvg55kLwP8w3ssaQRPKbSoHXahtk3aGL
   ZxeV9eMsswKbu9xsKwk8ar0lzjL8Mj5+x6iKuTR+huQOm4ZY/z6n9wck8
   dGGfY8g+zex3mfG5c5IR0KmxYMbabQUijhCR+mcCc6cmLiriHCD7/XGb+
   X6hq3Kf6h3aOVY3UmqSh9Y57nCCfUeUzxwIwC/q0+BGS0rAzyJjxrHwFP
   9mdZVQB1oc2zZ2sUpfC7k5Y2hBKbwOs94eMesKjhM0dv+YbGdctF4iu7E
   g==;
X-CSE-ConnectionGUID: bRfmLnckRFu3noRyG79kHA==
X-CSE-MsgGUID: zF9aN6xlQ1SFKv8+1FBDyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24546147"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="24546147"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 08:51:29 -0700
X-CSE-ConnectionGUID: d6e/AnaISvyhp90xWSJqFQ==
X-CSE-MsgGUID: TXACAGGoQlaAAvQmdEuRpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="66724418"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Sep 2024 08:51:28 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sngfm-000EuJ-0K;
	Mon, 09 Sep 2024 15:51:26 +0000
Date: Mon, 9 Sep 2024 23:51:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-garbage 190/258]
 include/linux/mm.h:1200:24: error: 'VMALLOC_START' undeclared; did you mean
 'KMALLOC_DMA'?
Message-ID: <202409092312.0X3vUppH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-garbage
head:   c88c2220b6b527cec382f06a0ba3feab2a593b37
commit: a2a5fdffbb42082064006597ddabecccdb746d39 [190/258] vmalloc: is_vmalloc_addr_inlined()
config: i386-buildonly-randconfig-002-20240909 (https://download.01.org/0day-ci/archive/20240909/202409092312.0X3vUppH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409092312.0X3vUppH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409092312.0X3vUppH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/cacheflush.h:5,
                    from include/linux/cacheflush.h:5,
                    from include/linux/highmem.h:8,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/buffer_head.h:12,
                    from fs/reiserfs/reiserfs.h:17,
                    from fs/reiserfs/xattr.c:37:
   include/linux/mm.h: In function 'is_vmalloc_addr_inlined':
>> include/linux/mm.h:1200:24: error: 'VMALLOC_START' undeclared (first use in this function); did you mean 'KMALLOC_DMA'?
    1200 |         return addr >= VMALLOC_START && addr < VMALLOC_END;
         |                        ^~~~~~~~~~~~~
         |                        KMALLOC_DMA
   include/linux/mm.h:1200:24: note: each undeclared identifier is reported only once for each function it appears in
>> include/linux/mm.h:1200:48: error: 'VMALLOC_END' undeclared (first use in this function)
    1200 |         return addr >= VMALLOC_START && addr < VMALLOC_END;
         |                                                ^~~~~~~~~~~
--
   In file included from arch/x86/include/asm/cacheflush.h:5,
                    from include/linux/cacheflush.h:5,
                    from include/linux/highmem.h:8,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/buffer_head.h:12,
                    from fs/reiserfs/reiserfs.h:17,
                    from fs/reiserfs/lbalance.c:8:
   include/linux/mm.h: In function 'is_vmalloc_addr_inlined':
>> include/linux/mm.h:1200:24: error: 'VMALLOC_START' undeclared (first use in this function); did you mean 'KMALLOC_DMA'?
    1200 |         return addr >= VMALLOC_START && addr < VMALLOC_END;
         |                        ^~~~~~~~~~~~~
         |                        KMALLOC_DMA
   include/linux/mm.h:1200:24: note: each undeclared identifier is reported only once for each function it appears in
>> include/linux/mm.h:1200:48: error: 'VMALLOC_END' undeclared (first use in this function)
    1200 |         return addr >= VMALLOC_START && addr < VMALLOC_END;
         |                                                ^~~~~~~~~~~
   fs/reiserfs/lbalance.c: In function 'leaf_copy_items':
   fs/reiserfs/lbalance.c:524:29: warning: variable 'dest' set but not used [-Wunused-but-set-variable]
     524 |         struct buffer_head *dest;
         |                             ^~~~
--
   In file included from arch/x86/include/asm/cacheflush.h:5,
                    from include/linux/cacheflush.h:5,
                    from include/linux/highmem.h:8,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/buffer_head.h:12,
                    from fs/reiserfs/reiserfs.h:17,
                    from fs/reiserfs/do_balan.c:15:
   include/linux/mm.h: In function 'is_vmalloc_addr_inlined':
>> include/linux/mm.h:1200:24: error: 'VMALLOC_START' undeclared (first use in this function); did you mean 'KMALLOC_DMA'?
    1200 |         return addr >= VMALLOC_START && addr < VMALLOC_END;
         |                        ^~~~~~~~~~~~~
         |                        KMALLOC_DMA
   include/linux/mm.h:1200:24: note: each undeclared identifier is reported only once for each function it appears in
>> include/linux/mm.h:1200:48: error: 'VMALLOC_END' undeclared (first use in this function)
    1200 |         return addr >= VMALLOC_START && addr < VMALLOC_END;
         |                                                ^~~~~~~~~~~
   fs/reiserfs/do_balan.c: In function 'balance_leaf_new_nodes_paste_whole':
   fs/reiserfs/do_balan.c:1147:13: warning: variable 'leaf_mi' set but not used [-Wunused-but-set-variable]
    1147 |         int leaf_mi;
         |             ^~~~~~~
--
   In file included from arch/x86/include/asm/cacheflush.h:5,
                    from include/linux/cacheflush.h:5,
                    from include/linux/highmem.h:8,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/buffer_head.h:12,
                    from fs/reiserfs/reiserfs.h:17,
                    from fs/reiserfs/fix_node.c:8:
   include/linux/mm.h: In function 'is_vmalloc_addr_inlined':
>> include/linux/mm.h:1200:24: error: 'VMALLOC_START' undeclared (first use in this function); did you mean 'KMALLOC_DMA'?
    1200 |         return addr >= VMALLOC_START && addr < VMALLOC_END;
         |                        ^~~~~~~~~~~~~
         |                        KMALLOC_DMA
   include/linux/mm.h:1200:24: note: each undeclared identifier is reported only once for each function it appears in
>> include/linux/mm.h:1200:48: error: 'VMALLOC_END' undeclared (first use in this function)
    1200 |         return addr >= VMALLOC_START && addr < VMALLOC_END;
         |                                                ^~~~~~~~~~~
   fs/reiserfs/fix_node.c: In function 'dc_check_balance_leaf':
   fs/reiserfs/fix_node.c:1938:13: warning: variable 'maxsize' set but not used [-Wunused-but-set-variable]
    1938 |         int maxsize, ret;
         |             ^~~~~~~
   fs/reiserfs/fix_node.c:1935:13: warning: variable 'levbytes' set but not used [-Wunused-but-set-variable]
    1935 |         int levbytes;
         |             ^~~~~~~~
--
   In file included from arch/x86/include/asm/cacheflush.h:5,
                    from include/linux/cacheflush.h:5,
                    from include/linux/highmem.h:8,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/buffer_head.h:12,
                    from fs/reiserfs/reiserfs.h:17,
                    from fs/reiserfs/prints.c:7:
   include/linux/mm.h: In function 'is_vmalloc_addr_inlined':
>> include/linux/mm.h:1200:24: error: 'VMALLOC_START' undeclared (first use in this function); did you mean 'KMALLOC_DMA'?
    1200 |         return addr >= VMALLOC_START && addr < VMALLOC_END;
         |                        ^~~~~~~~~~~~~
         |                        KMALLOC_DMA
   include/linux/mm.h:1200:24: note: each undeclared identifier is reported only once for each function it appears in
>> include/linux/mm.h:1200:48: error: 'VMALLOC_END' undeclared (first use in this function)
    1200 |         return addr >= VMALLOC_START && addr < VMALLOC_END;
         |                                                ^~~~~~~~~~~
   fs/reiserfs/prints.c: In function 'prepare_error_buf':
   fs/reiserfs/prints.c:221:17: warning: function 'prepare_error_buf' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     221 |                 p += vscnprintf(p, end - p, fmt1, args);
         |                 ^
   fs/reiserfs/prints.c:260:9: warning: function 'prepare_error_buf' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     260 |         p += vscnprintf(p, end - p, fmt1, args);
         |         ^


vim +1200 include/linux/mm.h

  1188	
  1189	/*
  1190	 * Determine if an address is within the vmalloc range
  1191	 *
  1192	 * On nommu, vmalloc/vfree wrap through kmalloc/kfree directly, so there
  1193	 * is no special casing required.
  1194	 */
  1195	#ifdef CONFIG_MMU
  1196	static inline bool is_vmalloc_addr_inlined(const void *x)
  1197	{
  1198		unsigned long addr = (unsigned long)kasan_reset_tag(x);
  1199	
> 1200		return addr >= VMALLOC_START && addr < VMALLOC_END;
  1201	}
  1202	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

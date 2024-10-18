Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4BB1F5EA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Oct 2024 13:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729257401; cv=none; b=IUe8H8uH6YkCiJpXhld/btIi6R3jUl5YAdYYU+ES4qYq7FdV6Q2PR8jYW3oB4sfNrNpFTK9e9aKq6mhmXoKy+y+jMY+ukrfsKkAfdUbb7HrrxmTIa2Q7HgjiBl5gz97+R4ojFn2Xg/X4pYcGAPhxzmIlL/hwBkVO/98JzHKdPXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729257401; c=relaxed/simple;
	bh=F6ShYxlz+fIo50WZdOLgrl/AbfRfBWrpys8l/RDPdHE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QNMU5mwNy8U+NlUaU3IQcB8xxUpPFFNbR+Fw77pkHPXpUsz1AMP1ptzmIW9w/dC+lk2oByxl4IQcPebydprNuWEUk7/QOSJPj6zcF+4qU8+F0UW0ehjgx8lGSAbGv904CaN6yan9yJ5dRqrPc1EL3X+oGgM4nXyG45w5I4/aHOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mvtvotRi; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mvtvotRi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729257400; x=1760793400;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F6ShYxlz+fIo50WZdOLgrl/AbfRfBWrpys8l/RDPdHE=;
  b=mvtvotRiTdJFLAQmOlOeDwQyOPVC2nWxIF7a5uFgfdbWfnYGt9g0D5Zk
   jzLKjkyguc3iVNicP5nE6zBrUFQCY8Qfk5Y6avIbPRR+9uLR2aneXEgB3
   FZZRNbRW8wcBqIVhtCoRgQWKrLozZbFZfaXAR0eWN9gkDJzCh19eSD+i1
   7Ex5gzTyt6GJDQ9ZkJ28qzkgWJMQBk0idX0afx4mnkuzpBEQY8dzzcgo6
   jf7Z8rE4Kc1+flsih19jg5EzvUW+fZ1NkOJfPy71xfqfGc3GpJaZ8Xlvx
   wK9LmIBiZHNHK0rzWJL1MPVivWZkrgyPxKwe76FiEdMxTrJggFWTH4NZ8
   Q==;
X-CSE-ConnectionGUID: hjiNpcboRryQIfpfa5FFBA==
X-CSE-MsgGUID: V/wmaMaIR2iVz65TznhknA==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="28666105"
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="28666105"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 06:16:39 -0700
X-CSE-ConnectionGUID: gaHuSmjJQO6WaeZ2X1Sfcg==
X-CSE-MsgGUID: 6gNDZ1RCSLSvCWlKb1BOPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="78467391"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Oct 2024 06:16:37 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1mqJ-000Nqo-35;
	Fri, 18 Oct 2024 13:16:35 +0000
Date: Fri, 18 Oct 2024 21:15:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 4/7] include/linux/kern_levels.h:5:25:
 warning: format '%lx' expects argument of type 'long unsigned int', but
 argument 5 has type 'size_t' {aka 'unsigned int'}
Message-ID: <202410182113.u4gK1Rac-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   391a26b8f43731a2391daa0f12970df11a020aef
commit: f5681d0019946b46effc39bc6501c1ed02f65162 [4/7] CHROMIUM: dma-buf: heaps: mtk_restricted: Add dynamic CMA support
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241018/202410182113.u4gK1Rac-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241018/202410182113.u4gK1Rac-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410182113.u4gK1Rac-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/io.h:11,
                    from include/linux/iosys-map.h:10,
                    from include/linux/dma-buf.h:16,
                    from drivers/dma-buf/heaps/restricted_heap_mtk.c:9:
   drivers/dma-buf/heaps/restricted_heap_mtk.c: In function 'mtk_restricted_memory_cma_allocate':
>> include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:429:25: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:500:9: note: in expansion of macro 'printk'
     500 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:500:16: note: in expansion of macro 'KERN_ERR'
     500 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   drivers/dma-buf/heaps/restricted_heap_mtk.c:223:17: note: in expansion of macro 'pr_err'
     223 |                 pr_err("%s: failed used 0x%x total_size 0x%lx needed 0x%lx\n",
         |                 ^~~~~~
   drivers/dma-buf/heaps/restricted_heap_mtk.c: In function 'mtk_tee_restrict_memory':
   drivers/dma-buf/heaps/restricted_heap_mtk.c:323:48: error: implicit declaration of function 'phys_to_page'; did you mean 'pfn_to_page'? [-Werror=implicit-function-declaration]
     323 |                 sg_set_page(buf->sg_table.sgl, phys_to_page(pa_tee), buf->size, 0);
         |                                                ^~~~~~~~~~~~
         |                                                pfn_to_page
   drivers/dma-buf/heaps/restricted_heap_mtk.c:323:48: warning: passing argument 2 of 'sg_set_page' makes pointer from integer without a cast [-Wint-conversion]
     323 |                 sg_set_page(buf->sg_table.sgl, phys_to_page(pa_tee), buf->size, 0);
         |                                                ^~~~~~~~~~~~~~~~~~~~
         |                                                |
         |                                                int
   In file included from include/linux/dma-buf.h:19:
   include/linux/scatterlist.h:136:69: note: expected 'struct page *' but argument is of type 'int'
     136 | static inline void sg_set_page(struct scatterlist *sg, struct page *page,
         |                                                        ~~~~~~~~~~~~~^~~~
   drivers/dma-buf/heaps/restricted_heap_mtk.c:359:33: warning: passing argument 2 of 'sg_set_page' makes pointer from integer without a cast [-Wint-conversion]
     359 |                 sg_set_page(sg, phys_to_page(tee_sg_item->pa),
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 int
   include/linux/scatterlist.h:136:69: note: expected 'struct page *' but argument is of type 'int'
     136 | static inline void sg_set_page(struct scatterlist *sg, struct page *page,
         |                                                        ~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

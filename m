Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AACF78F20
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 11:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736164369; cv=none; b=H9EGrCWBEA4UzTZUitP/iCGYB2L5J5Oh4WDxWqy4N9sEU2OHeVzaM8qRKQgdWUmRZd4IvuPOxENbocCET8xWKhta5TPyQgbUgh8zdo19yQsZUzHNghSVGZgc+4oJytB2oq0ZFXU93W3Jr+E+sZ26P6K98KqqQ0XEDht1+JBxuZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736164369; c=relaxed/simple;
	bh=jk6KBsWbqkWbl7swodoIw35hmeh8U4hhJv1MAhqOVLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LvFpJNHBnTOgAv6OAHoNB+jkXsEHUigAZBxos8mZD/oBwx8M/XPdXqrm+54B+pSTiKlA1M4/VB1zxM8FqLwFALOLbwI6TZwZpYOdJmoiBH7QrW8gcn87ojBXoQjYajpI5H/lDuk8TUKrz/PcqWbgG8aCKR22SLAhv9KK41QP3i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GUiwc+5D; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GUiwc+5D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736164368; x=1767700368;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jk6KBsWbqkWbl7swodoIw35hmeh8U4hhJv1MAhqOVLA=;
  b=GUiwc+5D6p+9PAEcMfVTi/ac1s1Kmw6I2Tq/Bccnx7XEuShBZ51UsEK2
   RhjX2e4d5Q4JbphCYgBPpLDvUhO66rC6fhS8WmpGj/l8Zzt3Lugxi1snE
   Ptdq2zdWewuE0/wQk/7pr8QkPG4hbqpSx/ssLUN80skBpDh+ksxsmkb3T
   33Mgy4jHQggKK/dPlpeVNek3gvG74iFep9oZZhQbGwVWGMZMltPhDH9+m
   KDPBUL3U3jRXhqRiZjvQOcMMTinO0QS15FCijnP+92VlKapqiFMBhQOVv
   LtXkir8lsi7nGDFDtxDPHD39zEuMJ5SLvmBJLTlqsSJkKDzpi/DGTiTYX
   Q==;
X-CSE-ConnectionGUID: Dpk8bF40RFaUrmduLelFkA==
X-CSE-MsgGUID: u6ll92P+ROOk9JOm4mKMuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="40080202"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="40080202"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 03:52:46 -0800
X-CSE-ConnectionGUID: Xugri85gQ/yKzeNmAS/+Cg==
X-CSE-MsgGUID: +qlJLULKSg2Piq/nCLaAYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="102317481"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Jan 2025 03:52:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUlez-000CXv-2Q;
	Mon, 06 Jan 2025 11:52:41 +0000
Date: Mon, 6 Jan 2025 19:52:34 +0800
From: kernel test robot <lkp@intel.com>
To: Hongzhen Luo <hongzhen@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v5 4/4] erofs: introduce .fadvise for page cache share
Message-ID: <202501061957.awS07N4f-lkp@intel.com>
References: <20250105151208.3797385-5-hongzhen@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250105151208.3797385-5-hongzhen@linux.alibaba.com>

Hi Hongzhen,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on xiang-erofs/dev-test]
[also build test WARNING on xiang-erofs/dev xiang-erofs/fixes linus/master v6.13-rc6 next-20250106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hongzhen-Luo/erofs-move-struct-erofs_anon_fs_type-to-super-c/20250105-231438
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
patch link:    https://lore.kernel.org/r/20250105151208.3797385-5-hongzhen%40linux.alibaba.com
patch subject: [RFC PATCH v5 4/4] erofs: introduce .fadvise for page cache share
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20250106/202501061957.awS07N4f-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501061957.awS07N4f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501061957.awS07N4f-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/erofs/pagecache_share.c:10:
   fs/erofs/pagecache_share.c: In function 'erofs_pcshr_init_mnt':
   fs/erofs/pagecache_share.c:66:32: error: invalid application of 'sizeof' to incomplete type 'struct interval_tree_node'
      66 |                         sizeof(struct interval_tree_node), 0,
         |                                ^~~~~~
   include/linux/slab.h:430:55: note: in definition of macro 'kmem_cache_create'
     430 |                 default: __kmem_cache_create)(__name, __object_size, __args, __VA_ARGS__)
         |                                                       ^~~~~~~~~~~~~
   fs/erofs/pagecache_share.c: In function 'erofs_pcshr_free_inode':
   fs/erofs/pagecache_share.c:163:15: error: implicit declaration of function 'interval_tree_iter_first'; did you mean 'vma_interval_tree_iter_first'? [-Werror=implicit-function-declaration]
     163 |         seg = interval_tree_iter_first(&vi->segs, 0, LLONG_MAX);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
         |               vma_interval_tree_iter_first
>> fs/erofs/pagecache_share.c:163:13: warning: assignment to 'struct interval_tree_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     163 |         seg = interval_tree_iter_first(&vi->segs, 0, LLONG_MAX);
         |             ^
   fs/erofs/pagecache_share.c:165:28: error: implicit declaration of function 'interval_tree_iter_next'; did you mean 'vma_interval_tree_iter_next'? [-Werror=implicit-function-declaration]
     165 |                 next_seg = interval_tree_iter_next(seg, 0, LLONG_MAX);
         |                            ^~~~~~~~~~~~~~~~~~~~~~~
         |                            vma_interval_tree_iter_next
   fs/erofs/pagecache_share.c:165:26: warning: assignment to 'struct interval_tree_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     165 |                 next_seg = interval_tree_iter_next(seg, 0, LLONG_MAX);
         |                          ^
   fs/erofs/pagecache_share.c:166:17: error: implicit declaration of function 'interval_tree_remove'; did you mean 'vma_interval_tree_remove'? [-Werror=implicit-function-declaration]
     166 |                 interval_tree_remove(seg, &vi->segs);
         |                 ^~~~~~~~~~~~~~~~~~~~
         |                 vma_interval_tree_remove
   fs/erofs/pagecache_share.c: In function 'erofs_pcshr_fadvise':
   fs/erofs/pagecache_share.c:276:13: warning: assignment to 'struct interval_tree_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     276 |         seg = interval_tree_iter_first(&vi->segs, start, end);
         |             ^
   fs/erofs/pagecache_share.c:278:26: warning: assignment to 'struct interval_tree_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     278 |                 next_seg = interval_tree_iter_next(seg, start, end);
         |                          ^
   In file included from include/linux/kernel.h:28,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from fs/erofs/pagecache_share.c:8:
   fs/erofs/pagecache_share.c:283:35: error: invalid use of undefined type 'struct interval_tree_node'
     283 |                 l = max_t(u64, seg->start | 0ULL, start);
         |                                   ^~
   include/linux/minmax.h:93:23: note: in definition of macro '__cmp_once_unique'
      93 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
         |                       ^
   include/linux/minmax.h:221:27: note: in expansion of macro '__cmp_once'
     221 | #define max_t(type, x, y) __cmp_once(max, type, x, y)
         |                           ^~~~~~~~~~
   fs/erofs/pagecache_share.c:283:21: note: in expansion of macro 'max_t'
     283 |                 l = max_t(u64, seg->start | 0ULL, start);
         |                     ^~~~~
   fs/erofs/pagecache_share.c:284:35: error: invalid use of undefined type 'struct interval_tree_node'
     284 |                 r = min_t(u64, seg->last | 0ULL, end);
         |                                   ^~
   include/linux/minmax.h:93:23: note: in definition of macro '__cmp_once_unique'
      93 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
         |                       ^
   include/linux/minmax.h:213:27: note: in expansion of macro '__cmp_once'
     213 | #define min_t(type, x, y) __cmp_once(min, type, x, y)
         |                           ^~~~~~~~~~
   fs/erofs/pagecache_share.c:284:21: note: in expansion of macro 'min_t'
     284 |                 r = min_t(u64, seg->last | 0ULL, end);
         |                     ^~~~~
   fs/erofs/pagecache_share.c:289:24: error: invalid use of undefined type 'struct interval_tree_node'
     289 |                 if (seg->start < l) {
         |                        ^~
   fs/erofs/pagecache_share.c:291:32: error: invalid use of undefined type 'struct interval_tree_node'
     291 |                         new_seg->start = seg->start;
         |                                ^~
   fs/erofs/pagecache_share.c:291:45: error: invalid use of undefined type 'struct interval_tree_node'
     291 |                         new_seg->start = seg->start;
         |                                             ^~
   fs/erofs/pagecache_share.c:292:32: error: invalid use of undefined type 'struct interval_tree_node'
     292 |                         new_seg->last = l;
         |                                ^~
   fs/erofs/pagecache_share.c:293:25: error: implicit declaration of function 'interval_tree_insert'; did you mean 'vma_interval_tree_insert'? [-Werror=implicit-function-declaration]
     293 |                         interval_tree_insert(new_seg, &vi->segs);
         |                         ^~~~~~~~~~~~~~~~~~~~
         |                         vma_interval_tree_insert
   fs/erofs/pagecache_share.c:297:28: error: invalid use of undefined type 'struct interval_tree_node'
     297 |                 if (r < seg->last) {
         |                            ^~
   fs/erofs/pagecache_share.c:299:32: error: invalid use of undefined type 'struct interval_tree_node'
     299 |                         new_seg->start = r;
         |                                ^~
   fs/erofs/pagecache_share.c:300:32: error: invalid use of undefined type 'struct interval_tree_node'
     300 |                         new_seg->last = seg->last;
         |                                ^~
   fs/erofs/pagecache_share.c:300:44: error: invalid use of undefined type 'struct interval_tree_node'
     300 |                         new_seg->last = seg->last;
         |                                            ^~
   fs/erofs/pagecache_share.c: In function 'erofs_pcshr_read_end':
   fs/erofs/pagecache_share.c:367:12: error: invalid use of undefined type 'struct interval_tree_node'
     367 |         seg->start = folio_index(folio);
         |            ^~
   fs/erofs/pagecache_share.c:368:12: error: invalid use of undefined type 'struct interval_tree_node'
     368 |         seg->last = seg->start + (folio_size(folio) >> PAGE_SHIFT);
         |            ^~
   fs/erofs/pagecache_share.c:368:24: error: invalid use of undefined type 'struct interval_tree_node'
     368 |         seg->last = seg->start + (folio_size(folio) >> PAGE_SHIFT);
         |                        ^~
   fs/erofs/pagecache_share.c:369:16: error: invalid use of undefined type 'struct interval_tree_node'
     369 |         if (seg->last > (vi->vfs_inode.i_size >> PAGE_SHIFT))
         |                ^~
   fs/erofs/pagecache_share.c:370:20: error: invalid use of undefined type 'struct interval_tree_node'
     370 |                 seg->last = vi->vfs_inode.i_size >> PAGE_SHIFT;
         |                    ^~
   In file included from arch/arc/include/asm/atomic.h:12,
                    from include/linux/atomic.h:7,
                    from include/linux/refcount.h:95,
                    from fs/erofs/pagecache_share.c:6:
   fs/erofs/pagecache_share.c:371:22: error: invalid use of undefined type 'struct interval_tree_node'
     371 |         DBG_BUGON(seg->last < seg->start);


vim +163 fs/erofs/pagecache_share.c

   153	
   154	void erofs_pcshr_free_inode(struct inode *inode)
   155	{
   156		struct interval_tree_node *seg, *next_seg;
   157		struct erofs_inode *vi = EROFS_I(inode);
   158	
   159		if (S_ISREG(inode->i_mode) &&  vi->ano_inode) {
   160			iput(vi->ano_inode);
   161			vi->ano_inode = NULL;
   162		}
 > 163		seg = interval_tree_iter_first(&vi->segs, 0, LLONG_MAX);
   164		while (seg) {
   165			next_seg = interval_tree_iter_next(seg, 0, LLONG_MAX);
   166			interval_tree_remove(seg, &vi->segs);
   167			erofs_pcshr_free_seg(seg);
   168			seg = next_seg;
   169		}
   170	}
   171	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

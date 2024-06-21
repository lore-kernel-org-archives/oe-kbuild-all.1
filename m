Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE0182D68
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 02:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718935878; cv=none; b=im2IiBCWSrjgui9FknQ2f8g8javOGnEpQj0g1uYa9A/zHJ/PTnR9OCLQUZAeCD0ru1l7PqU1cGJiyyn3VXnd7nd5OHbNl5hwBiKGXe2Dzz+g6V/VvG1ELEjXETSliZ4rWJ49nTd/qSyVkHQ+k7oJGWBdqtN/2vL1tj06cqNRhmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718935878; c=relaxed/simple;
	bh=YdzBh/5RVl/BIDyrMEwfRAJkOcmZL/gpjFcnPbvW2ec=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GQlu29IuzsIGTf84lnh2W7FIcDlTuEuk8yTafhirSYRCFe6/Ikosbip5Gdwzg8aI3t5C5vlt9RivOrsu4CUQ1D8d031zw1DMewP8AhFlEjxX9/madtems4jvotmWi/gxInFkuUPspRs7QolZqEHkag3tDcImXAY3F/skdZV8Zkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k/geZVt0; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k/geZVt0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718935876; x=1750471876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YdzBh/5RVl/BIDyrMEwfRAJkOcmZL/gpjFcnPbvW2ec=;
  b=k/geZVt0rT+mpYeOfsuVQN5Cy9l81kHqpfve0MqLGzxXf26azuD38X6f
   UAHifSnjWl5RfFBQXycHwVt50qHhj39Kmxj5tdy3GNLyyMmbGeNHijdLE
   dRDX16b+aUzA/l/JSNSZXSGpiSQhUOlvF9p9iRJTZP6mHauZn0n39O53c
   CoMUW/xx9OUNgDnFybj+wzttonLXqwozrZ22bF2AbPxc3pyPmuMqxiloZ
   nvJ7l0W1h4dcbFhhEXUs5oZt+sRfIHCDNGl5JH8ny2ezbOgLDUO3qvRAx
   rlhrpBUE8ybAk+FZk1YAwtFoJtgewhIvgw2NN/AdMernFnT8X+Upb99nY
   Q==;
X-CSE-ConnectionGUID: RM1Tw0+CTkG9U4Bgu14WJA==
X-CSE-MsgGUID: nSszWZJgRFWYV4KLE632Sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="16096255"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="16096255"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 19:11:14 -0700
X-CSE-ConnectionGUID: Jru93vvqTXSeIwpcgClhlQ==
X-CSE-MsgGUID: VYtWRDn7Q1W72lreVktjZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="42522758"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Jun 2024 19:11:12 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKTk6-000870-1T;
	Fri, 21 Jun 2024 02:11:10 +0000
Date: Fri, 21 Jun 2024 10:10:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kairui Song <kasong@tencent.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Huang, Ying" <ying.huang@intel.com>
Subject: [linux-next:master 6383/7397] mm/page_io.c:283:41: error: implicit
 declaration of function 'swap_dev_pos'
Message-ID: <202406210911.j0JhlO0N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b992b79ca8bc336fa8e2c80990b5af80ed8f36fd
commit: d2b0c82185149e17ca3efc51c74c643c21668d63 [6383/7397] mm/swap: get the swap device offset directly
config: x86_64-randconfig-014-20240202 (https://download.01.org/0day-ci/archive/20240621/202406210911.j0JhlO0N-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406210911.j0JhlO0N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406210911.j0JhlO0N-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   mm/page_io.c:78:5: warning: no previous prototype for 'generic_swapfile_activate' [-Wmissing-prototypes]
      78 | int generic_swapfile_activate(struct swap_info_struct *sis,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_io.c:179:5: error: redefinition of 'swap_writepage'
     179 | int swap_writepage(struct page *page, struct writeback_control *wbc)
         |     ^~~~~~~~~~~~~~
   In file included from mm/page_io.c:28:
   mm/swap.h:105:19: note: previous definition of 'swap_writepage' with type 'int(struct page *, struct writeback_control *)'
     105 | static inline int swap_writepage(struct page *p, struct writeback_control *wbc)
         |                   ^~~~~~~~~~~~~~
   mm/page_io.c: In function 'swap_writepage':
   mm/page_io.c:209:9: error: implicit declaration of function '__swap_writepage'; did you mean 'swap_writepage'? [-Werror=implicit-function-declaration]
     209 |         __swap_writepage(folio, wbc);
         |         ^~~~~~~~~~~~~~~~
         |         swap_writepage
   mm/page_io.c: At top level:
   mm/page_io.c:252:5: warning: no previous prototype for 'sio_pool_init' [-Wmissing-prototypes]
     252 | int sio_pool_init(void)
         |     ^~~~~~~~~~~~~
   In file included from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from mm/page_io.c:14:
   mm/page_io.c: In function 'sio_write_complete':
>> mm/page_io.c:283:41: error: implicit declaration of function 'swap_dev_pos' [-Werror=implicit-function-declaration]
     283 |                                    ret, swap_dev_pos(page_swap_entry(page)));
         |                                         ^~~~~~~~~~~~
   include/linux/printk.h:436:33: note: in definition of macro 'printk_index_wrap'
     436 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:658:17: note: in expansion of macro 'printk'
     658 |                 printk(fmt, ##__VA_ARGS__);                             \
         |                 ^~~~~~
   include/linux/printk.h:672:9: note: in expansion of macro 'printk_ratelimited'
     672 |         printk_ratelimited(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~
   mm/page_io.c:282:17: note: in expansion of macro 'pr_err_ratelimited'
     282 |                 pr_err_ratelimited("Write error %ld on dio swapfile (%llu)\n",
         |                 ^~~~~~~~~~~~~~~~~~
>> include/linux/kern_levels.h:5:25: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 3 has type 'int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:436:25: note: in definition of macro 'printk_index_wrap'
     436 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:658:17: note: in expansion of macro 'printk'
     658 |                 printk(fmt, ##__VA_ARGS__);                             \
         |                 ^~~~~~
   include/linux/printk.h:672:9: note: in expansion of macro 'printk_ratelimited'
     672 |         printk_ratelimited(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:672:28: note: in expansion of macro 'KERN_ERR'
     672 |         printk_ratelimited(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                            ^~~~~~~~
   mm/page_io.c:282:17: note: in expansion of macro 'pr_err_ratelimited'
     282 |                 pr_err_ratelimited("Write error %ld on dio swapfile (%llu)\n",
         |                 ^~~~~~~~~~~~~~~~~~
   mm/page_io.c: In function 'swap_writepage_bdev_sync':
   mm/page_io.c:343:33: error: implicit declaration of function 'swap_folio_sector'; did you mean 'zswap_folio_swapin'? [-Werror=implicit-function-declaration]
     343 |         bio.bi_iter.bi_sector = swap_folio_sector(folio);
         |                                 ^~~~~~~~~~~~~~~~~
         |                                 zswap_folio_swapin
   mm/page_io.c: At top level:
   mm/page_io.c:375:6: warning: no previous prototype for '__swap_writepage' [-Wmissing-prototypes]
     375 | void __swap_writepage(struct folio *folio, struct writeback_control *wbc)
         |      ^~~~~~~~~~~~~~~~
   mm/page_io.c:375:6: warning: conflicting types for '__swap_writepage'; have 'void(struct folio *, struct writeback_control *)'
   mm/page_io.c:209:9: note: previous implicit declaration of '__swap_writepage' with type 'void(struct folio *, struct writeback_control *)'
     209 |         __swap_writepage(folio, wbc);
         |         ^~~~~~~~~~~~~~~~
   mm/page_io.c:393:6: error: redefinition of 'swap_write_unplug'
     393 | void swap_write_unplug(struct swap_iocb *sio)
         |      ^~~~~~~~~~~~~~~~~
   mm/swap.h:80:20: note: previous definition of 'swap_write_unplug' with type 'void(struct swap_iocb *)'
      80 | static inline void swap_write_unplug(struct swap_iocb *sio)
         |                    ^~~~~~~~~~~~~~~~~
   mm/page_io.c: In function 'swap_read_folio_fs':
   mm/page_io.c:440:25: error: implicit declaration of function 'swap_read_unplug'; did you mean 'swap_write_unplug'? [-Werror=implicit-function-declaration]
     440 |                         swap_read_unplug(sio);
         |                         ^~~~~~~~~~~~~~~~
         |                         swap_write_unplug
   mm/page_io.c: At top level:
   mm/page_io.c:496:6: error: redefinition of 'swap_read_folio'
     496 | void swap_read_folio(struct folio *folio, bool synchronous,
         |      ^~~~~~~~~~~~~~~
   mm/swap.h:76:20: note: previous definition of 'swap_read_folio' with type 'void(struct folio *, bool,  struct swap_iocb **)' {aka 'void(struct folio *, _Bool,  struct swap_iocb **)'}
      76 | static inline void swap_read_folio(struct folio *folio, bool do_poll,
         |                    ^~~~~~~~~~~~~~~
   mm/page_io.c:537:6: warning: no previous prototype for '__swap_read_unplug' [-Wmissing-prototypes]
     537 | void __swap_read_unplug(struct swap_iocb *sio)
         |      ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/swap_dev_pos +283 mm/page_io.c

   264	
   265	static void sio_write_complete(struct kiocb *iocb, long ret)
   266	{
   267		struct swap_iocb *sio = container_of(iocb, struct swap_iocb, iocb);
   268		struct page *page = sio->bvec[0].bv_page;
   269		int p;
   270	
   271		if (ret != sio->len) {
   272			/*
   273			 * In the case of swap-over-nfs, this can be a
   274			 * temporary failure if the system has limited
   275			 * memory for allocating transmit buffers.
   276			 * Mark the page dirty and avoid
   277			 * folio_rotate_reclaimable but rate-limit the
   278			 * messages but do not flag PageError like
   279			 * the normal direct-to-bio case as it could
   280			 * be temporary.
   281			 */
   282			pr_err_ratelimited("Write error %ld on dio swapfile (%llu)\n",
 > 283					   ret, swap_dev_pos(page_swap_entry(page)));
   284			for (p = 0; p < sio->pages; p++) {
   285				page = sio->bvec[p].bv_page;
   286				set_page_dirty(page);
   287				ClearPageReclaim(page);
   288			}
   289		}
   290	
   291		for (p = 0; p < sio->pages; p++)
   292			end_page_writeback(sio->bvec[p].bv_page);
   293	
   294		mempool_free(sio, sio_pool);
   295	}
   296	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

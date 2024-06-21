Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867A016A936
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 18:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718992821; cv=none; b=mu7QzU95ycP6AlJsR7ZkHFy7h8mugToERHzB/03ViXVAI63StfXqad0SRQVUhHIg45AoBN1FM3+pj7BFp1xiBRuUkPFpi16FOoWseJDo/l9ziBLz5wlkgzHF/AlhT9Uy/36eyX0pHlGfy/OBaOoVIkZGpXfY9W8m1Zr+kXlAAa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718992821; c=relaxed/simple;
	bh=XgW2P7FrEn0a0n1XiBfKhwDh97ZscoHgc3HlpQ5c/Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qb7Ef6am5pvO5YewRoYiNZwHFqbAAvt1Syv+qASzxVZFqZbAOJPl18G9IlbpyNmGAj9XBQDIlO4kUSmYuU7AKj8k3gBsMnxk8I6ME62EAb+c4IOqk4jyNZyA+A2PbBVla9tr1/jUsjgC+kto958x80mjWVUe1JUfXlFIXVi0MUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eDzVcvfi; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eDzVcvfi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718992819; x=1750528819;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XgW2P7FrEn0a0n1XiBfKhwDh97ZscoHgc3HlpQ5c/Rg=;
  b=eDzVcvfiATD69sPTid7PYooZNVin6BZpjG8dssmXzR4vDSTXj1a/04w1
   VLcCt6dCSHYVXrTzFnDfovusmRLDxIAefGTr5pHFxLUx9n3DYwt2mZLRA
   x2pLjlDYcPfwkwDyeqJ4WpcTPMk6/PL3Rg6csVsRg+pKpxjIU/sAlWkKa
   xxXSbyerIH/F1pa5XnerG7d1xh5zU0Lf1avouicaaxuTNVtd+UQ2+/u9a
   2J6YPu1BfzTf4U8N8htWdNfCC1qpeEw/j0KPnsAbjZnamtNw4NFoOYZ2i
   CUCOx/yCymZbagJWSsK0VboUVFnGnBf32SvltNRFiCEPQ0OT+w5gje5e1
   A==;
X-CSE-ConnectionGUID: h9yBXBooScq52mZpfUJG7g==
X-CSE-MsgGUID: o+Xh2fU+SLGzW9zEzlZNIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="33497774"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; 
   d="scan'208";a="33497774"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 11:00:17 -0700
X-CSE-ConnectionGUID: /o9bqy52SrCP0iaTXAPbZw==
X-CSE-MsgGUID: f3yTV5p9SoyxuLzpZD/jig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; 
   d="scan'208";a="47182855"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Jun 2024 11:00:15 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKiYW-0008pk-2c;
	Fri, 21 Jun 2024 18:00:12 +0000
Date: Sat, 22 Jun 2024 01:59:46 +0800
From: kernel test robot <lkp@intel.com>
To: Chuanhua Han <hanchuanhua@oppo.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Barry Song <v-songbaohua@oppo.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	"Huang, Ying" <ying.huang@intel.com>
Subject: [linux-next:master 6448/7397] mm/swapfile.c:1388:6: error:
 redefinition of 'swap_free_nr'
Message-ID: <202406220112.qjyQbasK-lkp@intel.com>
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
commit: b858a8a49e72678a7e0ac90b8135d746b31d7586 [6448/7397] mm: swap: introduce swap_free_nr() for batched swap_free()
config: x86_64-randconfig-014-20240202 (https://download.01.org/0day-ci/archive/20240622/202406220112.qjyQbasK-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240622/202406220112.qjyQbasK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406220112.qjyQbasK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/swapfile.c:17:
   include/linux/swap.h:519:49: error: expected identifier or '(' before numeric constant
     519 | #define total_swap_pages                        0L
         |                                                 ^~
   mm/swapfile.c:67:6: note: in expansion of macro 'total_swap_pages'
      67 | long total_swap_pages;
         |      ^~~~~~~~~~~~~~~~
   mm/swapfile.c:236:10: warning: no previous prototype for 'swap_folio_sector' [-Wmissing-prototypes]
     236 | sector_t swap_folio_sector(struct folio *folio)
         |          ^~~~~~~~~~~~~~~~~
   mm/swapfile.c: In function 'set_cluster_next':
   mm/swapfile.c:797:22: error: 'SWAP_ADDRESS_SPACE_SHIFT' undeclared (first use in this function)
     797 |         if ((prev >> SWAP_ADDRESS_SPACE_SHIFT) !=
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/swapfile.c:797:22: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/vdso/const.h:5,
                    from include/linux/const.h:4,
                    from include/linux/list.h:9,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/blkdev.h:9,
                    from mm/swapfile.c:9:
   mm/swapfile.c:803:41: error: 'SWAP_ADDRESS_SPACE_PAGES' undeclared (first use in this function)
     803 |                 next = ALIGN_DOWN(next, SWAP_ADDRESS_SPACE_PAGES);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/const.h:32:44: note: in definition of macro '__ALIGN_KERNEL_MASK'
      32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
         |                                            ^
   include/linux/align.h:9:33: note: in expansion of macro '__ALIGN_KERNEL'
       9 | #define ALIGN_DOWN(x, a)        __ALIGN_KERNEL((x) - ((a) - 1), (a))
         |                                 ^~~~~~~~~~~~~~
   mm/swapfile.c:803:24: note: in expansion of macro 'ALIGN_DOWN'
     803 |                 next = ALIGN_DOWN(next, SWAP_ADDRESS_SPACE_PAGES);
         |                        ^~~~~~~~~~
   mm/swapfile.c: At top level:
   mm/swapfile.c:1071:5: warning: no previous prototype for 'get_swap_pages' [-Wmissing-prototypes]
    1071 | int get_swap_pages(int n_goal, swp_entry_t swp_entries[], int entry_order)
         |     ^~~~~~~~~~~~~~
   mm/swapfile.c:1278:26: error: redefinition of 'get_swap_device'
    1278 | struct swap_info_struct *get_swap_device(swp_entry_t entry)
         |                          ^~~~~~~~~~~~~~~
   include/linux/swap.h:509:40: note: previous definition of 'get_swap_device' with type 'struct swap_info_struct *(swp_entry_t)'
     509 | static inline struct swap_info_struct *get_swap_device(swp_entry_t entry)
         |                                        ^~~~~~~~~~~~~~~
   mm/swapfile.c:1350:6: error: redefinition of 'swap_free'
    1350 | void swap_free(swp_entry_t entry)
         |      ^~~~~~~~~
   include/linux/swap.h:559:20: note: previous definition of 'swap_free' with type 'void(swp_entry_t)'
     559 | static inline void swap_free(swp_entry_t swp)
         |                    ^~~~~~~~~
>> mm/swapfile.c:1388:6: error: redefinition of 'swap_free_nr'
    1388 | void swap_free_nr(swp_entry_t entry, int nr_pages)
         |      ^~~~~~~~~~~~
   include/linux/swap.h:563:20: note: previous definition of 'swap_free_nr' with type 'void(swp_entry_t,  int)'
     563 | static inline void swap_free_nr(swp_entry_t entry, int nr_pages)
         |                    ^~~~~~~~~~~~
   mm/swapfile.c:1409:6: error: redefinition of 'put_swap_folio'
    1409 | void put_swap_folio(struct folio *folio, swp_entry_t entry)
         |      ^~~~~~~~~~~~~~
   include/linux/swap.h:567:20: note: previous definition of 'put_swap_folio' with type 'void(struct folio *, swp_entry_t)'
     567 | static inline void put_swap_folio(struct folio *folio, swp_entry_t swp)
         |                    ^~~~~~~~~~~~~~
   mm/swapfile.c:1461:6: warning: no previous prototype for 'swapcache_free_entries' [-Wmissing-prototypes]
    1461 | void swapcache_free_entries(swp_entry_t *entries, int n)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   mm/swapfile.c:1489:5: error: redefinition of '__swap_count'
    1489 | int __swap_count(swp_entry_t entry)
         |     ^~~~~~~~~~~~
   include/linux/swap.h:571:19: note: previous definition of '__swap_count' with type 'int(swp_entry_t)'
     571 | static inline int __swap_count(swp_entry_t entry)
         |                   ^~~~~~~~~~~~
   mm/swapfile.c:1502:5: error: redefinition of 'swap_swapcount'
    1502 | int swap_swapcount(struct swap_info_struct *si, swp_entry_t entry)
         |     ^~~~~~~~~~~~~~
   include/linux/swap.h:576:19: note: previous definition of 'swap_swapcount' with type 'int(struct swap_info_struct *, swp_entry_t)'
     576 | static inline int swap_swapcount(struct swap_info_struct *si, swp_entry_t entry)
         |                   ^~~~~~~~~~~~~~
   mm/swapfile.c:1518:5: error: redefinition of 'swp_swapcount'
    1518 | int swp_swapcount(swp_entry_t entry)
         |     ^~~~~~~~~~~~~
   include/linux/swap.h:581:19: note: previous definition of 'swp_swapcount' with type 'int(swp_entry_t)'
     581 | static inline int swp_swapcount(swp_entry_t entry)
         |                   ^~~~~~~~~~~~~
   mm/swapfile.c:1611:6: error: redefinition of 'folio_free_swap'
    1611 | bool folio_free_swap(struct folio *folio)
         |      ^~~~~~~~~~~~~~~
   include/linux/swap.h:593:20: note: previous definition of 'folio_free_swap' with type 'bool(struct folio *)' {aka '_Bool(struct folio *)'}
     593 | static inline bool folio_free_swap(struct folio *folio)
         |                    ^~~~~~~~~~~~~~~
   mm/swapfile.c:1655:6: error: redefinition of 'free_swap_and_cache_nr'
    1655 | void free_swap_and_cache_nr(swp_entry_t entry, int nr)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/swap.h:532:20: note: previous definition of 'free_swap_and_cache_nr' with type 'void(swp_entry_t,  int)'
     532 | static inline void free_swap_and_cache_nr(swp_entry_t entry, int nr)
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   mm/swapfile.c:2303:1: error: redefinition of 'add_swap_extent'
    2303 | add_swap_extent(struct swap_info_struct *sis, unsigned long start_page,
         | ^~~~~~~~~~~~~~~
   include/linux/swap.h:598:19: note: previous definition of 'add_swap_extent' with type 'int(struct swap_info_struct *, long unsigned int,  long unsigned int,  sector_t)' {aka 'int(struct swap_info_struct *, long unsigned int,  long unsigned int,  long long unsigned int)'}
     598 | static inline int add_swap_extent(struct swap_info_struct *sis,
         |                   ^~~~~~~~~~~~~~~
   mm/swapfile.c: In function 'setup_swap_extents':
   mm/swapfile.c:2389:21: error: implicit declaration of function 'sio_pool_init'; did you mean 'mempool_init'? [-Werror=implicit-function-declaration]
    2389 |                     sio_pool_init() != 0) {
         |                     ^~~~~~~~~~~~~
         |                     mempool_init
   mm/swapfile.c:2396:16: error: implicit declaration of function 'generic_swapfile_activate' [-Werror=implicit-function-declaration]
    2396 |         return generic_swapfile_activate(sis, swap_file, span);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/swapfile.c: In function '_enable_swap_info':
   mm/swapfile.c:2444:26: error: lvalue required as left operand of assignment
    2444 |         total_swap_pages += p->pages;
         |                          ^~
   mm/swapfile.c: At top level:
   mm/swapfile.c:2499:6: warning: no previous prototype for 'has_usable_swap' [-Wmissing-prototypes]
    2499 | bool has_usable_swap(void)
         |      ^~~~~~~~~~~~~~~
   mm/swapfile.c: In function '__do_sys_swapoff':
   mm/swapfile.c:2574:26: error: lvalue required as left operand of assignment
    2574 |         total_swap_pages -= p->pages;
         |                          ^~
   mm/swapfile.c:2650:9: error: implicit declaration of function 'exit_swap_address_space'; did you mean 'swap_address_space'? [-Werror=implicit-function-declaration]
    2650 |         exit_swap_address_space(p->type);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         swap_address_space
   In file included from include/linux/export.h:5,
                    from include/linux/linkage.h:7,
                    from include/linux/fs.h:5:
   mm/swapfile.c: In function 'setup_swap_map_and_extents':
   mm/swapfile.c:2995:22: error: 'SWAP_ADDRESS_SPACE_PAGES' undeclared (first use in this function)
    2995 |         DIV_ROUND_UP(SWAP_ADDRESS_SPACE_PAGES, SWAPFILE_CLUSTER)
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:284:55: note: in definition of macro '__is_constexpr'
     284 |         (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
         |                                                       ^
   include/linux/minmax.h:169:33: note: in expansion of macro '__careful_cmp'
     169 | #define max_t(type, x, y)       __careful_cmp(max, (type)(x), (type)(y))
         |                                 ^~~~~~~~~~~~~
   mm/swapfile.c:2997:9: note: in expansion of macro 'max_t'
    2997 |         max_t(unsigned int, SWAP_CLUSTER_INFO_COLS, SWAP_CLUSTER_SPACE_COLS)
         |         ^~~~~
   include/linux/math.h:37:22: note: in expansion of macro '__KERNEL_DIV_ROUND_UP'
      37 | #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
         |                      ^~~~~~~~~~~~~~~~~~~~~
   mm/swapfile.c:2997:53: note: in expansion of macro 'SWAP_CLUSTER_SPACE_COLS'
    2997 |         max_t(unsigned int, SWAP_CLUSTER_INFO_COLS, SWAP_CLUSTER_SPACE_COLS)
         |                                                     ^~~~~~~~~~~~~~~~~~~~~~~
   mm/swapfile.c:3010:66: note: in expansion of macro 'SWAP_CLUSTER_COLS'
    3010 |         unsigned long col = p->cluster_next / SWAPFILE_CLUSTER % SWAP_CLUSTER_COLS;
         |                                                                  ^~~~~~~~~~~~~~~~~
   In file included from include/linux/container_of.h:5,


vim +/swap_free_nr +1388 mm/swapfile.c

  1387	
> 1388	void swap_free_nr(swp_entry_t entry, int nr_pages)
  1389	{
  1390		int nr;
  1391		struct swap_info_struct *sis;
  1392		unsigned long offset = swp_offset(entry);
  1393	
  1394		sis = _swap_info_get(entry);
  1395		if (!sis)
  1396			return;
  1397	
  1398		while (nr_pages) {
  1399			nr = min_t(int, nr_pages, SWAPFILE_CLUSTER - offset % SWAPFILE_CLUSTER);
  1400			cluster_swap_free_nr(sis, offset, nr);
  1401			offset += nr;
  1402			nr_pages -= nr;
  1403		}
  1404	}
  1405	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

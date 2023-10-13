Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E614212B8A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 18:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EqRKqKlc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697222957; x=1728758957;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WsGNpTdH67mS/Pr9Xim4hSG9sAUBal+KCHZ1lOKGndI=;
  b=EqRKqKlc2CMu2vClrG1zMxgxfu31xNE+YJnXq1EDkIRZ6ybiWUPmAVez
   2svYY3BExwOe+jn1qBtOFxJUKS9GuNeoCUsPNGgc+d6g+Vy4+ts53nwTO
   +EZjPYIXm5j1JHPm16m6z3We3PAzIJuF7fBi/SPFuw7gQRaUFeUirzcSD
   uPr/wcRGpgFTtRO1UN9wX5cFnkO5YEWcUz2GxsbcV4Bc2cvjZ9Yv/DDqI
   l0gKiJXnW8mpoT/00p9ZLtvLWBnSg81ckYqw0FoMk9QyL87cLo9PO+U+5
   QKl2mwBmoi3zVTY1rJhpRSCQqUg89BDMJSaAOdeZ0N/TS9v+B8bGBTKum
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="365503705"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="365503705"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 11:49:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="878622463"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="878622463"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 13 Oct 2023 11:49:15 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrNDh-0005HN-3D;
	Fri, 13 Oct 2023 18:49:11 +0000
Date: Sat, 14 Oct 2023 02:48:12 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Lameter <cl@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [christoph:largepageprotect 2/3] mm/page_alloc.c:5266:47: warning:
 'enum memmap_context' declared inside parameter list will not be visible
 outside of this definition or declaration
Message-ID: <202310140249.nHhFfQcw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/christoph/linux.git largepageprotect
head:   8216937c02e2cc14d3005e5cff6c15bb72672ce7
commit: 047042554ce511a29790b43bfbba9e2e64de7277 [2/3] Add ability to reserve a number of pages per size
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231014/202310140249.nHhFfQcw-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140249.nHhFfQcw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140249.nHhFfQcw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/swap.h:11,
                    from include/linux/suspend.h:5,
                    from mm/page_alloc.c:28:
   include/linux/node.h:176:49: error: unknown type name 'node_registration_func_t'
     176 | static inline void register_hugetlbfs_with_node(node_registration_func_t reg,
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/node.h:177:49: error: unknown type name 'node_registration_func_t'
     177 |                                                 node_registration_func_t unreg)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/node.h:192:46: error: unknown type name 'node_registration_func_t'
     192 | static inline void register_vmstat_with_node(node_registration_func_t doregister,
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/node.h:193:49: error: unknown type name 'node_registration_func_t'
     193 |                                                 node_registration_func_t unregister)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c: In function 'set_page_order_min':
   mm/page_alloc.c:5082:39: error: invalid operands to binary + (have 'long int' and 'atomic_long_t' {aka 'atomic_t'})
    5082 |                         managed_pages += z->managed_pages;
         |                                       ^~ ~~~~~~~~~~~~~~~~
         |                                           |
         |                                           atomic_long_t {aka atomic_t}
   mm/page_alloc.c:5096:25: error: aggregate value used where an integer was expected
    5096 |                         tmp = (u64)z->managed_pages * (min << order);
         |                         ^~~
   mm/page_alloc.c: At top level:
>> mm/page_alloc.c:5266:47: warning: 'enum memmap_context' declared inside parameter list will not be visible outside of this definition or declaration
    5266 |                 unsigned long start_pfn, enum memmap_context context,
         |                                               ^~~~~~~~~~~~~~
   mm/page_alloc.c:5266:62: error: parameter 5 ('context') has incomplete type
    5266 |                 unsigned long start_pfn, enum memmap_context context,
         |                                          ~~~~~~~~~~~~~~~~~~~~^~~~~~~
   mm/page_alloc.c:5265:16: error: function declaration isn't a prototype [-Werror=strict-prototypes]
    5265 | void __meminit memmap_init_zone(unsigned long size, int nid, unsigned long zone,
         |                ^~~~~~~~~~~~~~~~
   mm/page_alloc.c: In function 'memmap_init_zone':
   mm/page_alloc.c:5293:32: error: 'MEMMAP_EARLY' undeclared (first use in this function); did you mean 'MEMINIT_EARLY'?
    5293 |                 if (context != MEMMAP_EARLY)
         |                                ^~~~~~~~~~~~
         |                                MEMINIT_EARLY
   mm/page_alloc.c:5293:32: note: each undeclared identifier is reported only once for each function it appears in
   mm/page_alloc.c:5296:22: error: implicit declaration of function 'early_pfn_valid'; did you mean 'early_pfn_to_nid'? [-Werror=implicit-function-declaration]
    5296 |                 if (!early_pfn_valid(pfn))
         |                      ^~~~~~~~~~~~~~~
         |                      early_pfn_to_nid
   mm/page_alloc.c:5298:22: error: implicit declaration of function 'early_pfn_in_nid'; did you mean 'early_pfn_to_nid'? [-Werror=implicit-function-declaration]
    5298 |                 if (!early_pfn_in_nid(pfn, nid))
         |                      ^~~~~~~~~~~~~~~~
         |                      early_pfn_to_nid
   mm/page_alloc.c:5300:22: error: implicit declaration of function 'update_defer_init' [-Werror=implicit-function-declaration]
    5300 |                 if (!update_defer_init(pgdat, pfn, end_pfn, &nr_initialised))
         |                      ^~~~~~~~~~~~~~~~~
   mm/page_alloc.c:5327:17: error: implicit declaration of function '__init_single_page' [-Werror=implicit-function-declaration]
    5327 |                 __init_single_page(page, pfn, zone, nid);
         |                 ^~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:5328:32: error: 'MEMMAP_HOTPLUG' undeclared (first use in this function); did you mean 'MEMINIT_HOTPLUG'?
    5328 |                 if (context == MEMMAP_HOTPLUG)
         |                                ^~~~~~~~~~~~~~
         |                                MEMINIT_HOTPLUG
   mm/page_alloc.c: At top level:
>> mm/page_alloc.c:5353:23: warning: 'zone_init_free_lists' defined but not used [-Wunused-function]
    5353 | static void __meminit zone_init_free_lists(struct zone *zone)
         |                       ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +5266 mm/page_alloc.c

  5259	
  5260	/*
  5261	 * Initially all pages are reserved - free ones are freed
  5262	 * up by free_all_bootmem() once the early boot process is
  5263	 * done. Non-atomic initialization, single-pass.
  5264	 */
  5265	void __meminit memmap_init_zone(unsigned long size, int nid, unsigned long zone,
> 5266			unsigned long start_pfn, enum memmap_context context,
  5267			struct vmem_altmap *altmap)
  5268	{
  5269		unsigned long end_pfn = start_pfn + size;
  5270		pg_data_t *pgdat = NODE_DATA(nid);
  5271		unsigned long pfn;
  5272		unsigned long nr_initialised = 0;
  5273		struct page *page;
  5274	#ifdef CONFIG_HAVE_MEMBLOCK_NODE_MAP
  5275		struct memblock_region *r = NULL, *tmp;
  5276	#endif
  5277	
  5278		if (highest_memmap_pfn < end_pfn - 1)
  5279			highest_memmap_pfn = end_pfn - 1;
  5280	
  5281		/*
  5282		 * Honor reservation requested by the driver for this ZONE_DEVICE
  5283		 * memory
  5284		 */
  5285		if (altmap && start_pfn == altmap->base_pfn)
  5286			start_pfn += altmap->reserve;
  5287	
  5288		for (pfn = start_pfn; pfn < end_pfn; pfn++) {
  5289			/*
  5290			 * There can be holes in boot-time mem_map[]s handed to this
  5291			 * function.  They do not exist on hotplugged memory.
  5292			 */
  5293			if (context != MEMMAP_EARLY)
  5294				goto not_early;
  5295	
  5296			if (!early_pfn_valid(pfn))
  5297				continue;
  5298			if (!early_pfn_in_nid(pfn, nid))
  5299				continue;
  5300			if (!update_defer_init(pgdat, pfn, end_pfn, &nr_initialised))
  5301				break;
  5302	
  5303	#ifdef CONFIG_HAVE_MEMBLOCK_NODE_MAP
  5304			/*
  5305			 * Check given memblock attribute by firmware which can affect
  5306			 * kernel memory layout.  If zone==ZONE_MOVABLE but memory is
  5307			 * mirrored, it's an overlapped memmap init. skip it.
  5308			 */
  5309			if (mirrored_kernelcore && zone == ZONE_MOVABLE) {
  5310				if (!r || pfn >= memblock_region_memory_end_pfn(r)) {
  5311					for_each_memblock(memory, tmp)
  5312						if (pfn < memblock_region_memory_end_pfn(tmp))
  5313							break;
  5314					r = tmp;
  5315				}
  5316				if (pfn >= memblock_region_memory_base_pfn(r) &&
  5317				    memblock_is_mirror(r)) {
  5318					/* already initialized as NORMAL */
  5319					pfn = memblock_region_memory_end_pfn(r);
  5320					continue;
  5321				}
  5322			}
  5323	#endif
  5324	
  5325	not_early:
  5326			page = pfn_to_page(pfn);
  5327			__init_single_page(page, pfn, zone, nid);
  5328			if (context == MEMMAP_HOTPLUG)
  5329				SetPageReserved(page);
  5330	
  5331			/*
  5332			 * Mark the block movable so that blocks are reserved for
  5333			 * movable at startup. This will force kernel allocations
  5334			 * to reserve their blocks rather than leaking throughout
  5335			 * the address space during boot when many long-lived
  5336			 * kernel allocations are made.
  5337			 *
  5338			 * bitmap is created for zone's valid pfn range. but memmap
  5339			 * can be created for invalid pages (for alignment)
  5340			 * check here not to call set_pageblock_migratetype() against
  5341			 * pfn out of zone.
  5342			 *
  5343			 * Please note that MEMMAP_HOTPLUG path doesn't clear memmap
  5344			 * because this is done early in sparse_add_one_section
  5345			 */
  5346			if (!(pfn & (pageblock_nr_pages - 1))) {
  5347				set_pageblock_migratetype(page, MIGRATE_MOVABLE);
  5348				cond_resched();
  5349			}
  5350		}
  5351	}
  5352	
> 5353	static void __meminit zone_init_free_lists(struct zone *zone)
  5354	{
  5355		unsigned int order, t;
  5356		for_each_migratetype_order(order, t) {
  5357			INIT_LIST_HEAD(&zone->free_area[order].free_list[t]);
  5358			zone->free_area[order].nr_free = 0;
  5359			zone->free_area[order].min = 0;
  5360		}
  5361	}
  5362	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

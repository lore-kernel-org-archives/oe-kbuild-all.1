Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4919F3DFE5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 21:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZTDnv3qv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697751574; x=1729287574;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qIElA0uGyCorI0oiOoGmM9aD0u+lU4Hn1GQ/fNkckwI=;
  b=ZTDnv3qvZhWIv/Y61/H1GwH25wNEV+DRvc2O3QPQMRXIzj7e27ErUb1r
   8+OwrEjoHWsrgDzLqLahxcFPoHnHaOCMaSBgvYzONQAdhgDXrtC6MhY0s
   mX9SUBmsAFKZJi2SKdepX6LLaeDQsH8YWfABLmJWVFyUmafOxYj2BU9rl
   zxxHIcWHrV4FBuSE9wYIii5WFtg9Nhf8kPjZfwBCDvlruVIVTyj7PbJjM
   P0gXnuYTShjOQLgrHqj0KOKrHaqLNR2v0GYa+8rB0XZKejFYN7F0SwH1k
   +yqK6hQKK1XJ+aYZaijFWRUUbvWTYcP4R9rensqp7A7lPZblK5OaXQpkV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="371446068"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="371446068"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 14:39:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="733725265"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="733725265"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 19 Oct 2023 14:39:31 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtajp-0002cl-1d;
	Thu, 19 Oct 2023 21:39:29 +0000
Date: Fri, 20 Oct 2023 05:38:34 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <cel@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 3/9] dma-debug: Add dma_debug_ helpers for mapping
 bio_vec arrays
Message-ID: <202310200545.ScAzFYdK-lkp@intel.com>
References: <169772915215.5232.10127407258544978465.stgit@klimt.1015granger.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169772915215.5232.10127407258544978465.stgit@klimt.1015granger.net>

Hi Chuck,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on rdma/for-next linus/master v6.6-rc6 next-20231019]
[cannot apply to joro-iommu/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chuck-Lever/dma-debug-Fix-a-typo-in-a-debugging-eye-catcher/20231020-032859
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/169772915215.5232.10127407258544978465.stgit%40klimt.1015granger.net
patch subject: [PATCH RFC 3/9] dma-debug: Add dma_debug_ helpers for mapping bio_vec arrays
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231020/202310200545.ScAzFYdK-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310200545.ScAzFYdK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310200545.ScAzFYdK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/dma/debug.c: In function 'check_bv_segment':
   kernel/dma/debug.c:1204:15: error: 'struct bio_vec' has no member named 'length'
    1204 |         if (bv->length > max_seg)
         |               ^~
   In file included from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from arch/m68k/include/asm/irqflags.h:6,
                    from include/linux/irqflags.h:17,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/sched/task_stack.h:9,
                    from kernel/dma/debug.c:10:
   kernel/dma/debug.c:1206:30: error: 'struct bio_vec' has no member named 'length'
    1206 |                            bv->length, max_seg);
         |                              ^~
   include/asm-generic/bug.h:99:62: note: in definition of macro '__WARN_printf'
      99 |                 warn_slowpath_fmt(__FILE__, __LINE__, taint, arg);      \
         |                                                              ^~~
   kernel/dma/debug.c:224:25: note: in expansion of macro 'WARN'
     224 |                         WARN(1, pr_fmt("%s %s: ") format,               \
         |                         ^~~~
   kernel/dma/debug.c:1205:17: note: in expansion of macro 'err_printk'
    1205 |                 err_printk(dev, NULL, "mapping bv entry longer than device claims to support [len=%u] [max=%u]\n",
         |                 ^~~~~~~~~~
   kernel/dma/debug.c: In function 'debug_dma_map_bvecs':
   kernel/dma/debug.c:1377:38: error: implicit declaration of function 'bv_page'; did you mean 'sg_page'? [-Werror=implicit-function-declaration]
    1377 |                 check_for_stack(dev, bv_page(bv), bv->offset);
         |                                      ^~~~~~~
         |                                      sg_page
   kernel/dma/debug.c:1377:55: error: 'struct bio_vec' has no member named 'offset'; did you mean 'bv_offset'?
    1377 |                 check_for_stack(dev, bv_page(bv), bv->offset);
         |                                                       ^~~~~~
         |                                                       bv_offset
>> kernel/dma/debug.c:1377:38: warning: passing argument 2 of 'check_for_stack' makes pointer from integer without a cast [-Wint-conversion]
    1377 |                 check_for_stack(dev, bv_page(bv), bv->offset);
         |                                      ^~~~~~~~~~~
         |                                      |
         |                                      int
   kernel/dma/debug.c:1059:42: note: expected 'struct page *' but argument is of type 'int'
    1059 |                             struct page *page, size_t offset)
         |                             ~~~~~~~~~~~~~^~~~
>> kernel/dma/debug.c:1378:34: warning: passing argument 1 of 'PageHighMem' makes pointer from integer without a cast [-Wint-conversion]
    1378 |                 if (!PageHighMem(bv_page(bv)))
         |                                  ^~~~~~~~~~~
         |                                  |
         |                                  int
   In file included from include/linux/mmzone.h:23,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from include/linux/scatterlist.h:8,
                    from kernel/dma/debug.c:11:
   include/linux/page-flags.h:437:50: note: expected 'const struct page *' but argument is of type 'int'
     437 | static inline int Page##uname(const struct page *page) { return 0; }
         |                               ~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/page-flags.h:461:38: note: in expansion of macro 'TESTPAGEFLAG_FALSE'
     461 | #define PAGEFLAG_FALSE(uname, lname) TESTPAGEFLAG_FALSE(uname, lname)   \
         |                                      ^~~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:531:1: note: in expansion of macro 'PAGEFLAG_FALSE'
     531 | PAGEFLAG_FALSE(HighMem, highmem)
         | ^~~~~~~~~~~~~~
   kernel/dma/debug.c:1379:68: error: 'struct bio_vec' has no member named 'length'
    1379 |                         check_for_illegal_area(dev, bv_virt(bv), bv->length);
         |                                                                    ^~
   In file included from arch/m68k/include/asm/page.h:66,
                    from arch/m68k/include/asm/thread_info.h:6,
                    from include/linux/thread_info.h:60:
   include/asm-generic/memory_model.h:19:57: error: invalid operands to binary - (have 'int' and 'struct page *')
      19 | #define __page_to_pfn(page)     ((unsigned long)((page) - mem_map) + \
         |                                                  ~~~~~~ ^
   include/asm-generic/memory_model.h:64:21: note: in expansion of macro '__page_to_pfn'
      64 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   kernel/dma/debug.c:1391:41: note: in expansion of macro 'page_to_pfn'
    1391 |                 entry->pfn            = page_to_pfn(bv_page(bv));
         |                                         ^~~~~~~~~~~
   kernel/dma/debug.c:1392:45: error: 'struct bio_vec' has no member named 'offset'; did you mean 'bv_offset'?
    1392 |                 entry->offset         = bv->offset;
         |                                             ^~~~~~
         |                                             bv_offset
   kernel/dma/debug.c: In function 'debug_dma_unmap_bvecs':
   kernel/dma/debug.c:1464:25: error: 'nents' undeclared (first use in this function); did you mean 'net'?
    1464 |         for (i = 0; i < nents; i++) {
         |                         ^~~~~
         |                         net
   kernel/dma/debug.c:1464:25: note: each undeclared identifier is reported only once for each function it appears in
   include/asm-generic/memory_model.h:19:57: error: invalid operands to binary - (have 'int' and 'struct page *')
      19 | #define __page_to_pfn(page)     ((unsigned long)((page) - mem_map) + \
         |                                                  ~~~~~~ ^
   include/asm-generic/memory_model.h:64:21: note: in expansion of macro '__page_to_pfn'
      64 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   kernel/dma/debug.c:1469:43: note: in expansion of macro 'page_to_pfn'
    1469 |                         .pfn            = page_to_pfn(bv_page(bv)),
         |                                           ^~~~~~~~~~~
   kernel/dma/debug.c:1470:47: error: 'struct bio_vec' has no member named 'offset'; did you mean 'bv_offset'?
    1470 |                         .offset         = bv->offset,
         |                                               ^~~~~~
         |                                               bv_offset
   kernel/dma/debug.c: In function 'debug_dma_sync_bvecs_for_cpu':
   kernel/dma/debug.c:1700:25: error: 'nents' undeclared (first use in this function); did you mean 'net'?
    1700 |         for (i = 0; i < nents; i++) {
         |                         ^~~~~
         |                         net
>> kernel/dma/debug.c:1695:25: warning: unused variable 'bv' [-Wunused-variable]
    1695 |         struct bio_vec *bv;
         |                         ^~
   kernel/dma/debug.c: In function 'debug_dma_sync_bvecs_for_device':
   kernel/dma/debug.c:1732:25: error: 'nents' undeclared (first use in this function); did you mean 'net'?
    1732 |         for (i = 0; i < nents; i++) {
         |                         ^~~~~
         |                         net
   kernel/dma/debug.c:1727:25: warning: unused variable 'bv' [-Wunused-variable]
    1727 |         struct bio_vec *bv;
         |                         ^~
   cc1: some warnings being treated as errors


vim +/check_for_stack +1377 kernel/dma/debug.c

  1363	
  1364	void debug_dma_map_bvecs(struct device *dev, struct bio_vec *bvecs,
  1365				 int nents, int mapped_ents, int direction,
  1366				 unsigned long attrs)
  1367	{
  1368		struct dma_debug_entry *entry;
  1369		struct bio_vec *bv;
  1370		int i;
  1371	
  1372		if (unlikely(dma_debug_disabled()))
  1373			return;
  1374	
  1375		for (i = 0; i < nents; i++) {
  1376			bv = &bvecs[i];
> 1377			check_for_stack(dev, bv_page(bv), bv->offset);
> 1378			if (!PageHighMem(bv_page(bv)))
  1379				check_for_illegal_area(dev, bv_virt(bv), bv->length);
  1380		}
  1381	
  1382		for (i = 0; i < nents; i++) {
  1383			bv = &bvecs[i];
  1384	
  1385			entry = dma_entry_alloc();
  1386			if (!entry)
  1387				return;
  1388	
  1389			entry->type           = dma_debug_bv;
  1390			entry->dev            = dev;
  1391			entry->pfn	      = page_to_pfn(bv_page(bv));
  1392			entry->offset	      = bv->offset;
  1393			entry->size           = bv_dma_len(bv);
  1394			entry->dev_addr       = bv_dma_address(bv);
  1395			entry->direction      = direction;
  1396			entry->sg_call_ents   = nents;
  1397			entry->sg_mapped_ents = mapped_ents;
  1398	
  1399			check_bv_segment(dev, bv);
  1400	
  1401			add_dma_entry(entry, attrs);
  1402		}
  1403	}
  1404	
  1405	static int get_nr_mapped_entries(struct device *dev,
  1406					 struct dma_debug_entry *ref)
  1407	{
  1408		struct dma_debug_entry *entry;
  1409		struct hash_bucket *bucket;
  1410		unsigned long flags;
  1411		int mapped_ents;
  1412	
  1413		bucket       = get_hash_bucket(ref, &flags);
  1414		entry        = bucket_find_exact(bucket, ref);
  1415		mapped_ents  = 0;
  1416	
  1417		if (entry)
  1418			mapped_ents = entry->sg_mapped_ents;
  1419		put_hash_bucket(bucket, flags);
  1420	
  1421		return mapped_ents;
  1422	}
  1423	
  1424	void debug_dma_unmap_sg(struct device *dev, struct scatterlist *sglist,
  1425				int nelems, int dir)
  1426	{
  1427		struct scatterlist *s;
  1428		int mapped_ents = 0, i;
  1429	
  1430		if (unlikely(dma_debug_disabled()))
  1431			return;
  1432	
  1433		for_each_sg(sglist, s, nelems, i) {
  1434	
  1435			struct dma_debug_entry ref = {
  1436				.type           = dma_debug_sg,
  1437				.dev            = dev,
  1438				.pfn		= page_to_pfn(sg_page(s)),
  1439				.offset		= s->offset,
  1440				.dev_addr       = sg_dma_address(s),
  1441				.size           = sg_dma_len(s),
  1442				.direction      = dir,
  1443				.sg_call_ents   = nelems,
  1444			};
  1445	
  1446			if (mapped_ents && i >= mapped_ents)
  1447				break;
  1448	
  1449			if (!i)
  1450				mapped_ents = get_nr_mapped_entries(dev, &ref);
  1451	
  1452			check_unmap(&ref);
  1453		}
  1454	}
  1455	
  1456	void debug_dma_unmap_bvecs(struct device *dev, struct bio_vec *bvecs,
  1457				   int nelems, int dir)
  1458	{
  1459		int mapped_ents = 0, i;
  1460	
  1461		if (unlikely(dma_debug_disabled()))
  1462			return;
  1463	
  1464		for (i = 0; i < nents; i++) {
  1465			struct bio_vec *bv = &bvecs[i];
  1466			struct dma_debug_entry ref = {
  1467				.type           = dma_debug_bv,
  1468				.dev            = dev,
  1469				.pfn		= page_to_pfn(bv_page(bv)),
> 1470				.offset		= bv->offset,
  1471				.dev_addr       = bv_dma_address(bv),
  1472				.size           = bv_dma_len(bv),
  1473				.direction      = dir,
  1474				.sg_call_ents   = nelems,
  1475			};
  1476	
  1477			if (mapped_ents && i >= mapped_ents)
  1478				break;
  1479	
  1480			if (!i)
  1481				mapped_ents = get_nr_mapped_entries(dev, &ref);
  1482	
  1483			check_unmap(&ref);
  1484		}
  1485	}
  1486	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

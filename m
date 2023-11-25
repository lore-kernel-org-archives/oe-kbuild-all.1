Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE079460
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Nov 2023 09:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JpqN0p7b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700903483; x=1732439483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DGfDJ02Ox5wL4euJWKuZa5L2Clxu2bvup54WShmD53Q=;
  b=JpqN0p7b/turL2kCFIiYP2pcA4kydLyOWStqieEx5TybCwHO8f6cG7nW
   hW/1mD7urGMKteyvxtYngaeycbNTEUwA7AphTnDnCd/uvhN/LC/3NBdZC
   526aNuOuIdtAMlm1J9alL5UzilrjKexrtNS2QtmqOnphoxUa5YuwXHkzP
   1nT7FiF6mHhj+nIubR8sqg+xNTATBIG7bVJ9w7cTr3yL8n9wlXCbH8G5m
   ND+nVaWlYtuJ90yxASGcgqXe+DvY1mkz2Rhn0DIt4M3TgPJR7K72QOIN9
   vso/W/aiBX8sM3R/NF93F09G8xuKMbIcjsCFZCdzrZo7Q1A7ZZEI4leSL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="5659799"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="5659799"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 01:11:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="717565996"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="717565996"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 25 Nov 2023 01:11:21 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6oh5-0003pJ-0l;
	Sat, 25 Nov 2023 09:11:19 +0000
Date: Sat, 25 Nov 2023 17:10:30 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 22/65] mm/readahead.c:207: warning: expecting
 prototype for page_cache_ra_unbounded(). Prototype was for
 __page_cache_ra_unbounded() instead
Message-ID: <202311251734.W7hOCgfW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   f5b3c0ffa575a5035e6d607b616c05638ed48937
commit: f6d545fc00300ddfd3e297d17e4f229ad2f15c3e [22/65] readahead: add an unlocked version of __page_cache_ra_unbounded
config: arc-randconfig-002-20231125 (https://download.01.org/0day-ci/archive/20231125/202311251734.W7hOCgfW-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311251734.W7hOCgfW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311251734.W7hOCgfW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/readahead.c:207: warning: expecting prototype for page_cache_ra_unbounded(). Prototype was for __page_cache_ra_unbounded() instead


vim +207 mm/readahead.c

^1da177e4c3f41 Linus Torvalds          2005-04-16  190  
2c684234d36f7e Matthew Wilcox (Oracle  2020-06-01  191) /**
73bb49da50cd46 Matthew Wilcox (Oracle  2020-10-15  192)  * page_cache_ra_unbounded - Start unchecked readahead.
73bb49da50cd46 Matthew Wilcox (Oracle  2020-10-15  193)  * @ractl: Readahead control.
2c684234d36f7e Matthew Wilcox (Oracle  2020-06-01  194)  * @nr_to_read: The number of pages to read.
2c684234d36f7e Matthew Wilcox (Oracle  2020-06-01  195)  * @lookahead_size: Where to start the next readahead.
2c684234d36f7e Matthew Wilcox (Oracle  2020-06-01  196)  *
2c684234d36f7e Matthew Wilcox (Oracle  2020-06-01  197)  * This function is for filesystems to call when they want to start
2c684234d36f7e Matthew Wilcox (Oracle  2020-06-01  198)  * readahead beyond a file's stated i_size.  This is almost certainly
2c684234d36f7e Matthew Wilcox (Oracle  2020-06-01  199)  * not the function you want to call.  Use page_cache_async_readahead()
2c684234d36f7e Matthew Wilcox (Oracle  2020-06-01  200)  * or page_cache_sync_readahead() instead.
2c684234d36f7e Matthew Wilcox (Oracle  2020-06-01  201)  *
2c684234d36f7e Matthew Wilcox (Oracle  2020-06-01  202)  * Context: File is referenced by caller.  Mutexes may be held by caller.
2c684234d36f7e Matthew Wilcox (Oracle  2020-06-01  203)  * May sleep, but will not reenter filesystem to reclaim memory.
^1da177e4c3f41 Linus Torvalds          2005-04-16  204   */
f6d545fc00300d Christoph Hellwig       2023-11-24  205  void __page_cache_ra_unbounded(struct readahead_control *ractl,
73bb49da50cd46 Matthew Wilcox (Oracle  2020-10-15  206) 		unsigned long nr_to_read, unsigned long lookahead_size)
^1da177e4c3f41 Linus Torvalds          2005-04-16 @207  {
73bb49da50cd46 Matthew Wilcox (Oracle  2020-10-15  208) 	struct address_space *mapping = ractl->mapping;
73bb49da50cd46 Matthew Wilcox (Oracle  2020-10-15  209) 	unsigned long index = readahead_index(ractl);
8a5c743e308dd2 Michal Hocko            2016-07-26  210  	gfp_t gfp_mask = readahead_gfp_mask(mapping);
c2c7ad74b16206 Matthew Wilcox (Oracle  2020-06-01  211) 	unsigned long i;
^1da177e4c3f41 Linus Torvalds          2005-04-16  212  
f2c817bed58d9b Matthew Wilcox (Oracle  2020-06-01  213) 	/*
f2c817bed58d9b Matthew Wilcox (Oracle  2020-06-01  214) 	 * Partway through the readahead operation, we will have added
f2c817bed58d9b Matthew Wilcox (Oracle  2020-06-01  215) 	 * locked pages to the page cache, but will not yet have submitted
f2c817bed58d9b Matthew Wilcox (Oracle  2020-06-01  216) 	 * them for I/O.  Adding another page may need to allocate memory,
f2c817bed58d9b Matthew Wilcox (Oracle  2020-06-01  217) 	 * which can trigger memory reclaim.  Telling the VM we're in
f2c817bed58d9b Matthew Wilcox (Oracle  2020-06-01  218) 	 * the middle of a filesystem operation will cause it to not
f2c817bed58d9b Matthew Wilcox (Oracle  2020-06-01  219) 	 * touch file-backed pages, preventing a deadlock.  Most (all?)
f2c817bed58d9b Matthew Wilcox (Oracle  2020-06-01  220) 	 * filesystems already specify __GFP_NOFS in their mapping's
f2c817bed58d9b Matthew Wilcox (Oracle  2020-06-01  221) 	 * gfp_mask, but let's be explicit here.
f2c817bed58d9b Matthew Wilcox (Oracle  2020-06-01  222) 	 */
f2c817bed58d9b Matthew Wilcox (Oracle  2020-06-01  223) 	unsigned int nofs = memalloc_nofs_save();
f2c817bed58d9b Matthew Wilcox (Oracle  2020-06-01  224) 
f6d545fc00300d Christoph Hellwig       2023-11-24  225  	lockdep_assert_held(&mapping->invalidate_lock);
f6d545fc00300d Christoph Hellwig       2023-11-24  226  
^1da177e4c3f41 Linus Torvalds          2005-04-16  227  	/*
^1da177e4c3f41 Linus Torvalds          2005-04-16  228  	 * Preallocate as many pages as we will need.
^1da177e4c3f41 Linus Torvalds          2005-04-16  229  	 */
c2c7ad74b16206 Matthew Wilcox (Oracle  2020-06-01  230) 	for (i = 0; i < nr_to_read; i++) {
0387df1d1fa7d6 Matthew Wilcox (Oracle  2021-03-10  231) 		struct folio *folio = xa_load(&mapping->i_pages, index + i);
^1da177e4c3f41 Linus Torvalds          2005-04-16  232  
0387df1d1fa7d6 Matthew Wilcox (Oracle  2021-03-10  233) 		if (folio && !xa_is_value(folio)) {
b3751e6ab45a3b Christoph Hellwig       2018-06-01  234  			/*
2d8163e4899dad Matthew Wilcox (Oracle  2020-06-01  235) 			 * Page already present?  Kick off the current batch
2d8163e4899dad Matthew Wilcox (Oracle  2020-06-01  236) 			 * of contiguous pages before continuing with the
2d8163e4899dad Matthew Wilcox (Oracle  2020-06-01  237) 			 * next batch.  This page may be the one we would
2d8163e4899dad Matthew Wilcox (Oracle  2020-06-01  238) 			 * have intended to mark as Readahead, but we don't
2d8163e4899dad Matthew Wilcox (Oracle  2020-06-01  239) 			 * have a stable reference to this page, and it's
2d8163e4899dad Matthew Wilcox (Oracle  2020-06-01  240) 			 * not worth getting one just for that.
b3751e6ab45a3b Christoph Hellwig       2018-06-01  241  			 */
b4e089d705eef8 Christoph Hellwig       2022-03-31  242  			read_pages(ractl);
b4e089d705eef8 Christoph Hellwig       2022-03-31  243  			ractl->_index++;
f615bd5c4725fd Matthew Wilcox (Oracle  2021-04-21  244) 			i = ractl->_index + ractl->_nr_pages - index - 1;
^1da177e4c3f41 Linus Torvalds          2005-04-16  245  			continue;
b3751e6ab45a3b Christoph Hellwig       2018-06-01  246  		}
^1da177e4c3f41 Linus Torvalds          2005-04-16  247  
0387df1d1fa7d6 Matthew Wilcox (Oracle  2021-03-10  248) 		folio = filemap_alloc_folio(gfp_mask, 0);
0387df1d1fa7d6 Matthew Wilcox (Oracle  2021-03-10  249) 		if (!folio)
^1da177e4c3f41 Linus Torvalds          2005-04-16  250  			break;
704528d895dd3e Matthew Wilcox (Oracle  2022-03-23  251) 		if (filemap_add_folio(mapping, folio, index + i,
c1f6925e10912c Matthew Wilcox (Oracle  2020-06-01  252) 					gfp_mask) < 0) {
0387df1d1fa7d6 Matthew Wilcox (Oracle  2021-03-10  253) 			folio_put(folio);
b4e089d705eef8 Christoph Hellwig       2022-03-31  254  			read_pages(ractl);
b4e089d705eef8 Christoph Hellwig       2022-03-31  255  			ractl->_index++;
f615bd5c4725fd Matthew Wilcox (Oracle  2021-04-21  256) 			i = ractl->_index + ractl->_nr_pages - index - 1;
c1f6925e10912c Matthew Wilcox (Oracle  2020-06-01  257) 			continue;
c1f6925e10912c Matthew Wilcox (Oracle  2020-06-01  258) 		}
c2c7ad74b16206 Matthew Wilcox (Oracle  2020-06-01  259) 		if (i == nr_to_read - lookahead_size)
0387df1d1fa7d6 Matthew Wilcox (Oracle  2021-03-10  260) 			folio_set_readahead(folio);
176042404ee6a9 Christoph Hellwig       2022-09-15  261  		ractl->_workingset |= folio_test_workingset(folio);
73bb49da50cd46 Matthew Wilcox (Oracle  2020-10-15  262) 		ractl->_nr_pages++;
^1da177e4c3f41 Linus Torvalds          2005-04-16  263  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  264  
^1da177e4c3f41 Linus Torvalds          2005-04-16  265  	/*
7e0a126519b826 Matthew Wilcox (Oracle  2022-04-29  266) 	 * Now start the IO.  We ignore I/O errors - if the folio is not
7e0a126519b826 Matthew Wilcox (Oracle  2022-04-29  267) 	 * uptodate then the caller will launch read_folio again, and
^1da177e4c3f41 Linus Torvalds          2005-04-16  268  	 * will then handle the error.
^1da177e4c3f41 Linus Torvalds          2005-04-16  269  	 */
b4e089d705eef8 Christoph Hellwig       2022-03-31  270  	read_pages(ractl);
f2c817bed58d9b Matthew Wilcox (Oracle  2020-06-01  271) 	memalloc_nofs_restore(nofs);
^1da177e4c3f41 Linus Torvalds          2005-04-16  272  }
f6d545fc00300d Christoph Hellwig       2023-11-24  273  

:::::: The code at line 207 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

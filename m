Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F1133A9D1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 21:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786568500; cv=none; b=OKdWwVRsW6wjB8w/llo6D4cjiXHH6JRI4SAPeDZVAvPQPfRHJoeq697RDV2WOdPRMC9ldRPt87tsAqaT4kaZ5S/FaX3bHQpVGMtWzH/4XUbp9aiixsxJvbVKIPtLf06tOIHDpZ1BpVLrYR1nm/XXrK+sTgQO0YnQM0GSNXmMXD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786568500; c=relaxed/simple;
	bh=XLbizcfpxhEHlmmTmewnA/L8gSXZUYuHA9KSYI52d7o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uN8kzS2x/ncA/8dgptnBAqwM/U+HEeW4LJGUexMWX/dD2Qfd1LiJ/AKkINnqdzk2XopxWPuy+B8mcS3kegH0aFHsgP/euUjKosrXp1N+LFkx4lSW55vAB1hLcH8+vkYyibVrNjhy+BldcSh6oVofWU2o3o1Rt/qfZagfPnHpNB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZB9/PWrC; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZB9/PWrC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786568499; x=1818104499;
  h=date:from:to:cc:subject:message-id;
  bh=XLbizcfpxhEHlmmTmewnA/L8gSXZUYuHA9KSYI52d7o=;
  b=ZB9/PWrCrYgUN3KTqITfiBM2hDOO/Vdf9M82hgatWP506/ArsCBpFpgp
   BR9n4DEGCVFIRFYaXkBcyRfH/+MHnXHZknybXcQLVJPS4DkMP4OUHcUY+
   Q+6mCHxlB+3ETJfh3QJUJsEKsgdfC4zwS2yjbi3SS6RcA6pbM4CbY+3kN
   l4p+3XuC/l7eRODW9DAfkaBJNVWQG2Z+Qbqpz4vz6DxkSC5i7g3olO3rR
   nMYGeaVrbzhNsHu+wKoTn+a34Kpt7jhuCsk1aWieeBLSAOkTVqp3flLcS
   fcLQuzBKif/h4KUN3YN1WhmBl05XLBJ0P12QYG6V0qqXtFTrcvD2xvwP1
   Q==;
X-CSE-ConnectionGUID: Zc63mBYaRHWpcrkdP96F2Q==
X-CSE-MsgGUID: W3Q8hKgDRBufgslnVfLd8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86098017"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="86098017"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 14:01:36 -0700
X-CSE-ConnectionGUID: e53D7lmRRKixuGwZz0RddA==
X-CSE-MsgGUID: 6z1iu7THTDu4800g6sGdvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="287200714"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Aug 2026 14:01:34 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuG4q-00000000RhS-0iKC;
	Wed, 12 Aug 2026 21:01:32 +0000
Date: Thu, 13 Aug 2026 05:00:36 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:headers 5/7] fs/aio.c:532:17: error: use of
 undeclared identifier 'noop_dirty_folio'
Message-ID: <202608130435.bbi2lW29-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/willy/pagecache headers
head:   5a75fff46226e59e4c4d87c36f7de79ec4cabdb4
commit: ad78a547dcd8964e9c6ec0e89183d6cd228d2ad6 [5/7] mm: Remove pagemap.h from mempolicy.h
config: um-x86_64_defconfig (https://download.01.org/0day-ci/archive/20260813/202608130435.bbi2lW29-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6ea395e4fe4db26920d57779ddae98eac6ba945d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608130435.bbi2lW29-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608130435.bbi2lW29-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/aio.c:532:17: error: use of undeclared identifier 'noop_dirty_folio'
     532 |         .dirty_folio    = noop_dirty_folio,
         |                           ^~~~~~~~~~~~~~~~
>> fs/aio.c:577:11: error: call to undeclared function '__filemap_get_folio'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     577 |                 folio = __filemap_get_folio(file->f_mapping, i,
         |                         ^
   fs/aio.c:577:11: note: did you mean 'filemap_dirty_folio'?
   include/linux/writeback.h:366:6: note: 'filemap_dirty_folio' declared here
     366 | bool filemap_dirty_folio(struct address_space *mapping, struct folio *folio);
         |      ^
>> fs/aio.c:578:10: error: use of undeclared identifier 'FGP_LOCK'
     578 |                                             FGP_LOCK | FGP_ACCESSED | FGP_CREAT,
         |                                             ^~~~~~~~
>> fs/aio.c:578:21: error: use of undeclared identifier 'FGP_ACCESSED'
     578 |                                             FGP_LOCK | FGP_ACCESSED | FGP_CREAT,
         |                                                        ^~~~~~~~~~~~
>> fs/aio.c:578:36: error: use of undeclared identifier 'FGP_CREAT'
     578 |                                             FGP_LOCK | FGP_ACCESSED | FGP_CREAT,
         |                                                                       ^~~~~~~~~
>> fs/aio.c:585:3: error: call to undeclared function 'folio_end_read'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     585 |                 folio_end_read(folio, true);
         |                 ^
   fs/aio.c:585:3: note: did you mean 'folio_test_head'?
   include/linux/page-flags.h:841:29: note: 'folio_test_head' declared here
     841 | static __always_inline bool folio_test_head(const struct folio *folio)
         |                             ^
   6 errors generated.


vim +/noop_dirty_folio +532 fs/aio.c

^1da177e4c3f415 Linus Torvalds             2005-04-16  530  
36bc08cc01709b4 Gu Zheng                   2013-07-16  531  static const struct address_space_operations aio_ctx_aops = {
46de8b979492e13 Matthew Wilcox (Oracle     2022-02-09 @532) 	.dirty_folio	= noop_dirty_folio,
3648951ceb0ad20 Matthew Wilcox (Oracle     2022-06-06  533) 	.migrate_folio	= aio_migrate_folio,
36bc08cc01709b4 Gu Zheng                   2013-07-16  534  };
36bc08cc01709b4 Gu Zheng                   2013-07-16  535  
2a8a98673c13cb2 Mauricio Faria de Oliveira 2017-07-05  536  static int aio_setup_ring(struct kioctx *ctx, unsigned int nr_events)
^1da177e4c3f415 Linus Torvalds             2005-04-16  537  {
^1da177e4c3f415 Linus Torvalds             2005-04-16  538  	struct aio_ring *ring;
41003a7bcfed125 Zach Brown                 2013-05-07  539  	struct mm_struct *mm = current->mm;
3dc9acb67600393 Linus Torvalds             2013-12-20  540  	unsigned long size, unused;
^1da177e4c3f415 Linus Torvalds             2005-04-16  541  	int nr_pages;
36bc08cc01709b4 Gu Zheng                   2013-07-16  542  	int i;
36bc08cc01709b4 Gu Zheng                   2013-07-16  543  	struct file *file;
^1da177e4c3f415 Linus Torvalds             2005-04-16  544  
^1da177e4c3f415 Linus Torvalds             2005-04-16  545  	/* Compensate for the ring buffer's head/tail overlap entry */
^1da177e4c3f415 Linus Torvalds             2005-04-16  546  	nr_events += 2;	/* 1 is required, 2 for good luck */
^1da177e4c3f415 Linus Torvalds             2005-04-16  547  
^1da177e4c3f415 Linus Torvalds             2005-04-16  548  	size = sizeof(struct aio_ring);
^1da177e4c3f415 Linus Torvalds             2005-04-16  549  	size += sizeof(struct io_event) * nr_events;
^1da177e4c3f415 Linus Torvalds             2005-04-16  550  
36bc08cc01709b4 Gu Zheng                   2013-07-16  551  	nr_pages = PFN_UP(size);
^1da177e4c3f415 Linus Torvalds             2005-04-16  552  	if (nr_pages < 0)
^1da177e4c3f415 Linus Torvalds             2005-04-16  553  		return -EINVAL;
^1da177e4c3f415 Linus Torvalds             2005-04-16  554  
71ad7490c1f32bd Benjamin LaHaise           2013-09-17  555  	file = aio_private_file(ctx, nr_pages);
36bc08cc01709b4 Gu Zheng                   2013-07-16  556  	if (IS_ERR(file)) {
36bc08cc01709b4 Gu Zheng                   2013-07-16  557  		ctx->aio_ring_file = NULL;
fa8a53c39f3fdde Benjamin LaHaise           2014-03-28  558  		return -ENOMEM;
36bc08cc01709b4 Gu Zheng                   2013-07-16  559  	}
36bc08cc01709b4 Gu Zheng                   2013-07-16  560  
3dc9acb67600393 Linus Torvalds             2013-12-20  561  	ctx->aio_ring_file = file;
3dc9acb67600393 Linus Torvalds             2013-12-20  562  	nr_events = (PAGE_SIZE * nr_pages - sizeof(struct aio_ring))
3dc9acb67600393 Linus Torvalds             2013-12-20  563  			/ sizeof(struct io_event);
3dc9acb67600393 Linus Torvalds             2013-12-20  564  
16594e60cd8e6d4 Kefeng Wang                2024-03-21  565  	ctx->ring_folios = ctx->internal_folios;
3dc9acb67600393 Linus Torvalds             2013-12-20  566  	if (nr_pages > AIO_RING_PAGES) {
32a92f8c8932698 Linus Torvalds             2026-02-21  567  		ctx->ring_folios = kzalloc_objs(struct folio *, nr_pages);
16594e60cd8e6d4 Kefeng Wang                2024-03-21  568  		if (!ctx->ring_folios) {
3dc9acb67600393 Linus Torvalds             2013-12-20  569  			put_aio_ring_file(ctx);
3dc9acb67600393 Linus Torvalds             2013-12-20  570  			return -ENOMEM;
3dc9acb67600393 Linus Torvalds             2013-12-20  571  		}
3dc9acb67600393 Linus Torvalds             2013-12-20  572  	}
3dc9acb67600393 Linus Torvalds             2013-12-20  573  
36bc08cc01709b4 Gu Zheng                   2013-07-16  574  	for (i = 0; i < nr_pages; i++) {
75a07b557a11a71 Kefeng Wang                2024-03-21  575  		struct folio *folio;
75a07b557a11a71 Kefeng Wang                2024-03-21  576  
75a07b557a11a71 Kefeng Wang                2024-03-21 @577  		folio = __filemap_get_folio(file->f_mapping, i,
75a07b557a11a71 Kefeng Wang                2024-03-21 @578  					    FGP_LOCK | FGP_ACCESSED | FGP_CREAT,
75a07b557a11a71 Kefeng Wang                2024-03-21  579  					    GFP_USER | __GFP_ZERO);
75a07b557a11a71 Kefeng Wang                2024-03-21  580  		if (IS_ERR(folio))
36bc08cc01709b4 Gu Zheng                   2013-07-16  581  			break;
^1da177e4c3f415 Linus Torvalds             2005-04-16  582  
75a07b557a11a71 Kefeng Wang                2024-03-21  583  		pr_debug("pid(%d) [%d] folio->count=%d\n", current->pid, i,
75a07b557a11a71 Kefeng Wang                2024-03-21  584  			 folio_ref_count(folio));
75a07b557a11a71 Kefeng Wang                2024-03-21 @585  		folio_end_read(folio, true);
75a07b557a11a71 Kefeng Wang                2024-03-21  586  
16594e60cd8e6d4 Kefeng Wang                2024-03-21  587  		ctx->ring_folios[i] = folio;
^1da177e4c3f415 Linus Torvalds             2005-04-16  588  	}
3dc9acb67600393 Linus Torvalds             2013-12-20  589  	ctx->nr_pages = i;
3dc9acb67600393 Linus Torvalds             2013-12-20  590  
3dc9acb67600393 Linus Torvalds             2013-12-20  591  	if (unlikely(i != nr_pages)) {
3dc9acb67600393 Linus Torvalds             2013-12-20  592  		aio_free_ring(ctx);
fa8a53c39f3fdde Benjamin LaHaise           2014-03-28  593  		return -ENOMEM;
d1b9432712a25ee Gu Zheng                   2013-12-04  594  	}
^1da177e4c3f415 Linus Torvalds             2005-04-16  595  
58c85dc20a2c5ba Kent Overstreet            2013-05-07  596  	ctx->mmap_size = nr_pages * PAGE_SIZE;
58c85dc20a2c5ba Kent Overstreet            2013-05-07  597  	pr_debug("attempting mmap of %lu bytes\n", ctx->mmap_size);
36bc08cc01709b4 Gu Zheng                   2013-07-16  598  
d8ed45c5dcd455f Michel Lespinasse          2020-06-08  599  	if (mmap_write_lock_killable(mm)) {
013373e8b867350 Michal Hocko               2016-05-23  600  		ctx->mmap_size = 0;
013373e8b867350 Michal Hocko               2016-05-23  601  		aio_free_ring(ctx);
013373e8b867350 Michal Hocko               2016-05-23  602  		return -EINTR;
013373e8b867350 Michal Hocko               2016-05-23  603  	}
013373e8b867350 Michal Hocko               2016-05-23  604  
45e55300f11495e Peter Collingbourne        2020-08-06  605  	ctx->mmap_base = do_mmap(ctx->aio_ring_file, 0, ctx->mmap_size,
e3fc629d7bb7084 Al Viro                    2012-05-30  606  				 PROT_READ | PROT_WRITE,
1944a0183c83265 Lorenzo Stoakes            2026-07-11  607  				 MAP_SHARED, EMPTY_VMA_FLAGS, 0, &unused, NULL);
d8ed45c5dcd455f Michel Lespinasse          2020-06-08  608  	mmap_write_unlock(mm);
3dc9acb67600393 Linus Torvalds             2013-12-20  609  	if (IS_ERR((void *)ctx->mmap_base)) {
58c85dc20a2c5ba Kent Overstreet            2013-05-07  610  		ctx->mmap_size = 0;
^1da177e4c3f415 Linus Torvalds             2005-04-16  611  		aio_free_ring(ctx);
fa8a53c39f3fdde Benjamin LaHaise           2014-03-28  612  		return -ENOMEM;
^1da177e4c3f415 Linus Torvalds             2005-04-16  613  	}
^1da177e4c3f415 Linus Torvalds             2005-04-16  614  
58c85dc20a2c5ba Kent Overstreet            2013-05-07  615  	pr_debug("mmap address: 0x%08lx\n", ctx->mmap_base);
d6c355c7dabcd75 Benjamin LaHaise           2013-09-09  616  
58c85dc20a2c5ba Kent Overstreet            2013-05-07  617  	ctx->user_id = ctx->mmap_base;
58c85dc20a2c5ba Kent Overstreet            2013-05-07  618  	ctx->nr_events = nr_events; /* trusted copy */
^1da177e4c3f415 Linus Torvalds             2005-04-16  619  
16594e60cd8e6d4 Kefeng Wang                2024-03-21  620  	ring = folio_address(ctx->ring_folios[0]);
^1da177e4c3f415 Linus Torvalds             2005-04-16  621  	ring->nr = nr_events;	/* user copy */
db446a08c23d547 Benjamin LaHaise           2013-07-30  622  	ring->id = ~0U;
^1da177e4c3f415 Linus Torvalds             2005-04-16  623  	ring->head = ring->tail = 0;
^1da177e4c3f415 Linus Torvalds             2005-04-16  624  	ring->magic = AIO_RING_MAGIC;
^1da177e4c3f415 Linus Torvalds             2005-04-16  625  	ring->compat_features = AIO_RING_COMPAT_FEATURES;
^1da177e4c3f415 Linus Torvalds             2005-04-16  626  	ring->incompat_features = AIO_RING_INCOMPAT_FEATURES;
^1da177e4c3f415 Linus Torvalds             2005-04-16  627  	ring->header_length = sizeof(struct aio_ring);
16594e60cd8e6d4 Kefeng Wang                2024-03-21  628  	flush_dcache_folio(ctx->ring_folios[0]);
^1da177e4c3f415 Linus Torvalds             2005-04-16  629  
^1da177e4c3f415 Linus Torvalds             2005-04-16  630  	return 0;
^1da177e4c3f415 Linus Torvalds             2005-04-16  631  }
^1da177e4c3f415 Linus Torvalds             2005-04-16  632  

:::::: The code at line 532 was first introduced by commit
:::::: 46de8b979492e1377947700ecb1e3169088668b2 fs: Convert __set_page_dirty_no_writeback to noop_dirty_folio

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: Matthew Wilcox (Oracle) <willy@infradead.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

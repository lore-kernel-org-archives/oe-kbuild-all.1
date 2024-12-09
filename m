Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCE0156C70
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733718014; cv=none; b=gTgFfoh6r6/jUus/7usPlxO0vZkZVRUGrcojOtRO5aGFhBfMnEKRP34kAouyfZVZHIAr5S60wCtOnCc9GUTfF9e2JrCMxRtijgJYGRjb/RbbOh5i/eP/hxWaWMTCh6l/SWqx52Py5vWRUummNkrhn3LP6yiCL2mfVZ1IUFhWc8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733718014; c=relaxed/simple;
	bh=pa5FkvewZFVaTcCtYiIhg0H1byYZCSwKPfwDqoTlEn0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xeqw/8RvXkV9IhJ6TG4+RA/YnRHcWVpVgSiu3nAOEx1R6dkLjt0AEspVljLAl2CyfXSukGhqvQy3qc6AEx+c3/R+BJ6zN+DL3a8TuriouACuBIl5tgXihpr17y1IEZrsdmT9fAmiVByFJdPe+8b3f5EpEHstYLuA3Yw+2j2JPA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nHFlUU6l; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nHFlUU6l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733718013; x=1765254013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pa5FkvewZFVaTcCtYiIhg0H1byYZCSwKPfwDqoTlEn0=;
  b=nHFlUU6leivas4UDoM88z0q3SQkB79X1K3wDbrevF1tRYzaZgBpP9L35
   +f/CyGGcXUASuygGRpKv0MIYUdu3AHGAvzE8+SkOIoXnSGyXRp3Pxy+Dr
   b4/1NlSoMCb0h2B3IYHz2NnktCD0OrUr1DJ9uY4k1uwySa16Iw8dyq0I0
   DSa7N0H79pShUNkbhXsCiC/WJDHjM3yPEP+qv+Pxf+nZS8BXQElS6gRko
   E4QQGFKC1kXQHwPDn0dYmL728pSZA0YsBsLKaNH3eVT/jmLx7oZkj7Jx6
   yw+6tyzPeRTagxFL1LoqOXlDX/7qJpsPVoVrXfFKpIZBL0bQHkdiiQrpA
   Q==;
X-CSE-ConnectionGUID: I9aRysqvTiSNZXd4kfLnRg==
X-CSE-MsgGUID: aexpXq+WREKARy9u/knLgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33915903"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="33915903"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:20:11 -0800
X-CSE-ConnectionGUID: 8+58pCcsRPGmNPkstx4OpA==
X-CSE-MsgGUID: G725ojjcSju81H/qGbEGbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95300253"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Dec 2024 20:20:08 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVFe-0003pf-2Z;
	Mon, 09 Dec 2024 04:20:06 +0000
Date: Mon, 9 Dec 2024 12:19:14 +0800
From: kernel test robot <lkp@intel.com>
To: Junjie Fu <fujunjie1@qq.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 170/172] fs/aio.c:478:27: error:
 'noop_dirty_folio' undeclared here (not in a function)
Message-ID: <202412072000.csqsrSsg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   6e165f54437931f329d09dca6c19d99af08a36e1
commit: 98a9217fdcb8c8a64670a57180fdfc2f468e4ff0 [170/172] mempolicy.h: remove unnecessary header file inclusions
config: arm-randconfig-002-20241207 (https://download.01.org/0day-ci/archive/20241207/202412072000.csqsrSsg-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412072000.csqsrSsg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412072000.csqsrSsg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/aio.c:478:27: error: 'noop_dirty_folio' undeclared here (not in a function)
     478 |         .dirty_folio    = noop_dirty_folio,
         |                           ^~~~~~~~~~~~~~~~
   fs/aio.c: In function 'aio_setup_ring':
>> fs/aio.c:524:25: error: implicit declaration of function '__filemap_get_folio'; did you mean 'filemap_dirty_folio'? [-Wimplicit-function-declaration]
     524 |                 folio = __filemap_get_folio(file->f_mapping, i,
         |                         ^~~~~~~~~~~~~~~~~~~
         |                         filemap_dirty_folio
>> fs/aio.c:525:45: error: 'FGP_LOCK' undeclared (first use in this function); did you mean 'BPF_F_LOCK'?
     525 |                                             FGP_LOCK | FGP_ACCESSED | FGP_CREAT,
         |                                             ^~~~~~~~
         |                                             BPF_F_LOCK
   fs/aio.c:525:45: note: each undeclared identifier is reported only once for each function it appears in
>> fs/aio.c:525:56: error: 'FGP_ACCESSED' undeclared (first use in this function)
     525 |                                             FGP_LOCK | FGP_ACCESSED | FGP_CREAT,
         |                                                        ^~~~~~~~~~~~
>> fs/aio.c:525:71: error: 'FGP_CREAT' undeclared (first use in this function); did you mean 'IPC_CREAT'?
     525 |                                             FGP_LOCK | FGP_ACCESSED | FGP_CREAT,
         |                                                                       ^~~~~~~~~
         |                                                                       IPC_CREAT
>> fs/aio.c:532:17: error: implicit declaration of function 'folio_end_read'; did you mean 'folio_test_head'? [-Wimplicit-function-declaration]
     532 |                 folio_end_read(folio, true);
         |                 ^~~~~~~~~~~~~~
         |                 folio_test_head


vim +/noop_dirty_folio +478 fs/aio.c

^1da177e4c3f41 Linus Torvalds             2005-04-16  476  
36bc08cc01709b Gu Zheng                   2013-07-16  477  static const struct address_space_operations aio_ctx_aops = {
46de8b979492e1 Matthew Wilcox (Oracle     2022-02-09 @478) 	.dirty_folio	= noop_dirty_folio,
3648951ceb0ad2 Matthew Wilcox (Oracle     2022-06-06  479) 	.migrate_folio	= aio_migrate_folio,
36bc08cc01709b Gu Zheng                   2013-07-16  480  };
36bc08cc01709b Gu Zheng                   2013-07-16  481  
2a8a98673c13cb Mauricio Faria de Oliveira 2017-07-05  482  static int aio_setup_ring(struct kioctx *ctx, unsigned int nr_events)
^1da177e4c3f41 Linus Torvalds             2005-04-16  483  {
^1da177e4c3f41 Linus Torvalds             2005-04-16  484  	struct aio_ring *ring;
41003a7bcfed12 Zach Brown                 2013-05-07  485  	struct mm_struct *mm = current->mm;
3dc9acb6760039 Linus Torvalds             2013-12-20  486  	unsigned long size, unused;
^1da177e4c3f41 Linus Torvalds             2005-04-16  487  	int nr_pages;
36bc08cc01709b Gu Zheng                   2013-07-16  488  	int i;
36bc08cc01709b Gu Zheng                   2013-07-16  489  	struct file *file;
^1da177e4c3f41 Linus Torvalds             2005-04-16  490  
^1da177e4c3f41 Linus Torvalds             2005-04-16  491  	/* Compensate for the ring buffer's head/tail overlap entry */
^1da177e4c3f41 Linus Torvalds             2005-04-16  492  	nr_events += 2;	/* 1 is required, 2 for good luck */
^1da177e4c3f41 Linus Torvalds             2005-04-16  493  
^1da177e4c3f41 Linus Torvalds             2005-04-16  494  	size = sizeof(struct aio_ring);
^1da177e4c3f41 Linus Torvalds             2005-04-16  495  	size += sizeof(struct io_event) * nr_events;
^1da177e4c3f41 Linus Torvalds             2005-04-16  496  
36bc08cc01709b Gu Zheng                   2013-07-16  497  	nr_pages = PFN_UP(size);
^1da177e4c3f41 Linus Torvalds             2005-04-16  498  	if (nr_pages < 0)
^1da177e4c3f41 Linus Torvalds             2005-04-16  499  		return -EINVAL;
^1da177e4c3f41 Linus Torvalds             2005-04-16  500  
71ad7490c1f32b Benjamin LaHaise           2013-09-17  501  	file = aio_private_file(ctx, nr_pages);
36bc08cc01709b Gu Zheng                   2013-07-16  502  	if (IS_ERR(file)) {
36bc08cc01709b Gu Zheng                   2013-07-16  503  		ctx->aio_ring_file = NULL;
fa8a53c39f3fdd Benjamin LaHaise           2014-03-28  504  		return -ENOMEM;
36bc08cc01709b Gu Zheng                   2013-07-16  505  	}
36bc08cc01709b Gu Zheng                   2013-07-16  506  
3dc9acb6760039 Linus Torvalds             2013-12-20  507  	ctx->aio_ring_file = file;
3dc9acb6760039 Linus Torvalds             2013-12-20  508  	nr_events = (PAGE_SIZE * nr_pages - sizeof(struct aio_ring))
3dc9acb6760039 Linus Torvalds             2013-12-20  509  			/ sizeof(struct io_event);
3dc9acb6760039 Linus Torvalds             2013-12-20  510  
16594e60cd8e6d Kefeng Wang                2024-03-21  511  	ctx->ring_folios = ctx->internal_folios;
3dc9acb6760039 Linus Torvalds             2013-12-20  512  	if (nr_pages > AIO_RING_PAGES) {
16594e60cd8e6d Kefeng Wang                2024-03-21  513  		ctx->ring_folios = kcalloc(nr_pages, sizeof(struct folio *),
3dc9acb6760039 Linus Torvalds             2013-12-20  514  					   GFP_KERNEL);
16594e60cd8e6d Kefeng Wang                2024-03-21  515  		if (!ctx->ring_folios) {
3dc9acb6760039 Linus Torvalds             2013-12-20  516  			put_aio_ring_file(ctx);
3dc9acb6760039 Linus Torvalds             2013-12-20  517  			return -ENOMEM;
3dc9acb6760039 Linus Torvalds             2013-12-20  518  		}
3dc9acb6760039 Linus Torvalds             2013-12-20  519  	}
3dc9acb6760039 Linus Torvalds             2013-12-20  520  
36bc08cc01709b Gu Zheng                   2013-07-16  521  	for (i = 0; i < nr_pages; i++) {
75a07b557a11a7 Kefeng Wang                2024-03-21  522  		struct folio *folio;
75a07b557a11a7 Kefeng Wang                2024-03-21  523  
75a07b557a11a7 Kefeng Wang                2024-03-21 @524  		folio = __filemap_get_folio(file->f_mapping, i,
75a07b557a11a7 Kefeng Wang                2024-03-21 @525  					    FGP_LOCK | FGP_ACCESSED | FGP_CREAT,
75a07b557a11a7 Kefeng Wang                2024-03-21  526  					    GFP_USER | __GFP_ZERO);
75a07b557a11a7 Kefeng Wang                2024-03-21  527  		if (IS_ERR(folio))
36bc08cc01709b Gu Zheng                   2013-07-16  528  			break;
^1da177e4c3f41 Linus Torvalds             2005-04-16  529  
75a07b557a11a7 Kefeng Wang                2024-03-21  530  		pr_debug("pid(%d) [%d] folio->count=%d\n", current->pid, i,
75a07b557a11a7 Kefeng Wang                2024-03-21  531  			 folio_ref_count(folio));
75a07b557a11a7 Kefeng Wang                2024-03-21 @532  		folio_end_read(folio, true);
75a07b557a11a7 Kefeng Wang                2024-03-21  533  
16594e60cd8e6d Kefeng Wang                2024-03-21  534  		ctx->ring_folios[i] = folio;
^1da177e4c3f41 Linus Torvalds             2005-04-16  535  	}
3dc9acb6760039 Linus Torvalds             2013-12-20  536  	ctx->nr_pages = i;
3dc9acb6760039 Linus Torvalds             2013-12-20  537  
3dc9acb6760039 Linus Torvalds             2013-12-20  538  	if (unlikely(i != nr_pages)) {
3dc9acb6760039 Linus Torvalds             2013-12-20  539  		aio_free_ring(ctx);
fa8a53c39f3fdd Benjamin LaHaise           2014-03-28  540  		return -ENOMEM;
d1b9432712a25e Gu Zheng                   2013-12-04  541  	}
^1da177e4c3f41 Linus Torvalds             2005-04-16  542  
58c85dc20a2c5b Kent Overstreet            2013-05-07  543  	ctx->mmap_size = nr_pages * PAGE_SIZE;
58c85dc20a2c5b Kent Overstreet            2013-05-07  544  	pr_debug("attempting mmap of %lu bytes\n", ctx->mmap_size);
36bc08cc01709b Gu Zheng                   2013-07-16  545  
d8ed45c5dcd455 Michel Lespinasse          2020-06-08  546  	if (mmap_write_lock_killable(mm)) {
013373e8b86735 Michal Hocko               2016-05-23  547  		ctx->mmap_size = 0;
013373e8b86735 Michal Hocko               2016-05-23  548  		aio_free_ring(ctx);
013373e8b86735 Michal Hocko               2016-05-23  549  		return -EINTR;
013373e8b86735 Michal Hocko               2016-05-23  550  	}
013373e8b86735 Michal Hocko               2016-05-23  551  
45e55300f11495 Peter Collingbourne        2020-08-06  552  	ctx->mmap_base = do_mmap(ctx->aio_ring_file, 0, ctx->mmap_size,
e3fc629d7bb708 Al Viro                    2012-05-30  553  				 PROT_READ | PROT_WRITE,
592b5fad1677aa Yu-cheng Yu                2023-06-12  554  				 MAP_SHARED, 0, 0, &unused, NULL);
d8ed45c5dcd455 Michel Lespinasse          2020-06-08  555  	mmap_write_unlock(mm);
3dc9acb6760039 Linus Torvalds             2013-12-20  556  	if (IS_ERR((void *)ctx->mmap_base)) {
58c85dc20a2c5b Kent Overstreet            2013-05-07  557  		ctx->mmap_size = 0;
^1da177e4c3f41 Linus Torvalds             2005-04-16  558  		aio_free_ring(ctx);
fa8a53c39f3fdd Benjamin LaHaise           2014-03-28  559  		return -ENOMEM;
^1da177e4c3f41 Linus Torvalds             2005-04-16  560  	}
^1da177e4c3f41 Linus Torvalds             2005-04-16  561  
58c85dc20a2c5b Kent Overstreet            2013-05-07  562  	pr_debug("mmap address: 0x%08lx\n", ctx->mmap_base);
d6c355c7dabcd7 Benjamin LaHaise           2013-09-09  563  
58c85dc20a2c5b Kent Overstreet            2013-05-07  564  	ctx->user_id = ctx->mmap_base;
58c85dc20a2c5b Kent Overstreet            2013-05-07  565  	ctx->nr_events = nr_events; /* trusted copy */
^1da177e4c3f41 Linus Torvalds             2005-04-16  566  
16594e60cd8e6d Kefeng Wang                2024-03-21  567  	ring = folio_address(ctx->ring_folios[0]);
^1da177e4c3f41 Linus Torvalds             2005-04-16  568  	ring->nr = nr_events;	/* user copy */
db446a08c23d54 Benjamin LaHaise           2013-07-30  569  	ring->id = ~0U;
^1da177e4c3f41 Linus Torvalds             2005-04-16  570  	ring->head = ring->tail = 0;
^1da177e4c3f41 Linus Torvalds             2005-04-16  571  	ring->magic = AIO_RING_MAGIC;
^1da177e4c3f41 Linus Torvalds             2005-04-16  572  	ring->compat_features = AIO_RING_COMPAT_FEATURES;
^1da177e4c3f41 Linus Torvalds             2005-04-16  573  	ring->incompat_features = AIO_RING_INCOMPAT_FEATURES;
^1da177e4c3f41 Linus Torvalds             2005-04-16  574  	ring->header_length = sizeof(struct aio_ring);
16594e60cd8e6d Kefeng Wang                2024-03-21  575  	flush_dcache_folio(ctx->ring_folios[0]);
^1da177e4c3f41 Linus Torvalds             2005-04-16  576  
^1da177e4c3f41 Linus Torvalds             2005-04-16  577  	return 0;
^1da177e4c3f41 Linus Torvalds             2005-04-16  578  }
^1da177e4c3f41 Linus Torvalds             2005-04-16  579  

:::::: The code at line 478 was first introduced by commit
:::::: 46de8b979492e1377947700ecb1e3169088668b2 fs: Convert __set_page_dirty_no_writeback to noop_dirty_folio

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: Matthew Wilcox (Oracle) <willy@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

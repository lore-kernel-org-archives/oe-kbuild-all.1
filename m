Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D074A0C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Mar 2025 01:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742867128; cv=none; b=JPOBrFckZHaOHJw5uLnCaPDaC18Fj8Q7OnKEExabqVRKRPcQGK3rcUrQz8XlNtoHiKGwp7P4eWkR/2PqoroxpZZ5lRBV0TsHS4Kithf8vw6MJS8UYu8n3jLCGWEyKslP8xRGSIePaXvHMpBXEb4ME6egz0zouCvn20ccdmvJwU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742867128; c=relaxed/simple;
	bh=fYmPE7kHv9nbauDUXpEdtU58H1nfaNleHVOA3gXW3G0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qa+PoSAvoqaAx4+giykv/B2wBdOgT784ha4KW/c3EyuaqZWCmnMVkt9JOcWWgF6if+upbuPrIMk6NF7iZMcaNGRymyYUtcNIHz2lsn3DElEdPOWkNw2KfthrmaM4cxZ2f3MTPH3rpak2aSotUFAJmiZsuaJ3/z5X5z7oJEYr5s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H5Ngf3IB; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H5Ngf3IB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742867126; x=1774403126;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fYmPE7kHv9nbauDUXpEdtU58H1nfaNleHVOA3gXW3G0=;
  b=H5Ngf3IBHqkxV2Ak2qtD1fScpvPU7Lo5XB85J5Ak+699OVqMotSjLeOH
   VTobzsc1Urg96RqDONfPxqWUd8zVxC6Ma95TBA2d0fNGkhI101q2A8dBV
   uH7lpktwHdwAwqnsLAYlFI8RsPoxQWpeY2qtJMVKCejEHkzg+LImjkR4K
   70m6fWMYZjZhaDV7E3r6yK+laQONPEj91PuVDlkglZ4RkjY5VMRDuJJPo
   QLvqIRx0Qg46+lhs1hZ94Aamxd/jFFAzjWg6uq92bMe8WKQi5IduhRy8s
   vwrKXVD80Rh3nYwOyBXSSrxweN0sTvu6JBxMrZEx3Do4Nw4R7Y+01gaPJ
   w==;
X-CSE-ConnectionGUID: 29PKmKH6R8uATyA+8B4XZg==
X-CSE-MsgGUID: FQy54tvaTvyGInnDo1dbow==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="43333283"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="43333283"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 18:45:25 -0700
X-CSE-ConnectionGUID: svFkEffHShWZMwtowLGxzw==
X-CSE-MsgGUID: a9JhYaxkR7uV9YatO6B4pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="128394274"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 24 Mar 2025 18:45:04 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twtLi-00044B-0C;
	Tue, 25 Mar 2025 01:45:02 +0000
Date: Tue, 25 Mar 2025 09:44:12 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:block-new-bio-helpers 3/9] block/blk-map.c:414: warning:
 Excess function parameter 'q' description in 'bio_copy_kern'
Message-ID: <202503250945.LySJWNEs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git block-new-bio-helpers
head:   eb2a3ce5a998974e95e1e6cb024ed3c4d3360f1e
commit: 2d058ba846d4758108232ece22136498b1041e62 [3/9] block: remove the unused q argument to bio_map_kern and bio_copy_kern
config: csky-randconfig-001-20250325 (https://download.01.org/0day-ci/archive/20250325/202503250945.LySJWNEs-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250325/202503250945.LySJWNEs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503250945.LySJWNEs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-map.c:414: warning: Excess function parameter 'q' description in 'bio_copy_kern'


vim +414 block/blk-map.c

130879f1ee0e25 Christoph Hellwig 2020-03-27  400  
130879f1ee0e25 Christoph Hellwig 2020-03-27  401  /**
130879f1ee0e25 Christoph Hellwig 2020-03-27  402   *	bio_copy_kern	-	copy kernel address into bio
130879f1ee0e25 Christoph Hellwig 2020-03-27  403   *	@q: the struct request_queue for the bio
130879f1ee0e25 Christoph Hellwig 2020-03-27  404   *	@data: pointer to buffer to copy
130879f1ee0e25 Christoph Hellwig 2020-03-27  405   *	@len: length in bytes
130879f1ee0e25 Christoph Hellwig 2020-03-27  406   *	@gfp_mask: allocation flags for bio and page allocation
130879f1ee0e25 Christoph Hellwig 2020-03-27  407   *	@reading: data direction is READ
130879f1ee0e25 Christoph Hellwig 2020-03-27  408   *
130879f1ee0e25 Christoph Hellwig 2020-03-27  409   *	copy the kernel address into a bio suitable for io to a block
130879f1ee0e25 Christoph Hellwig 2020-03-27  410   *	device. Returns an error pointer in case of error.
130879f1ee0e25 Christoph Hellwig 2020-03-27  411   */
2d058ba846d475 Christoph Hellwig 2025-03-21  412  static struct bio *bio_copy_kern(void *data, unsigned int len, gfp_t gfp_mask,
2d058ba846d475 Christoph Hellwig 2025-03-21  413  		int reading)
130879f1ee0e25 Christoph Hellwig 2020-03-27 @414  {
130879f1ee0e25 Christoph Hellwig 2020-03-27  415  	unsigned long kaddr = (unsigned long)data;
130879f1ee0e25 Christoph Hellwig 2020-03-27  416  	unsigned long end = (kaddr + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
130879f1ee0e25 Christoph Hellwig 2020-03-27  417  	unsigned long start = kaddr >> PAGE_SHIFT;
130879f1ee0e25 Christoph Hellwig 2020-03-27  418  	struct bio *bio;
130879f1ee0e25 Christoph Hellwig 2020-03-27  419  	void *p = data;
130879f1ee0e25 Christoph Hellwig 2020-03-27  420  	int nr_pages = 0;
130879f1ee0e25 Christoph Hellwig 2020-03-27  421  
130879f1ee0e25 Christoph Hellwig 2020-03-27  422  	/*
130879f1ee0e25 Christoph Hellwig 2020-03-27  423  	 * Overflow, abort
130879f1ee0e25 Christoph Hellwig 2020-03-27  424  	 */
130879f1ee0e25 Christoph Hellwig 2020-03-27  425  	if (end < start)
130879f1ee0e25 Christoph Hellwig 2020-03-27  426  		return ERR_PTR(-EINVAL);
130879f1ee0e25 Christoph Hellwig 2020-03-27  427  
130879f1ee0e25 Christoph Hellwig 2020-03-27  428  	nr_pages = end - start;
066ff571011d84 Christoph Hellwig 2022-04-06  429  	bio = bio_kmalloc(nr_pages, gfp_mask);
130879f1ee0e25 Christoph Hellwig 2020-03-27  430  	if (!bio)
130879f1ee0e25 Christoph Hellwig 2020-03-27  431  		return ERR_PTR(-ENOMEM);
066ff571011d84 Christoph Hellwig 2022-04-06  432  	bio_init(bio, NULL, bio->bi_inline_vecs, nr_pages, 0);
130879f1ee0e25 Christoph Hellwig 2020-03-27  433  
130879f1ee0e25 Christoph Hellwig 2020-03-27  434  	while (len) {
130879f1ee0e25 Christoph Hellwig 2020-03-27  435  		struct page *page;
130879f1ee0e25 Christoph Hellwig 2020-03-27  436  		unsigned int bytes = PAGE_SIZE;
130879f1ee0e25 Christoph Hellwig 2020-03-27  437  
130879f1ee0e25 Christoph Hellwig 2020-03-27  438  		if (bytes > len)
130879f1ee0e25 Christoph Hellwig 2020-03-27  439  			bytes = len;
130879f1ee0e25 Christoph Hellwig 2020-03-27  440  
cc8f7fe1f5eab0 Haimin Zhang      2022-02-16  441  		page = alloc_page(GFP_NOIO | __GFP_ZERO | gfp_mask);
130879f1ee0e25 Christoph Hellwig 2020-03-27  442  		if (!page)
130879f1ee0e25 Christoph Hellwig 2020-03-27  443  			goto cleanup;
130879f1ee0e25 Christoph Hellwig 2020-03-27  444  
130879f1ee0e25 Christoph Hellwig 2020-03-27  445  		if (!reading)
130879f1ee0e25 Christoph Hellwig 2020-03-27  446  			memcpy(page_address(page), p, bytes);
130879f1ee0e25 Christoph Hellwig 2020-03-27  447  
6aeb4f83648061 Christoph Hellwig 2025-01-03  448  		if (bio_add_page(bio, page, bytes, 0) < bytes)
130879f1ee0e25 Christoph Hellwig 2020-03-27  449  			break;
130879f1ee0e25 Christoph Hellwig 2020-03-27  450  
130879f1ee0e25 Christoph Hellwig 2020-03-27  451  		len -= bytes;
130879f1ee0e25 Christoph Hellwig 2020-03-27  452  		p += bytes;
130879f1ee0e25 Christoph Hellwig 2020-03-27  453  	}
130879f1ee0e25 Christoph Hellwig 2020-03-27  454  
130879f1ee0e25 Christoph Hellwig 2020-03-27  455  	if (reading) {
130879f1ee0e25 Christoph Hellwig 2020-03-27  456  		bio->bi_end_io = bio_copy_kern_endio_read;
130879f1ee0e25 Christoph Hellwig 2020-03-27  457  		bio->bi_private = data;
130879f1ee0e25 Christoph Hellwig 2020-03-27  458  	} else {
130879f1ee0e25 Christoph Hellwig 2020-03-27  459  		bio->bi_end_io = bio_copy_kern_endio;
130879f1ee0e25 Christoph Hellwig 2020-03-27  460  	}
130879f1ee0e25 Christoph Hellwig 2020-03-27  461  
130879f1ee0e25 Christoph Hellwig 2020-03-27  462  	return bio;
130879f1ee0e25 Christoph Hellwig 2020-03-27  463  
130879f1ee0e25 Christoph Hellwig 2020-03-27  464  cleanup:
130879f1ee0e25 Christoph Hellwig 2020-03-27  465  	bio_free_pages(bio);
066ff571011d84 Christoph Hellwig 2022-04-06  466  	bio_uninit(bio);
066ff571011d84 Christoph Hellwig 2022-04-06  467  	kfree(bio);
130879f1ee0e25 Christoph Hellwig 2020-03-27  468  	return ERR_PTR(-ENOMEM);
130879f1ee0e25 Christoph Hellwig 2020-03-27  469  }
130879f1ee0e25 Christoph Hellwig 2020-03-27  470  

:::::: The code at line 414 was first introduced by commit
:::::: 130879f1ee0e25b0391b8c78b3baac6fe41f4d38 block: move bio_map_* to blk-map.c

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

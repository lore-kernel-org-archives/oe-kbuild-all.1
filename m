Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13C62F8C58
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Jul 2025 16:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752770469; cv=none; b=VuJ/IKk3HkCExR3EhHyQ2gkH7NTes9p+wgQxOS5DfBmUDNfyH/A14OMXVCtrn6yBa+RUUBWMwgMuTSxRCvY69ZRRhI281kddEUFqKjDEEdUO8wIf7xVKqVnk9MEQe3rM6W7HNx3xklTiIbyD+VnEcmaMCA/tKTiIVEtdRCogHJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752770469; c=relaxed/simple;
	bh=zgEgMWpnG5dVedlKpbU7uLNoXNHcRoqAGGWMf9jsbwk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bVcPaqNfjlk9Vtoj/r4k8I44NcNZakeEps7rragn8PwzxifLkayw/8g+18vjRYF3pZHmij/QdFwXinVaCfLQjPjbgBcBalBTLf860Y7pNbqluPxDbES/ObtIz0N6MaGk9ll2YslMxa+RA8DJThZq94AxJXSThH5z4HJY7Ka1t+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GrIrHv69; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GrIrHv69"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752770468; x=1784306468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zgEgMWpnG5dVedlKpbU7uLNoXNHcRoqAGGWMf9jsbwk=;
  b=GrIrHv69zlB543esAZ7OSDU/p7mK10gWTpWPOl/TD2Oq1mZwBJ/fdDli
   KHBXtLdkBHH1qjhy1VlG5uZvpeXVKcyqqeKlEfpeR2mgFcWf70KyEm+8Z
   LIGjz0HBSRH126rkJnZdEQqBC57vJiCGStYsd1XB1OdTTLBpnk+YtbfZh
   m7G24NqUGArXMp10/L8pZT9+sFi73L9BNrDQ5OpCGZGt0rElMryu+HuEf
   3lILcBVzVb58GuQVZufaNlhtj1uXHy/iMIVe0YtcbUYccMxqq+Bt92gF/
   iZrgHikrb+en7gwUOoUF7lehVK5lkYC/CUY6yE8PjnQGBf6ub6pVCHjdh
   g==;
X-CSE-ConnectionGUID: LS5YPurfQeebJgkhlGF+eg==
X-CSE-MsgGUID: UFTeLMRqQEmJSm+WudtirQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="55178390"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="55178390"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 09:41:08 -0700
X-CSE-ConnectionGUID: Cnnjw7WVS1a7MscuUFspYA==
X-CSE-MsgGUID: MWB4FjgjQpmNXVITUKF4Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="157232199"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Jul 2025 09:41:06 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucRfL-000Dpb-0T;
	Thu, 17 Jul 2025 16:41:03 +0000
Date: Fri, 18 Jul 2025 00:40:12 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-nvme@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>, Chaitanya Kulkarni <kch@nvidia.com>,
	Nitesh Shetty <nj.shetty@samsung.com>
Subject: [linux-nvme:nvme-6.17 8/8] fs/verity/verify.c:328:8: error: too few
 arguments to function 'verify_data_blocks'
Message-ID: <202507180038.RGK5VSsm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/nvme.git nvme-6.17
head:   fecb0b44b60e029d24b5a2c51ba27e325feb1c55
commit: fecb0b44b60e029d24b5a2c51ba27e325feb1c55 [8/8] nvme-pci: try function level reset on init failure
config: arc-randconfig-001-20250717 (https://download.01.org/0day-ci/archive/20250718/202507180038.RGK5VSsm-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507180038.RGK5VSsm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507180038.RGK5VSsm-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/verity/verify.c: In function 'fsverity_verify_bio':
>> fs/verity/verify.c:328:8: error: too few arguments to function 'verify_data_blocks'
      if (!verify_data_blocks(fi.folio, fi.length, fi.offset,
           ^~~~~~~~~~~~~~~~~~
   fs/verity/verify.c:246:1: note: declared here
    verify_data_blocks(struct folio *data_folio, size_t len, size_t offset,
    ^~~~~~~~~~~~~~~~~~


vim +/verify_data_blocks +328 fs/verity/verify.c

8a1d0f9cacc997 Eric Biggers            2019-07-22  293  
8a1d0f9cacc997 Eric Biggers            2019-07-22  294  #ifdef CONFIG_BLOCK
8a1d0f9cacc997 Eric Biggers            2019-07-22  295  /**
8a1d0f9cacc997 Eric Biggers            2019-07-22  296   * fsverity_verify_bio() - verify a 'read' bio that has just completed
6377a38bd345b7 Eric Biggers            2020-05-11  297   * @bio: the bio to verify
8a1d0f9cacc997 Eric Biggers            2019-07-22  298   *
5306892a50bf4c Eric Biggers            2022-12-23  299   * Verify the bio's data against the file's Merkle tree.  All bio data segments
5306892a50bf4c Eric Biggers            2022-12-23  300   * must be aligned to the file's Merkle tree block size.  If any data fails
5306892a50bf4c Eric Biggers            2022-12-23  301   * verification, then bio->bi_status is set to an error status.
8a1d0f9cacc997 Eric Biggers            2019-07-22  302   *
704528d895dd3e Matthew Wilcox (Oracle  2022-03-23  303)  * This is a helper function for use by the ->readahead() method of filesystems
8a1d0f9cacc997 Eric Biggers            2019-07-22  304   * that issue bios to read data directly into the page cache.  Filesystems that
8a1d0f9cacc997 Eric Biggers            2019-07-22  305   * populate the page cache without issuing bios (e.g. non block-based
8a1d0f9cacc997 Eric Biggers            2019-07-22  306   * filesystems) must instead call fsverity_verify_page() directly on each page.
8a1d0f9cacc997 Eric Biggers            2019-07-22  307   * All filesystems must also call fsverity_verify_page() on holes.
8a1d0f9cacc997 Eric Biggers            2019-07-22  308   */
8a1d0f9cacc997 Eric Biggers            2019-07-22  309  void fsverity_verify_bio(struct bio *bio)
8a1d0f9cacc997 Eric Biggers            2019-07-22  310  {
5d0f0e57ed9009 Eric Biggers            2023-01-27  311  	struct folio_iter fi;
fd39073dba8632 Eric Biggers            2020-01-06  312  	unsigned long max_ra_pages = 0;
8a1d0f9cacc997 Eric Biggers            2019-07-22  313  
fd39073dba8632 Eric Biggers            2020-01-06  314  	if (bio->bi_opf & REQ_RAHEAD) {
fd39073dba8632 Eric Biggers            2020-01-06  315  		/*
fd39073dba8632 Eric Biggers            2020-01-06  316  		 * If this bio is for data readahead, then we also do readahead
fd39073dba8632 Eric Biggers            2020-01-06  317  		 * of the first (largest) level of the Merkle tree.  Namely,
fd39073dba8632 Eric Biggers            2020-01-06  318  		 * when a Merkle tree page is read, we also try to piggy-back on
fd39073dba8632 Eric Biggers            2020-01-06  319  		 * some additional pages -- up to 1/4 the number of data pages.
fd39073dba8632 Eric Biggers            2020-01-06  320  		 *
fd39073dba8632 Eric Biggers            2020-01-06  321  		 * This improves sequential read performance, as it greatly
fd39073dba8632 Eric Biggers            2020-01-06  322  		 * reduces the number of I/O requests made to the Merkle tree.
fd39073dba8632 Eric Biggers            2020-01-06  323  		 */
9098f36b739db9 Eric Biggers            2022-12-23  324  		max_ra_pages = bio->bi_iter.bi_size >> (PAGE_SHIFT + 2);
fd39073dba8632 Eric Biggers            2020-01-06  325  	}
fd39073dba8632 Eric Biggers            2020-01-06  326  
5d0f0e57ed9009 Eric Biggers            2023-01-27  327  	bio_for_each_folio_all(fi, bio) {
d1f0c5ea04cd0a Eric Biggers            2023-06-03 @328  		if (!verify_data_blocks(fi.folio, fi.length, fi.offset,
8fcd94add6c5c9 Eric Biggers            2023-05-15  329  					max_ra_pages)) {
98dc08bae6780b Eric Biggers            2022-11-28  330  			bio->bi_status = BLK_STS_IOERR;
98dc08bae6780b Eric Biggers            2022-11-28  331  			break;
98dc08bae6780b Eric Biggers            2022-11-28  332  		}
8a1d0f9cacc997 Eric Biggers            2019-07-22  333  	}
8a1d0f9cacc997 Eric Biggers            2019-07-22  334  }
8a1d0f9cacc997 Eric Biggers            2019-07-22  335  EXPORT_SYMBOL_GPL(fsverity_verify_bio);
8a1d0f9cacc997 Eric Biggers            2019-07-22  336  #endif /* CONFIG_BLOCK */
8a1d0f9cacc997 Eric Biggers            2019-07-22  337  

:::::: The code at line 328 was first introduced by commit
:::::: d1f0c5ea04cd0a93309de0246278f0b22394692d fsverity: don't use bio_first_page_all() in fsverity_verify_bio()

:::::: TO: Eric Biggers <ebiggers@google.com>
:::::: CC: Eric Biggers <ebiggers@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

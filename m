Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEA03D76
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 May 2025 06:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747982962; cv=none; b=shgUQu7UPmuXN81joS7bY6h/mKbHNk1AMICQ5ulWcJKMTqu0zTDxJwMg2kiuZVozSIX/MTqtFE2iUBXYhAqRNfAlGODpSrEKY9AC9H0lnP2XNvzipHZWNNapxts1ugb/m+PnRyQLURQqUot/E8fD9Aku5K72xb8xDTfkNx50H9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747982962; c=relaxed/simple;
	bh=OmZeruMkxN4L5sperNx+voKt1T2WXem13m8aTz010BE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uh9KiGAG/LF4CD9N/wJ9SdEQ1OXH2Y8qJx4cPGr8tTvltvbVhXxjeEDCHMad34dMbvdDXbG5f+YYWL4j4c7t+nrrkFiFQG08V78ml/Xtta7pNdCxs2H3k4nPPi4jQbaZl0f34F3rhU/uhZe8VlrJjCuX0sUsAMfe35NIsJq2B+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZycATlKh; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZycATlKh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747982961; x=1779518961;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OmZeruMkxN4L5sperNx+voKt1T2WXem13m8aTz010BE=;
  b=ZycATlKhly3lq/NBNAKrwEFkGlYBpAr7nPBCYNAvurp01+IrJWt5kUg8
   PxDxftS6jPhpHPLGUks2tXT17pZPmtA/kNHbTBf5jxNt+ZHI317rCcrl7
   VgR0buj7Aze/T4qSQfaDYc4YwxhhCzb7zduDw4BHkg325qcMVe7da6ANw
   0nsHNH2hSpyL8SdR9FP2fv/Vl4sY3CK/hJLM8qfmLS1Uf9uCjagr5aefM
   qwsEg/0SWT+nOm2ZvWDmzWxJ76/qOrTtJftI3r7XMd3oHGWwq3PuThVlq
   9ZdHVIvC7g7g5MVjW9OoTwwpyENa/MsRNF3rcpoGswixji9xHmxY53g7/
   w==;
X-CSE-ConnectionGUID: pQ8c6ztWQ/6kYtHzXu3CBA==
X-CSE-MsgGUID: YkFH39w1TC6pg7WpL6jriw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49145879"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="49145879"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 23:49:21 -0700
X-CSE-ConnectionGUID: XFR1Y1pHR3ibi7+zxAr/QA==
X-CSE-MsgGUID: yNUZ46YlSFeEGWYHAjNp7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="145845597"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 May 2025 23:49:19 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIMDV-000Q5s-1O;
	Fri, 23 May 2025 06:49:17 +0000
Date: Fri, 23 May 2025 14:49:07 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Raghav <p.raghav@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2 2/2] block: use mm_huge_zero_folio in
 __blkdev_issue_zero_pages()
Message-ID: <202505231416.GECtFkXP-lkp@intel.com>
References: <20250522090243.758943-3-p.raghav@samsung.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522090243.758943-3-p.raghav@samsung.com>

Hi Pankaj,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on f1f6aceb82a55f87d04e2896ac3782162e7859bd]

url:    https://github.com/intel-lab-lkp/linux/commits/Pankaj-Raghav/mm-add-THP_HUGE_ZERO_PAGE_ALWAYS-config-option/20250522-170442
base:   f1f6aceb82a55f87d04e2896ac3782162e7859bd
patch link:    https://lore.kernel.org/r/20250522090243.758943-3-p.raghav%40samsung.com
patch subject: [RFC v2 2/2] block: use mm_huge_zero_folio in __blkdev_issue_zero_pages()
config: arm-randconfig-003-20250523 (https://download.01.org/0day-ci/archive/20250523/202505231416.GECtFkXP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250523/202505231416.GECtFkXP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505231416.GECtFkXP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   block/blk-lib.c: In function '__blkdev_issue_zero_pages':
   block/blk-lib.c:201:15: error: implicit declaration of function 'mm_get_huge_zero_folio'; did you mean 'mm_put_huge_zero_folio'? [-Werror=implicit-function-declaration]
     zero_folio = mm_get_huge_zero_folio(NULL);
                  ^~~~~~~~~~~~~~~~~~~~~~
                  mm_put_huge_zero_folio
>> block/blk-lib.c:201:13: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
     zero_folio = mm_get_huge_zero_folio(NULL);
                ^
   cc1: some warnings being treated as errors


vim +201 block/blk-lib.c

   194	
   195	static void __blkdev_issue_zero_pages(struct block_device *bdev,
   196			sector_t sector, sector_t nr_sects, gfp_t gfp_mask,
   197			struct bio **biop, unsigned int flags)
   198	{
   199		struct folio *zero_folio;
   200	
 > 201		zero_folio = mm_get_huge_zero_folio(NULL);
   202		if (!zero_folio)
   203			zero_folio = page_folio(ZERO_PAGE(0));
   204	
   205		while (nr_sects) {
   206			unsigned int nr_vecs = __blkdev_sectors_to_bio_pages(nr_sects);
   207			struct bio *bio;
   208	
   209			bio = bio_alloc(bdev, nr_vecs, REQ_OP_WRITE, gfp_mask);
   210			bio->bi_iter.bi_sector = sector;
   211	
   212			if ((flags & BLKDEV_ZERO_KILLABLE) &&
   213			    fatal_signal_pending(current))
   214				break;
   215	
   216			do {
   217				unsigned int len, added = 0;
   218	
   219				len = min_t(sector_t, folio_size(zero_folio),
   220					    nr_sects << SECTOR_SHIFT);
   221				if (bio_add_folio(bio, zero_folio, len, 0))
   222					added = len;
   223				if (added < len)
   224					break;
   225				nr_sects -= added >> SECTOR_SHIFT;
   226				sector += added >> SECTOR_SHIFT;
   227			} while (nr_sects);
   228	
   229			*biop = bio_chain_and_submit(*biop, bio);
   230			cond_resched();
   231		}
   232	}
   233	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

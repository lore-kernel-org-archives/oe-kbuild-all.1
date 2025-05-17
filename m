Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB50C4C97
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 May 2025 00:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747442688; cv=none; b=jx3w9n/gn1Ts0aT9Ohw3PbGXmWyipNkxeHJcVE49bg2FtHRZf62Pi+inoe9TChTz8I9/M1bs8ixTj7SL7aCpGC30czW+ZKl8LrJRqMVioeQgmXdYEm45tPVM5GLQZKVPMmDZXKD0N/gd02gO2uNBwtQRoCKUOPFh3Hln8x1Bh94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747442688; c=relaxed/simple;
	bh=TZkaQVKuEi8M8XlhXroMD3//+kjM6zfXbwctlwrN8+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MPwENPQqteQ7E3C/rcDaIL+O0pvd1Pfk0a2oCxXjcA3Envjamva8c1GkpX/pUR9sDV93CMSWA68mw4l4YJe2tcN/14zXP3jjYt2qky1hxt/mRUB8kjUnYX1H6S3SyZdvyu66rhWnjX7hJE3+/Xo94F4pf+qvnJf6f0jP6xpA0Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d6Swq/GL; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d6Swq/GL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747442686; x=1778978686;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TZkaQVKuEi8M8XlhXroMD3//+kjM6zfXbwctlwrN8+U=;
  b=d6Swq/GLM4Y3G/kT7YTWYSjzeyYZf/lCjJ8QSfUWelOmMOgRKJOEuKBd
   mbyReD7EretBuRHkhRqUqBFl2o/UX90mhUAXz0oQ6QjAJyv3+CFW0XDwu
   BRtURHjCaNtVF/HJVzZElW+tMkaUeS3h6Q9jRg5bvdvcsNZyl7FKhCwVO
   R+jqZNwE0+q0yjBg+eWixzPnQITJnciD1P38FXrrZp0GvYwweSvWh1JWC
   0x2aAES4/ae3dcbX2K/+LQlkG3YCHEyiUBvTJpzylTBYAjX9WpIDeIN9r
   v2RQjEZcJto2TK6LtslJ7Fi386OGsPozROU8dsGenyMS2hb4Lh/FKG9p4
   g==;
X-CSE-ConnectionGUID: Zy9e7gf0RA2SyQSVIGMHwQ==
X-CSE-MsgGUID: Y9ryMYxqR6m5l1HrA8pLEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49410298"
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="49410298"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 17:44:46 -0700
X-CSE-ConnectionGUID: EtzkXB60QX+/hdI/nHKQew==
X-CSE-MsgGUID: cwjwnB5tSc2k+pwqAitFNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="138745873"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 May 2025 17:44:44 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uG5fN-000Jp9-30;
	Sat, 17 May 2025 00:44:41 +0000
Date: Sat, 17 May 2025 08:43:58 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Raghav <p.raghav@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 2/3] block: use LARGE_ZERO_PAGE in
 __blkdev_issue_zero_pages()
Message-ID: <202505170800.0oPfDkni-lkp@intel.com>
References: <20250516101054.676046-3-p.raghav@samsung.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516101054.676046-3-p.raghav@samsung.com>

Hi Pankaj,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 9e619cd4fefd19cdce16e169d5827bc64ae01aa1]

url:    https://github.com/intel-lab-lkp/linux/commits/Pankaj-Raghav/mm-add-large-zero-page-for-efficient-zeroing-of-larger-segments/20250516-181327
base:   9e619cd4fefd19cdce16e169d5827bc64ae01aa1
patch link:    https://lore.kernel.org/r/20250516101054.676046-3-p.raghav%40samsung.com
patch subject: [RFC 2/3] block: use LARGE_ZERO_PAGE in __blkdev_issue_zero_pages()
config: arm-randconfig-003-20250517 (https://download.01.org/0day-ci/archive/20250517/202505170800.0oPfDkni-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505170800.0oPfDkni-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505170800.0oPfDkni-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:28,
                    from block/blk-lib.c:5:
   block/blk-lib.c: In function '__blkdev_issue_zero_pages':
   block/blk-lib.c:214:5: error: 'ZERO_LARGE_PAGE_SIZE' undeclared (first use in this function); did you mean 'ELF_EXEC_PAGESIZE'?
        ZERO_LARGE_PAGE_SIZE, nr_sects << SECTOR_SHIFT);
        ^~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:86:16: note: in definition of macro '__cmp_once_unique'
     ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
                   ^
   include/linux/minmax.h:161:27: note: in expansion of macro '__cmp_once'
    #define min_t(type, x, y) __cmp_once(min, type, x, y)
                              ^~~~~~~~~~
   block/blk-lib.c:213:10: note: in expansion of macro 'min_t'
       len = min_t(sector_t,
             ^~~~~
   block/blk-lib.c:214:5: note: each undeclared identifier is reported only once for each function it appears in
        ZERO_LARGE_PAGE_SIZE, nr_sects << SECTOR_SHIFT);
        ^~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:86:16: note: in definition of macro '__cmp_once_unique'
     ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
                   ^
   include/linux/minmax.h:161:27: note: in expansion of macro '__cmp_once'
    #define min_t(type, x, y) __cmp_once(min, type, x, y)
                              ^~~~~~~~~~
   block/blk-lib.c:213:10: note: in expansion of macro 'min_t'
       len = min_t(sector_t,
             ^~~~~
   block/blk-lib.c:215:30: error: implicit declaration of function 'ZERO_LARGE_PAGE'; did you mean 'ZERO_PAGE'? [-Werror=implicit-function-declaration]
       added = bio_add_page(bio, ZERO_LARGE_PAGE(0), len, 0);
                                 ^~~~~~~~~~~~~~~
                                 ZERO_PAGE
>> block/blk-lib.c:215:30: warning: passing argument 2 of 'bio_add_page' makes pointer from integer without a cast [-Wint-conversion]
       added = bio_add_page(bio, ZERO_LARGE_PAGE(0), len, 0);
                                 ^~~~~~~~~~~~~~~~~~
   In file included from block/blk-lib.c:7:
   include/linux/bio.h:412:61: note: expected 'struct page *' but argument is of type 'int'
    int __must_check bio_add_page(struct bio *bio, struct page *page, unsigned len,
                                                   ~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors


vim +/bio_add_page +215 block/blk-lib.c

   194	
   195	static void __blkdev_issue_zero_pages(struct block_device *bdev,
   196			sector_t sector, sector_t nr_sects, gfp_t gfp_mask,
   197			struct bio **biop, unsigned int flags)
   198	{
   199		while (nr_sects) {
   200			unsigned int nr_vecs = __blkdev_sectors_to_bio_pages(nr_sects);
   201			struct bio *bio;
   202	
   203			bio = bio_alloc(bdev, nr_vecs, REQ_OP_WRITE, gfp_mask);
   204			bio->bi_iter.bi_sector = sector;
   205	
   206			if ((flags & BLKDEV_ZERO_KILLABLE) &&
   207			    fatal_signal_pending(current))
   208				break;
   209	
   210			do {
   211				unsigned int len, added;
   212	
   213				len = min_t(sector_t,
   214					ZERO_LARGE_PAGE_SIZE, nr_sects << SECTOR_SHIFT);
 > 215				added = bio_add_page(bio, ZERO_LARGE_PAGE(0), len, 0);
   216				if (added < len)
   217					break;
   218				nr_sects -= added >> SECTOR_SHIFT;
   219				sector += added >> SECTOR_SHIFT;
   220			} while (nr_sects);
   221	
   222			*biop = bio_chain_and_submit(*biop, bio);
   223			cond_resched();
   224		}
   225	}
   226	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

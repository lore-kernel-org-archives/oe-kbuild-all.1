Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D6B35F193
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 10:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781347608; cv=none; b=n+AMWT7zneYoPuIxqkMCyrgsES+ITN/IntHDl0ry5bMlCvRGiMOnqgur9nuq0rEKSk+gg0+KM4KpkmBDtNAoF4IirfATFVMjMWRsYh5A+buwLDIt1fTTtGIyew64k22IEOzpAFffeFgJpoxQsk66T6WhwhtuUteENd067UqiaTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781347608; c=relaxed/simple;
	bh=2QlJ0F3w4MT6Jz8HrKDZChpvFYahL7qjSK3TrMZFd5w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cAzRk08WPcgXhqk43cLZPSZKp2YoSNgUd9cLkwquD9rKLXiK7ehyPZKl/F0KRy37XWY/3od8nMBqITA229K4OUTj9HasykczcGcwmwclfk2LewjMgPRp4Skz7szjSwAboG0953tJ0PHIgyGSF3sR6K61qaaSB0sKXDnd0SG239o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i7t+YVmU; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i7t+YVmU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781347602; x=1812883602;
  h=date:from:to:cc:subject:message-id;
  bh=2QlJ0F3w4MT6Jz8HrKDZChpvFYahL7qjSK3TrMZFd5w=;
  b=i7t+YVmUVN0LB8pIDRt79mAnsssiFwvAd7z3xthpoI3WU+a8m+6bV1We
   aRMrwUgSkntZj6dgX2tVrtPhX/GbuWNqg1p69K2WlwOgcgJ2x3ZF0Gzho
   8/iolcfHAPmQCT+shlN+m5KvnHbfWE73j9nfUPXlbz1AZVqmEl6rtpCPC
   FYgdtavTvdJKglN3Z9Uj7tdBYQB6yLB4JrcfZ8lAr/aGoy4qXAXTxk8tV
   KjEGKv4Ap80IzBWJO3QQ6PJMw8i/A8wjePtSGcDeZSylfbWaEXqUynCcI
   vXYft9w061iX2cCMSu6XI7Q0FbgaMZRt1nsZEplQMAY96vf4uO2EE3Xlw
   g==;
X-CSE-ConnectionGUID: rNgsncY7SZixX7xxvo5zrA==
X-CSE-MsgGUID: EGfaZPfjRZSwfiSq+w5hxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="93655866"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="93655866"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 03:46:41 -0700
X-CSE-ConnectionGUID: N0LEHaK5Q+GJU5Pv4iqC4A==
X-CSE-MsgGUID: /rEdlMAISz22d14P3eoN8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="251975860"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Jun 2026 03:46:39 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYLsp-00000000Prm-31Si;
	Sat, 13 Jun 2026 10:46:35 +0000
Date: Sat, 13 Jun 2026 18:46:34 +0800
From: kernel test robot <lkp@intel.com>
To: Cunlong Li <shenxiaogll@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Christoph Hellwig <hch@lst.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [linux-next:master 11626/13763]
 drivers/block/zram/zram_drv.c:2345:49: error: 'bio' undeclared
Message-ID: <202606131800.eF9ahCdY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Cunlong,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c425609d6ac4012c8bbf01ec2e10e801b1923a7b
commit: d1aba985984781947ad67c1b44ac64bd498c8f27 [11626/13763] zram: drop unused bio parameter from write helpers
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260613/202606131800.eF9ahCdY-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606131800.eF9ahCdY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606131800.eF9ahCdY-lkp@intel.com/

Note: the linux-next/master HEAD c425609d6ac4012c8bbf01ec2e10e801b1923a7b builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   drivers/block/zram/zram_drv.c: In function 'zram_bvec_write_partial':
>> drivers/block/zram/zram_drv.c:2345:49: error: 'bio' undeclared (first use in this function)
    2345 |         ret = zram_read_page(zram, page, index, bio);
         |                                                 ^~~
   drivers/block/zram/zram_drv.c:2345:49: note: each undeclared identifier is reported only once for each function it appears in


vim +/bio +2345 drivers/block/zram/zram_drv.c

1f7319c7427503a drivers/block/zram/zram_drv.c   Minchan Kim       2017-05-03  2332  
a0b81ae7a4ff8a7 drivers/block/zram/zram_drv.c   Christoph Hellwig 2023-04-11  2333  /*
a0b81ae7a4ff8a7 drivers/block/zram/zram_drv.c   Christoph Hellwig 2023-04-11  2334   * This is a partial IO. Read the full page before writing the changes.
a0b81ae7a4ff8a7 drivers/block/zram/zram_drv.c   Christoph Hellwig 2023-04-11  2335   */
a0b81ae7a4ff8a7 drivers/block/zram/zram_drv.c   Christoph Hellwig 2023-04-11  2336  static int zram_bvec_write_partial(struct zram *zram, struct bio_vec *bvec,
d1aba9859847819 drivers/block/zram/zram_drv.c   Cunlong Li        2026-05-28  2337  				   u32 index, int offset)
1f7319c7427503a drivers/block/zram/zram_drv.c   Minchan Kim       2017-05-03  2338  {
a0b81ae7a4ff8a7 drivers/block/zram/zram_drv.c   Christoph Hellwig 2023-04-11  2339  	struct page *page = alloc_page(GFP_NOIO);
1f7319c7427503a drivers/block/zram/zram_drv.c   Minchan Kim       2017-05-03  2340  	int ret;
1f7319c7427503a drivers/block/zram/zram_drv.c   Minchan Kim       2017-05-03  2341  
1f7319c7427503a drivers/block/zram/zram_drv.c   Minchan Kim       2017-05-03  2342  	if (!page)
1f7319c7427503a drivers/block/zram/zram_drv.c   Minchan Kim       2017-05-03  2343  		return -ENOMEM;
1f7319c7427503a drivers/block/zram/zram_drv.c   Minchan Kim       2017-05-03  2344  
4e3c87b9421df49 drivers/block/zram/zram_drv.c   Christoph Hellwig 2023-04-11 @2345  	ret = zram_read_page(zram, page, index, bio);
a0b81ae7a4ff8a7 drivers/block/zram/zram_drv.c   Christoph Hellwig 2023-04-11  2346  	if (!ret) {
f575a5add8a9a3c drivers/block/zram/zram_drv.c   Christoph Hellwig 2023-04-11  2347  		memcpy_from_bvec(page_address(page) + offset, bvec);
6aa4b839e7a481c drivers/block/zram/zram_drv.c   Christoph Hellwig 2023-04-11  2348  		ret = zram_write_page(zram, page, index);
1f7319c7427503a drivers/block/zram/zram_drv.c   Minchan Kim       2017-05-03  2349  	}
1f7319c7427503a drivers/block/zram/zram_drv.c   Minchan Kim       2017-05-03  2350  	__free_page(page);
924bd88d703e53d drivers/staging/zram/zram_drv.c Jerome Marchand   2011-06-10  2351  	return ret;
8c921b2b43d47fa drivers/staging/zram/zram_drv.c Jerome Marchand   2011-06-10  2352  }
8c921b2b43d47fa drivers/staging/zram/zram_drv.c Jerome Marchand   2011-06-10  2353  

:::::: The code at line 2345 was first introduced by commit
:::::: 4e3c87b9421df497d849ae61aab9762de7f66afb zram: fix synchronous reads

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397E056B87
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Nov 2023 15:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CuiQRGTc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700667989; x=1732203989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r8bzUxXMxg6vUGeb1UsGpKyD4dhmmcka548WtjpPa5k=;
  b=CuiQRGTcz3G2jFidTb8WhpzCDdoyCEpgP01pTI8MBWCaMQQPvX6NnIKG
   uW13rXwxFL3bFPwkvxZsTAobff/OOtMkpwT1lqy2W//LSM1KCJSo6EG23
   YafKT0yHtY6BRFDB1JlWGda/GJ2cSWiICi/b3QUHn5DvtpPIw/q7lBc64
   m4KnGjh+W6MXfXsmFu4JW/N1ncdZqXTQkDlL6wqm1PCPpJRPBPhVuq3po
   QXk2wZRCvpVJch73Qgr1Bookpg1mXvJvATPZfXxcpQhzBflgbvR6+eMJK
   8lcySl86qM0PZ7nksapIkFFgynmpwwcF/1w6VVO0RMFwRb5YxvMu66hWM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="13623168"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="13623168"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 07:46:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="8510502"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Nov 2023 07:46:25 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5pQl-0000dT-1Q;
	Wed, 22 Nov 2023 15:46:23 +0000
Date: Wed, 22 Nov 2023 23:45:57 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:data-lifetime 7/18] fs/direct-io.c:413:12: error:
 'struct bio' has no member named 'bi_write_hint'
Message-ID: <202311222137.1YcklUiH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux data-lifetime
head:   47260901eff3c760da96059c71d8ac8dd4e81c54
commit: 7cf24538b20e4bf0400d19e1e21e3fdd3ebdf735 [7/18] block: Restore the per-bio/request data lifetime fields
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20231122/202311222137.1YcklUiH-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311222137.1YcklUiH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311222137.1YcklUiH-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/direct-io.c: In function 'dio_bio_alloc':
>> fs/direct-io.c:413:12: error: 'struct bio' has no member named 'bi_write_hint'
     413 |         bio->bi_write_hint = dio->iocb->ki_hint;
         |            ^~


vim +413 fs/direct-io.c

   393	
   394	static inline void
   395	dio_bio_alloc(struct dio *dio, struct dio_submit *sdio,
   396		      struct block_device *bdev,
   397		      sector_t first_sector, int nr_vecs)
   398	{
   399		struct bio *bio;
   400	
   401		/*
   402		 * bio_alloc() is guaranteed to return a bio when allowed to sleep and
   403		 * we request a valid number of vectors.
   404		 */
   405		bio = bio_alloc(bdev, nr_vecs, dio->opf, GFP_KERNEL);
   406		bio->bi_iter.bi_sector = first_sector;
   407		if (dio->is_async)
   408			bio->bi_end_io = dio_bio_end_aio;
   409		else
   410			bio->bi_end_io = dio_bio_end_io;
   411		if (dio->is_pinned)
   412			bio_set_flag(bio, BIO_PAGE_PINNED);
 > 413		bio->bi_write_hint = dio->iocb->ki_hint;
   414	
   415		sdio->bio = bio;
   416		sdio->logical_offset_in_bio = sdio->cur_page_fs_offset;
   417	}
   418	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7833F9D2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Apr 2025 18:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746038893; cv=none; b=EZACi/Cya2CqeDS+vus9QTEISFyuQlb13/7+j4wqUjmoM4OYbUvIe99b3rPpos5rPnbWFSzAq1TDSGKTRhQMD+dFlBe8Vo+o/jPkfBbvm2K4n4+1P6SvXdEdnhgtIUb02FLsCfL7JdT5+8WX9M8+RGiHslUW37jta5IDxNFxlIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746038893; c=relaxed/simple;
	bh=liINgcU2XE0Bg8BkeSrQ1+hn3a83wGIcOJZ0zD1hGLA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aksWuQtkCvQBKTsAGnX7juAGRHBHPg1agaHwPgYzW9993/KtXtGNCVCT6uNnqZ9hqCWZ4n57kMvyrveNAe9EYJ3UcbjNtcW5AI0oqgTDiY4fCzi5COgu/SfuG2xEjuaLpKobtWBLoRWBZY5MYQ/ZsybI0Gd03Hk6qDHwqT/yAvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m4c3TOHp; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m4c3TOHp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746038891; x=1777574891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=liINgcU2XE0Bg8BkeSrQ1+hn3a83wGIcOJZ0zD1hGLA=;
  b=m4c3TOHpxwC4vaaAroQYF0wsxMJPzy9sLJG+tYxRgUQ8jFUdlZyOYOqb
   QNM4hSl31l6+Zn6b3Zoftb1UDRgrIuyROwCdRLXAye2vcoNqKwhHOqjwp
   rMSmhtWUA2q5th1D86HgzoGGA4XY5265tYm67Ti0+6MMg961p+hfMwnT8
   OxCLRVa73GY+z42S8aeMDiYqd/bljvMt+5HBE//6yqvqccbEsqDGbe8H1
   YexBGt7h9buibJOlDmStA4uRZI9wHi42PqyqJqgXusZ9rkX+XwfBA7JYh
   GmAeRz1pMu6xXrUo1gVLw8/eAefmLAkEwfzQr+0Zj51WK/+h1ah8aEEBU
   g==;
X-CSE-ConnectionGUID: 8GPdV9nkTrW4IXvLsBWTrg==
X-CSE-MsgGUID: V6C3ROKUSUy1VGpRHbTj1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="47592618"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="47592618"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 11:48:09 -0700
X-CSE-ConnectionGUID: w4+pTWvhTI6klJfGbiWjrA==
X-CSE-MsgGUID: SBVbxjrwSl2FgjEiTzr0tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="139024281"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Apr 2025 11:48:08 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uACTW-0003hb-1l;
	Wed, 30 Apr 2025 18:48:06 +0000
Date: Thu, 1 May 2025 02:47:15 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:block-remove-bounce 6/7] kernel/trace/blktrace.c:896:13:
 warning: 'blk_add_trace_bio_bounce' defined but not used
Message-ID: <202505010218.VqsKFiLp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git block-remove-bounce
head:   6f324e4ec5d5fb7c67689f2b48d978da0eb9cb96
commit: f7100d2da5079dce17414284256335e5d63200b0 [6/7] block: remove bounce buffering support
config: arc-randconfig-001-20250501 (https://download.01.org/0day-ci/archive/20250501/202505010218.VqsKFiLp-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250501/202505010218.VqsKFiLp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505010218.VqsKFiLp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/blktrace.c:896:13: warning: 'blk_add_trace_bio_bounce' defined but not used [-Wunused-function]
     896 | static void blk_add_trace_bio_bounce(void *ignore, struct bio *bio)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: note: unrecognized command-line option '-Wno-unterminated-string-initialization' may have been intended to silence earlier diagnostics


vim +/blk_add_trace_bio_bounce +896 kernel/trace/blktrace.c

5f3ea37c7716db block/blktrace.c        Arnaldo Carvalho de Melo 2008-10-30  895  
e8a676d61c07ec kernel/trace/blktrace.c Christoph Hellwig        2020-12-03 @896  static void blk_add_trace_bio_bounce(void *ignore, struct bio *bio)
5f3ea37c7716db block/blktrace.c        Arnaldo Carvalho de Melo 2008-10-30  897  {
309dca309fc39a kernel/trace/blktrace.c Christoph Hellwig        2021-01-24  898  	blk_add_trace_bio(bio->bi_bdev->bd_disk->queue, bio, BLK_TA_BOUNCE, 0);
5f3ea37c7716db block/blktrace.c        Arnaldo Carvalho de Melo 2008-10-30  899  }
5f3ea37c7716db block/blktrace.c        Arnaldo Carvalho de Melo 2008-10-30  900  

:::::: The code at line 896 was first introduced by commit
:::::: e8a676d61c07eccfcd9d6fddfe4dcb630651c29a block: simplify and extend the block_bio_merge tracepoint class

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

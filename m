Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE88956773
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jul 2024 11:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720439561; cv=none; b=ioGkmmc1ug/p6dEF7l670Rp5Er56ZcqQfegUwvgyNVvHFR5tPaiLP81x6eJn2ZWBI8P1NT/Bqyxpl9nbq/11TvwfVzBYoIfg5xQgkA+qVwhn09ROf8sYzr302H82/b/FDVEiihMC2nZmJ6JfRkfvJXIXs0YXw+GN4gQMeVzZwjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720439561; c=relaxed/simple;
	bh=0b+60Dqr8Zjwy8dIr2QC8XwXad+b+rUtjH26uTJe8AQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JkqCGpQALi5lVxi9/Hs/F6YiWY1DBga2g+kHPuVtmZ28UT6E1ghsj06rLVgz2jidWOY3QtxQ+wAbk166N4mloreSek8tHaBsaS4gaMBP6vdxQAiFu+DP0oewk/u+HXLIeuK350QGfeaaQhsu5CYFOR9/ASLRwB9tSld51G+/RAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZaSvSGfY; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZaSvSGfY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720439558; x=1751975558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0b+60Dqr8Zjwy8dIr2QC8XwXad+b+rUtjH26uTJe8AQ=;
  b=ZaSvSGfYEAMdmMd9m7kJAZeCraf5u6YOBSEyQ/i/nx1Os0gJ30pNEe2o
   KRG/ysOaPAS9vEJCgzeyDqqH8ZVRsxYgdSwOWBnjnBfM9uiHxY68ydxpe
   day3IEm769HY1A7P+OEYAP9FiEI++EIiZDwLUe/qcvVSDc56qk3i3SbC9
   eQAlT7RxvYMBvQsQIZ6QVy7Fw9JwL1koRhXil2GJLhZtDQr1uKxpTOEcW
   ly9G/4vQZup+3+ZSslFV458X1P5ngzJ1diPgEgswSvt7fQZ9y/ju92Zct
   lXHPlEj4vcrwKGob7QyzysiVvizMuQQN/JPMOUTkd2L3ufNjBNQsrSHoJ
   Q==;
X-CSE-ConnectionGUID: nhwsWpWZSTa1FTK2oK8mCw==
X-CSE-MsgGUID: neE0IDBrTVqgS/VWuIBz7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="21504386"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="21504386"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 04:52:38 -0700
X-CSE-ConnectionGUID: wEH/bR27T7GYzz15fqgHhg==
X-CSE-MsgGUID: WxhVTPsHRTuoTfUTmztynw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="47443782"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Jul 2024 04:52:37 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQmv4-000ViY-2f;
	Mon, 08 Jul 2024 11:52:34 +0000
Date: Mon, 8 Jul 2024 19:52:06 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>,
	Chaitanya Kulkarni <kch@nvidia.com>
Subject: [axboe-block:for-next 22/23] block/blk-merge.c:220: warning:
 Function parameter or struct member 'len' not described in
 'get_max_segment_size'
Message-ID: <202407081932.BfTTk7Zm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
head:   7f8851d381f71952787db6a1a71bef4d286f3df0
commit: 09595e0c9d654743483197b2f21dd4ec37c90a27 [22/23] block: pass a phys_addr_t to get_max_segment_size
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240708/202407081932.BfTTk7Zm-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240708/202407081932.BfTTk7Zm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407081932.BfTTk7Zm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-merge.c:220: warning: Function parameter or struct member 'len' not described in 'get_max_segment_size'
>> block/blk-merge.c:220: warning: Excess function parameter 'max_len' description in 'get_max_segment_size'


vim +220 block/blk-merge.c

d0e5fbb01a67e4 Ming Lei          2016-01-23  208  
95465318849f75 Bart Van Assche   2022-10-25  209  /**
95465318849f75 Bart Van Assche   2022-10-25  210   * get_max_segment_size() - maximum number of bytes to add as a single segment
95465318849f75 Bart Van Assche   2022-10-25  211   * @lim: Request queue limits.
09595e0c9d6547 Christoph Hellwig 2024-07-06  212   * @paddr: address of the range to add
09595e0c9d6547 Christoph Hellwig 2024-07-06  213   * @max_len: maximum length available to add at @paddr
95465318849f75 Bart Van Assche   2022-10-25  214   *
09595e0c9d6547 Christoph Hellwig 2024-07-06  215   * Returns the maximum number of bytes of the range starting at @paddr that can
09595e0c9d6547 Christoph Hellwig 2024-07-06  216   * be added to a single segment.
95465318849f75 Bart Van Assche   2022-10-25  217   */
aa261f20589d89 Bart Van Assche   2022-10-25  218  static inline unsigned get_max_segment_size(const struct queue_limits *lim,
09595e0c9d6547 Christoph Hellwig 2024-07-06  219  		phys_addr_t paddr, unsigned int len)
dcebd755926b0f Ming Lei          2019-02-15 @220  {
4a2f704eb2d831 Ming Lei          2020-01-11  221  	/*
95465318849f75 Bart Van Assche   2022-10-25  222  	 * Prevent an overflow if mask = ULONG_MAX and offset = 0 by adding 1
95465318849f75 Bart Van Assche   2022-10-25  223  	 * after having calculated the minimum.
4a2f704eb2d831 Ming Lei          2020-01-11  224  	 */
09595e0c9d6547 Christoph Hellwig 2024-07-06  225  	return min_t(unsigned long, len,
09595e0c9d6547 Christoph Hellwig 2024-07-06  226  		min(lim->seg_boundary_mask - (lim->seg_boundary_mask & paddr),
09595e0c9d6547 Christoph Hellwig 2024-07-06  227  		    (unsigned long)lim->max_segment_size - 1) + 1);
dcebd755926b0f Ming Lei          2019-02-15  228  }
dcebd755926b0f Ming Lei          2019-02-15  229  

:::::: The code at line 220 was first introduced by commit
:::::: dcebd755926b0f39dd1e3ef75bd3b46943400df0 block: use bio_for_each_bvec() to compute multi-page bvec count

:::::: TO: Ming Lei <ming.lei@redhat.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

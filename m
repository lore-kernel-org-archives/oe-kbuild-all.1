Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D38231A23
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 May 2026 19:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780257369; cv=none; b=Q56CrsHybgkfPpmsATHPBXcMQA+kPS8L1A25BsfPvrjv+/KycYKOOtNm6vmcWoOGXMC/LjMBJbylnJZV/Z8fjTHWfKbTfmuEGSEBa4hLnmIchD0wxXVD4SGD3QsQ4xkpt0Jp2baGF4PtBQs7v9zsseCNFHoHzTo529+8FeWHLqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780257369; c=relaxed/simple;
	bh=Dp9+P/hEbPbBgKJsNkE5h0vI03Nxytgj452lI5kdvKg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JU6CNSCS/XGc4JVRPgN2KcoGv0iYRFtu1j0CpZUHDIWt9rDDdgmTwCW0mvlFhVGpt0MUYYp5lgN34fUz1zU4Yt5aNuqKBoHDCIsvuYuVFPRwSyuu1V5ZD0e+t5lsOwkCqDFq8K++PwoGE8DfkhZXCMWmP5xkvzdP7Kdr2TnJTJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iEVMLDeL; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iEVMLDeL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780257368; x=1811793368;
  h=date:from:to:cc:subject:message-id;
  bh=Dp9+P/hEbPbBgKJsNkE5h0vI03Nxytgj452lI5kdvKg=;
  b=iEVMLDeLlUjhMRIAEvxsUBzk21RQrQFzJxDTIgcuRaZ0HylyKdEUVyx9
   lc9sLsjvXb/c/zidrDDT7tTYEtdjAtx7FoRwkDHD4SxEmCu/QO6xNa2Rs
   OOxw/YvqQycySYvDjKYfpgSD2xgDCxvOOjQDgr82avF1iGH6t/uglcFV/
   ifd2Yq5VZdFpjzj/Pf7BcdNCWWf9/DufKkAKX94p5EAZm/8PaWXeICmzR
   VgdZqfWXBLuEb3+VSUC9Ub26TUwtXmd4R0frE16eCsHVDbTfCoCUh9tCB
   V193jaTsNy2DjXR2TRpN8BdYit7LpFx+mJZmaxXRIP0aeEQQV7yXYOMhp
   A==;
X-CSE-ConnectionGUID: qBYEXG8cQSWVqb0AD8VyzA==
X-CSE-MsgGUID: BHnyX1quTK+1t+teWa0wwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="84911422"
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="84911422"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 12:56:07 -0700
X-CSE-ConnectionGUID: hG2y3WqWRbyj88yJiWdpjA==
X-CSE-MsgGUID: p2bQbMPKRtu2Kt4W/z2FJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="243502891"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 31 May 2026 12:56:06 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTmGR-000000009hO-2MDg;
	Sun, 31 May 2026 19:56:03 +0000
Date: Mon, 01 Jun 2026 03:55:51 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:block-error-injection 3/7]
 block/blk-core.c:545:45: error: 'BD_MAKE_IT_FAIL' undeclared
Message-ID: <202606010341.ZynlUP5R-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git block-error-injection
head:   f7d922716d709e96c39fc2a0ebc67eac84deb06d
commit: 31905bce1e3e0c7d6b853dc916a0f64fdec2673e [3/7] block: refactor should_fail_bio and should_fail_request
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260601/202606010341.ZynlUP5R-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260601/202606010341.ZynlUP5R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606010341.ZynlUP5R-lkp@intel.com/

All errors (new ones prefixed by >>):

   block/blk-core.c: In function 'may_fail_bio':
>> block/blk-core.c:545:45: error: 'BD_MAKE_IT_FAIL' undeclared (first use in this function)
     545 |         return bdev_test_flag(bio->bi_bdev, BD_MAKE_IT_FAIL) ||
         |                                             ^~~~~~~~~~~~~~~
   block/blk-core.c:545:45: note: each undeclared identifier is reported only once for each function it appears in


vim +/BD_MAKE_IT_FAIL +545 block/blk-core.c

   540	
   541	static inline bool may_fail_bio(struct bio *bio)
   542	{
   543		if (!IS_ENABLED(CONFIG_FAIL_MAKE_REQUEST))
   544			return false;
 > 545		return bdev_test_flag(bio->bi_bdev, BD_MAKE_IT_FAIL) ||
   546			(bio_flagged(bio, BIO_REMAPPED) &&
   547			 bdev_test_flag(bdev_whole(bio->bi_bdev), BD_MAKE_IT_FAIL));
   548	}
   549	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

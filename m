Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4F823AD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 16:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731861115; cv=none; b=rzmC1c173kCPy9ehGGQNKDJnh4TSj8wwZXB2zwPHJoEo0jNrTFTfyeU7hFH39yJFtNzlxWOZbySgh/L1LFpegZXVlJOS8rNGAx0y6hxh+C0llb0GIe+evF05fhdpMcTgma+K+PcfPyqo3fNVPPMZjXN0oCFR9bUaeyKF9YMHcpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731861115; c=relaxed/simple;
	bh=maGswvMzBuR76Xs5HKbPN41c3nXbTWBvERIIMgiGTd4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B+juhYSvGgzq1Y3LwXQoy0LgMASUKaUfGzPj8KI8+4i01UcwZaCJaLGGnOczibjyCk+vC8A25oefKbK0fZjkFWgFBuyqaV5XttUz1kun3OgbhvJIPpA7tUx0zZVPa+QpteMyZ52RO3ejQ/5MyRfZxm7ZeHBNAmdcj2Qa1sH05Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TvycShZV; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TvycShZV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731861113; x=1763397113;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=maGswvMzBuR76Xs5HKbPN41c3nXbTWBvERIIMgiGTd4=;
  b=TvycShZV0jV2quPUBKbooqENHkLS7LwIR5d9fU/GXpRN4O7FECzc3bD4
   hGR8CJJ9TPz2ems/bN0KwBuPv25XY+uHymGjS7KZ+SkNFTHgggKnEnQp8
   mAXy0VQJROMJkXpNTvQUz3M1G5VbZsmPVLzusf1sLVSaM7+jhyPSrpz8W
   YlQ2Rc5UhV0yNmy574+6YE5DojgBJ1+w7oaiJA3vobGAlnWaJW7NJltoE
   iQq5yo4Sa7dwZANDMe3pwi3ye+dfpX9PTE+lZNX3fAZDt3JdRnKHgffPO
   AfjQboqPmbcO/4O/3m4ZQGwNHNPZTw/O9t+SBbV+SPYep+7g5IvM29O1R
   g==;
X-CSE-ConnectionGUID: fIi5mOOjSt2p65OIt/xflg==
X-CSE-MsgGUID: 168LgIlkQlqdiBQAXwGBNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="35490209"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="35490209"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 08:31:53 -0800
X-CSE-ConnectionGUID: uShlhFmaSeOkpq/fjBEi3Q==
X-CSE-MsgGUID: l5g0oSHSTrqfe4HzrTRBgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="119862106"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Nov 2024 08:31:52 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCiBh-0001uo-1w;
	Sun, 17 Nov 2024 16:31:49 +0000
Date: Mon, 18 Nov 2024 00:30:53 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 65/75] fs/xfs/xfs_zone_alloc.c:26:5-24: WARNING:
 atomic_dec_and_test variation before object free at line 28.
Message-ID: <202411180059.YGgisY26-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christoph,

First bad commit (maybe != root cause):

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   2259694a0da179e06201614e2e37cd0f3c8669b3
commit: e6b0267b322be73622992a9f99fc8e5c21a3ab3f [65/75] xfs: lockdep_assert_held takes a pointer to the lock
config: x86_64-randconfig-103-20241117 (https://download.01.org/0day-ci/archive/20241118/202411180059.YGgisY26-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411180059.YGgisY26-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_zone_alloc.c:26:5-24: WARNING: atomic_dec_and_test variation before object free at line 28.

vim +26 fs/xfs/xfs_zone_alloc.c

1b9104b51569dbc Christoph Hellwig 2024-11-05  21  
2f5de4ae28a5883 Christoph Hellwig 2024-11-09  22  void
2f5de4ae28a5883 Christoph Hellwig 2024-11-09  23  xfs_open_zone_put(
2f5de4ae28a5883 Christoph Hellwig 2024-11-09  24  	struct xfs_open_zone	*oz)
2f5de4ae28a5883 Christoph Hellwig 2024-11-09  25  {
2f5de4ae28a5883 Christoph Hellwig 2024-11-09 @26  	if (atomic_dec_and_test(&oz->oz_ref)) {
2f5de4ae28a5883 Christoph Hellwig 2024-11-09  27  		xfs_rtgroup_rele(oz->oz_rtg);
2f5de4ae28a5883 Christoph Hellwig 2024-11-09 @28  		kfree(oz);
2f5de4ae28a5883 Christoph Hellwig 2024-11-09  29  	}
2f5de4ae28a5883 Christoph Hellwig 2024-11-09  30  }
2f5de4ae28a5883 Christoph Hellwig 2024-11-09  31  

:::::: The code at line 26 was first introduced by commit
:::::: 2f5de4ae28a5883ab65a767f5b0f1c7cc85bc0eb xfs: add a separate data structure for open zones

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Christoph Hellwig <hch@lst.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

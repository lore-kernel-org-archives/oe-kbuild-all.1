Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEA33CF74
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jan 2024 12:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705927376; cv=none; b=IhqxWj+uCKWE+OzQ9PjNdbMYhNYLDQjmrRFT35BQpq2nnblI2ieT5HlVEs3dOxLMqpJWuu/HwrJVVt5N3E6F/Tm/2yShSYUyXRNFt6lSGmBdtPYyNVCiDonD5gPMhvYFNwVFCxRSWM7uP7TM7AdibdwJXmGQv4YHdonkDJ/xzHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705927376; c=relaxed/simple;
	bh=ot3YyAkz3bTmmYH4RYmWROQM73zAfDudc6+z4LoxS/M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uBJaytmwFpkWFiko3uSYguyT1SpdTodgiFeV5o12d912wWXerpLtReDW6eZ23AibYkhTFTch3cyE+jMEhjQ8yEH9CHIN+SJOaBOM6dsBFgk58ZmtE/d4/CUfSjCjqGFIm+CQxYEQ9HZ/fYeFX6F9uXr7KsX2RNFbSV9q966E3K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BxbWgS7i; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BxbWgS7i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705927375; x=1737463375;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ot3YyAkz3bTmmYH4RYmWROQM73zAfDudc6+z4LoxS/M=;
  b=BxbWgS7iJ9FNyoEUWM/mZwDocj75CmPMpJxONVw66FWUOcBBSzVmE7Xf
   ahvReXeIqYRWNbbl+MvJ1G54hsPFT2ds7AQc4pZ5IncJyhFvIi4smAMNM
   Vu2iBqn0FISWPKjoyowlKwwuGADyMAEwUd9sSeEru4tghUP6deeQWokHF
   /H3OvrIA4Z1xn+mqIyc/7mHUp931ITUBGgh9FlXqF1nk8X/YkCfa/3+Z1
   mKBOI4UKROeVe/NwEI7YAkzwi45MWOpgMMX28FdlyoY7WT60KSe9N1wot
   eK0B3qj4jECYDjd6MxBED96D1RAaR9KfpGO1HWhiqF3ekyk1T5ZYW8boo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="7946292"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="7946292"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 04:42:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="875972098"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="875972098"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Jan 2024 04:42:53 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRtdb-0006c4-0O;
	Mon, 22 Jan 2024 12:42:51 +0000
Date: Mon, 22 Jan 2024 20:42:40 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 73/73] fs/xfs/xfs_zone_alloc.c:547:1: warning: no
 previous prototype for function 'xfs_zoned_move_reservation_head'
Message-ID: <202401222033.NU8URx07-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   fe993d9ce4b06f9f36486f58cc478779e7d24ea5
commit: fe993d9ce4b06f9f36486f58cc478779e7d24ea5 [73/73] xfs: add proactive gc and write throtteling
config: i386-buildonly-randconfig-001-20240122 (https://download.01.org/0day-ci/archive/20240122/202401222033.NU8URx07-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240122/202401222033.NU8URx07-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401222033.NU8URx07-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/xfs_zone_alloc.c:547:1: warning: no previous prototype for function 'xfs_zoned_move_reservation_head' [-Wmissing-prototypes]
     547 | xfs_zoned_move_reservation_head(
         | ^
   fs/xfs/xfs_zone_alloc.c:546:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     546 | void
         | ^
         | static 
   1 warning generated.


vim +/xfs_zoned_move_reservation_head +547 fs/xfs/xfs_zone_alloc.c

   545	
   546	void
 > 547	xfs_zoned_move_reservation_head(
   548		struct xfs_mount		*mp,
   549		size_t				count)
   550	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

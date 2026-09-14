Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831651DED49
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Sep 2026 02:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354557; cv=none; b=mW3LihjvAAnsjJ73VZiNnt03E0k5CjRJybnu1i2jULc0Ua5rvRVJP1qIk1nd7AZZMwRfy1idZS43BAJu1G6yqtI1Kjv0apnXZuCRTcxWMdNhyILW7BmicBM6gfWG4Aow2rMwHvR04USEv82LAQAuD3sBW6Q7Vj5ZHMwzTL2cfcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354557; c=relaxed/simple;
	bh=4ZZBGw5l2MlK2rReKeP6LsK8KRezD1wrcB1fbo/ejGY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BTT3NJkNDLqlDxvlNQT+Sc7C9+ptVF2sSL29Ox9AEfaoO57RHZoC/43PY4TVENNbrL18qMg5f6rI87KVlwUl34qH/MCjkzCle60GNKYyr/4Ca+Ow/uVAcNvm/qcQPLxBraLJhtPHQ4OO3Bv010/KLSO4ev1RNIR9KOHj6PTNE8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UZydSGc5; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UZydSGc5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789354556; x=1820890556;
  h=date:from:to:cc:subject:message-id;
  bh=4ZZBGw5l2MlK2rReKeP6LsK8KRezD1wrcB1fbo/ejGY=;
  b=UZydSGc5+UebKewditR3lgpIrUlbUPGEpmaogSPuFOpk7UQSIoXiJ9+Z
   SCr9oSEYN0IBamI1EfbrRGWQsufUWTB1G5y54GlpeClygK5cKllijK0lf
   /10UlQ8mm1RuX8Qq1w1Bc9Jqy0lnrKoPM6enfYVC8MIOW/TAjzLBITvM0
   3CWrRCUZDbc+rVaNcEHpGVRlLupbQZ3NMFxVsve4M6UfEfMJZ2mWmGtBU
   5SeGz+nuC3oD+tdQUA6MQ/ucnaMGcomjg8bZDPbLSySHSUrvQYH4xu6Ka
   iw7FjFNls5kZrTcG9vxnc6EF3e8e1W8jKUbD+0BdQru5N75ARSZcnaGaQ
   w==;
X-CSE-ConnectionGUID: ArRHul4cRfqlghiKiNRFgg==
X-CSE-MsgGUID: 8lndUa1ySm6+Dh8GPrXgUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="100037147"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="100037147"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 19:55:55 -0700
X-CSE-ConnectionGUID: tknGrnD5SK6uUam0g0rBhg==
X-CSE-MsgGUID: zAMquNGYSqalbiDdRFp8dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="310792536"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Sep 2026 19:55:54 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5wrH-000000002QB-02wm;
	Mon, 14 Sep 2026 02:55:51 +0000
Date: Mon, 14 Sep 2026 10:55:20 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-crc 20/30] xfs_rtcsum.c:undefined reference to
 `__divmoddi4'
Message-ID: <202609141027.c3e2a7MR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/xfs xfs-crc
head:   13c4aa2fcb1f62fdf47e7abe90741e89f682761e
commit: 4acc7ae85924f4d389a953ea0992c9e3b8735f0e [20/30] xfs: core RT data checksum support
config: i386-buildonly-randconfig-002-20260914 (https://download.01.org/0day-ci/archive/20260914/202609141027.c3e2a7MR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260914/202609141027.c3e2a7MR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609141027.c3e2a7MR-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/xfs/libxfs/xfs_rtcsumfile.o: in function `xfs_rtcsum_bmap':
   xfs_rtcsumfile.c:(.text+0x7b): undefined reference to `__divdi3'
   ld: fs/xfs/libxfs/xfs_rtcsumfile.o: in function `xfs_rtcsum_file_size':
   xfs_rtcsumfile.c:(.text+0x21f): undefined reference to `__udivdi3'
   ld: fs/xfs/xfs_rtcsum.o: in function `xfs_rtcsum_log_one':
>> xfs_rtcsum.c:(.text+0x84): undefined reference to `__divmoddi4'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

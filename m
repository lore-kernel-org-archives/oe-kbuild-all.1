Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1232CDDD3
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Jan 2025 20:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736107527; cv=none; b=E16HgrblTqxWiVxYcQMI9SqT9QkrrGIEHM9WQhfZ7H2jhK1t1Ocw45e+nj4nVlKiF6x8utjTX0Ldev3fRuHk36fUyQDZ1+kTs1Db840ENu06qBRQkn0jEZhCPCw18DW+MTckPYZIP4kpCEZPgb+a+brel74bd+or7T46uetSZt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736107527; c=relaxed/simple;
	bh=dM629ExilA9/yz3nDjq+dTeDHc2G4KV1uYfpuGnhFIo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UCkJtRZXkaFDHY/s7T7RIdCt+K+sCuJnktPMKdLKfzzZTVigTuB+gXTa47U0jwZ3/0Qavsa0IeTnfgQxEx0tN5ZmejRBQCqceqW57aj21erDAC/eOf5WF6HZZT98OiqMV9LFPcBXe0oHtknwGvaJt8QtcmpXZAbpnIz5Ra0VJFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ko6THBYl; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ko6THBYl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736107526; x=1767643526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dM629ExilA9/yz3nDjq+dTeDHc2G4KV1uYfpuGnhFIo=;
  b=ko6THBYllRpTUuXTWVg5imYCxPfM3kDk9sz/fhKun7rW7rWe1gVEX/KW
   PQbsbJe+XD5aKujEltDBj/yLCF4akAMhtejT7tUfjrtYoAWoHwAtm91gf
   +zd9JJYRtc8IQpFqzoxgX8knEAmDLf7ztSdErfKM+rjjYFyOl/TlsyyIg
   ZKLbFMSykaBLHUieClEnFQlJd1fEODT25TPTf5hCw6bnwQ7HzVfE+YtlL
   PPuTWUcAmm0L/rYE7lfPkeWE8kaudRiGbChrlUw11QzsBQ/2gcYCx4ZJ3
   ESxJr7VMNQIrRZAiv0Bsm2gdoJonv2FFZhA6af2vTfZNix3fWtzg7W4Qw
   Q==;
X-CSE-ConnectionGUID: xAo5wvVsRUOOLmJHu2FNjg==
X-CSE-MsgGUID: WOlS9THYS5+1zJroOcJGtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="40196166"
X-IronPort-AV: E=Sophos;i="6.12,291,1728975600"; 
   d="scan'208";a="40196166"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 12:05:25 -0800
X-CSE-ConnectionGUID: DUfSVeUgSzu189ulj4Jegw==
X-CSE-MsgGUID: nOW/ldNhT5G826Jd89/8nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,291,1728975600"; 
   d="scan'208";a="133101349"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Jan 2025 12:05:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUWsD-000By2-2r;
	Sun, 05 Jan 2025 20:05:21 +0000
Date: Mon, 6 Jan 2025 04:05:15 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: drivers/rtc/rtc-pl031.c:85: warning: Function parameter or struct
 member 'range_min' not described in 'pl031_vendor_data'
Message-ID: <202501060322.FAnXQ5Qy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ab75170520d4964f3acf8bb1f91d34cbc650688e
commit: 03f2a0e45f395bc34b0a44105bc7e935bfd40c27 rtc: pl031: set range
date:   4 years, 10 months ago
config: arm-randconfig-r013-20220706 (https://download.01.org/0day-ci/archive/20250106/202501060322.FAnXQ5Qy-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501060322.FAnXQ5Qy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501060322.FAnXQ5Qy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rtc/rtc-pl031.c:85: warning: Function parameter or struct member 'range_min' not described in 'pl031_vendor_data'
>> drivers/rtc/rtc-pl031.c:85: warning: Function parameter or struct member 'range_max' not described in 'pl031_vendor_data'


vim +85 drivers/rtc/rtc-pl031.c

8ae6e163c1b637 Deepak Saxena     2006-06-25  68  
aff05ed5d10352 Linus Walleij     2012-07-30  69  /**
aff05ed5d10352 Linus Walleij     2012-07-30  70   * struct pl031_vendor_data - per-vendor variations
aff05ed5d10352 Linus Walleij     2012-07-30  71   * @ops: the vendor-specific operations used on this silicon version
1bb457fc9268bb Linus Walleij     2012-07-30  72   * @clockwatch: if this is an ST Microelectronics silicon version with a
1bb457fc9268bb Linus Walleij     2012-07-30  73   *	clockwatch function
1bb457fc9268bb Linus Walleij     2012-07-30  74   * @st_weekday: if this is an ST Microelectronics silicon version that need
1bb457fc9268bb Linus Walleij     2012-07-30  75   *	the weekday fix
559a6fc0508392 Mattias Wallin    2012-07-30  76   * @irqflags: special IRQ flags per variant
aff05ed5d10352 Linus Walleij     2012-07-30  77   */
aff05ed5d10352 Linus Walleij     2012-07-30  78  struct pl031_vendor_data {
aff05ed5d10352 Linus Walleij     2012-07-30  79  	struct rtc_class_ops ops;
1bb457fc9268bb Linus Walleij     2012-07-30  80  	bool clockwatch;
1bb457fc9268bb Linus Walleij     2012-07-30  81  	bool st_weekday;
559a6fc0508392 Mattias Wallin    2012-07-30  82  	unsigned long irqflags;
03f2a0e45f395b Alexandre Belloni 2020-03-06  83  	time64_t range_min;
03f2a0e45f395b Alexandre Belloni 2020-03-06  84  	timeu64_t range_max;
aff05ed5d10352 Linus Walleij     2012-07-30 @85  };
aff05ed5d10352 Linus Walleij     2012-07-30  86  

:::::: The code at line 85 was first introduced by commit
:::::: aff05ed5d103524bd69bd9d7b621c5c8a6c63198 rtc: pl031: encapsulate per-vendor ops

:::::: TO: Linus Walleij <linus.walleij@linaro.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

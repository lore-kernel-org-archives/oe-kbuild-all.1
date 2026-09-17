Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A61B566C6A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Sep 2026 14:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789654263; cv=none; b=sMi74mykEBHrJgnRIYNgbfOy1CINAzGTNJlH8r+lM+1x4kFOmqxxPi3Hb3mCP0ewK6vhWLdYuJshsoQ/Gwgno/kmh1bOdrZ9Cuog8DHXb+G82RymxS81TFgG4NgehBnxHHdCyLIl5KOQ1HNkmf8nKt6EKicZd1+4LnRAsuLr9sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789654263; c=relaxed/simple;
	bh=ksFk40hMO/xHDvbjHJ5DZExzOMuMx+wCDHHf4a1HvMQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dp+6KDsS1+F8j6qdQPyThQXYUSB/0KzjqM+pc9jYYblV4KHeYci7QoCxlsBo4Z69/DAIwaTgcSUmqqM7hD8QkbMT/DYvf9cfJzirUOZfrEqkn53EumaLtkV7BFsfJ8toO0WhhE7VVlSuIYkNaDxiOjk50hYhSmrPINsqC0OeubA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HV+rv8x7; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HV+rv8x7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789654259; x=1821190259;
  h=date:from:to:cc:subject:message-id;
  bh=ksFk40hMO/xHDvbjHJ5DZExzOMuMx+wCDHHf4a1HvMQ=;
  b=HV+rv8x78EY7zZoXLp1Nle8oPWDkHrL9CfhlILzpfyz42zmz+cFN198h
   4uYOn2+ZITrxvPlB2AOAKMnfWE/hsLovbMDzs9ujL6IbXvUWdq3Bf1rkL
   phozdkunGMqHJLq4lCBT09d4Xo+FF0dUj/OfghF3HyRddGZMejEjqP0d7
   LUGis5D5ylBMhTJISGxjq7DKA1I3S2KalD2aYyRq3CexpNPRGVC6AQUTt
   QFIenjI466mSEg8dENiprJG/1Jsl2fJhxuibzGzCOSV5j/qlJMwhOOmRC
   KEClUoHnKHnPa7ZZLosiGac6pk/QvqBHBaN3zB6oTWZhTfdrRq9nr0TH6
   Q==;
X-CSE-ConnectionGUID: NN7KRmxXQmaBnC/wV9hXwg==
X-CSE-MsgGUID: mFzL60AbQtiHthuzFW3D6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="587489"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="587489"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 07:10:57 -0700
X-CSE-ConnectionGUID: KKsQO6/VTHGnJfdkdjdhnA==
X-CSE-MsgGUID: xlurtVsxS4qqa1TkEoXrtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271169048"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Sep 2026 07:10:55 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7CpB-000000007xB-0Lpr;
	Thu, 17 Sep 2026 14:10:53 +0000
Date: Thu, 17 Sep 2026 22:10:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 9/9] fs/f2fs/segment.c:1889:
 warning: Function parameter or struct member 'need_check' not described in
 'f2fs_issue_discard_timeout'
Message-ID: <202609172133.loxbXXqF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Chao,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   09f57006a67d7344ac94f30b5356ab6e990640c1
commit: fafade22860a53255061eb537f1ca3b3469d18d9 [9/9] f2fs: fix to do sanity check on dcc->discard_cmd_cnt conditionally
config: arm-randconfig-1000-20260917 (https://download.01.org/0day-ci/archive/20260917/202609172133.loxbXXqF-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260917/202609172133.loxbXXqF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609172133.loxbXXqF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/segment.c:1889: warning: Function parameter or struct member 'need_check' not described in 'f2fs_issue_discard_timeout'


vim +1889 fs/f2fs/segment.c

d431413f003199 Chao Yu     2017-04-05  1879  
b1c5ef26e4e802 Yangtao Li  2023-01-13  1880  /**
b1c5ef26e4e802 Yangtao Li  2023-01-13  1881   * f2fs_issue_discard_timeout() - Issue all discard cmd within UMOUNT_DISCARD_TIMEOUT
b1c5ef26e4e802 Yangtao Li  2023-01-13  1882   * @sbi: the f2fs_sb_info data for discard cmd to issue
b1c5ef26e4e802 Yangtao Li  2023-01-13  1883   *
b1c5ef26e4e802 Yangtao Li  2023-01-13  1884   * When UMOUNT_DISCARD_TIMEOUT is exceeded, all remaining discard commands will be dropped
b1c5ef26e4e802 Yangtao Li  2023-01-13  1885   *
b1c5ef26e4e802 Yangtao Li  2023-01-13  1886   * Return true if issued all discard cmd or no discard cmd need issue, otherwise return false.
b1c5ef26e4e802 Yangtao Li  2023-01-13  1887   */
fafade22860a53 Chao Yu     2026-04-25  1888  bool f2fs_issue_discard_timeout(struct f2fs_sb_info *sbi, bool need_check)
969d1b180d987c Chao Yu     2017-08-07 @1889  {
969d1b180d987c Chao Yu     2017-08-07  1890  	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
78997b569f5625 Chao Yu     2017-10-04  1891  	struct discard_policy dpolicy;
cf5c759f927dc9 Chao Yu     2017-10-04  1892  	bool dropped;
969d1b180d987c Chao Yu     2017-08-07  1893  
25547439f1dcc3 Yangtao Li  2022-12-02  1894  	if (!atomic_read(&dcc->discard_cmd_cnt))
b1c5ef26e4e802 Yangtao Li  2023-01-13  1895  		return true;
25547439f1dcc3 Yangtao Li  2022-12-02  1896  
8bb4f2535cf7c3 Jaegeuk Kim 2018-05-29  1897  	__init_discard_policy(sbi, &dpolicy, DPOLICY_UMOUNT,
8bb4f2535cf7c3 Jaegeuk Kim 2018-05-29  1898  					dcc->discard_granularity);
78997b569f5625 Chao Yu     2017-10-04  1899  	__issue_discard_cmd(sbi, &dpolicy);
cf5c759f927dc9 Chao Yu     2017-10-04  1900  	dropped = __drop_discard_cmd(sbi);
cf5c759f927dc9 Chao Yu     2017-10-04  1901  
9a997188ff7ab2 Jaegeuk Kim 2018-05-24  1902  	/* just to make sure there is no pending discard commands */
9a997188ff7ab2 Jaegeuk Kim 2018-05-24  1903  	__wait_all_discard_cmd(sbi, NULL);
2482c4325dfe03 Chao Yu     2018-07-08  1904  
fafade22860a53 Chao Yu     2026-04-25  1905  	f2fs_bug_on(sbi, need_check && atomic_read(&dcc->discard_cmd_cnt));
b1c5ef26e4e802 Yangtao Li  2023-01-13  1906  	return !dropped;
969d1b180d987c Chao Yu     2017-08-07  1907  }
969d1b180d987c Chao Yu     2017-08-07  1908  

:::::: The code at line 1889 was first introduced by commit
:::::: 969d1b180d987c2be02de890d0fff0f66a0e80de f2fs: introduce discard_granularity sysfs entry

:::::: TO: Chao Yu <yuchao0@huawei.com>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3112A1CF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 May 2026 03:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779850931; cv=none; b=ACdfJgmAdlWPVFfCcyd2L6IqX5Nns21p5Ii2efQU8lhtD/YftwOq5KwBoKXIFf5cUO88wdUkFEEG6rdBYaebPiAEUSgdJ7dubnihdH1If2srwHkHV+PYGakrkNzMqqQPxB+ijMk8lcvUG/yrsUlF65YbbRameEqwL/3TYC4+gC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779850931; c=relaxed/simple;
	bh=FmiZBi5qWfpWLROh9zeyG5z2ac4xDJMTxkaV5LRnpy4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QCY24pGiPaCzZPKvtaihjYN+3oOPHE2li6XKd1XEdVJrNy7j7f29gs4KCrZPOxDdUki/4TzvPh+j9DEv6Dy23FkkQSbFzMBjRxHedQvvw+HZTehKT/gbxjpduLg5VnHagqBFSuT5Bc/HGoQP+ul/diWPfAJ+ZyEMrqhaKDQ+Ybg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jUomFGyI; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jUomFGyI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779850930; x=1811386930;
  h=date:from:to:cc:subject:message-id;
  bh=FmiZBi5qWfpWLROh9zeyG5z2ac4xDJMTxkaV5LRnpy4=;
  b=jUomFGyIycFshQsncyal3eXtKNDu6aCz1mNmDXpk4DYcHR0MMq/v6NMt
   FbB/NAVFBx5Qr4oA8u7Uozlwj6U1TK8Rl4Kg0RP/lkr5gmBABGGRWkT/C
   urdBqf8HNJECLPh3A882QsPqaJyjwe0eVtvTKZ3OnAiQoOcbNNY77nBvO
   he7r6Vq8707m5aTNdS9ee0vjp3SZYydAgYtXeMUekZxqu/2avGcu/6fjo
   Y6MwTWYG2gxKq2z/UAIZlblEnZoHHMtk7yV2wc7ZndIv27HtNN7AfXCMb
   MN4e8Ewmf2aiE4YHA0FTQwZURq4qM5C/2gSA6/tsZ5Ym6buOKnTzpVoZL
   Q==;
X-CSE-ConnectionGUID: c9BXwLRvToKZbr+W0sqxFw==
X-CSE-MsgGUID: AjN7QjizTn+xa49TeoQ9Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="84300060"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="84300060"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 20:02:10 -0700
X-CSE-ConnectionGUID: DaR8ZKaOSY6dxrkTR0p3kw==
X-CSE-MsgGUID: 2eK8t+OqRT2qKg8l/gHUOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="242171347"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 26 May 2026 20:02:08 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wS4Wz-000000003IA-244L;
	Wed, 27 May 2026 03:02:05 +0000
Date: Wed, 27 May 2026 11:01:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 2/2]
 fs/f2fs/segment.c:1889: warning: Function parameter or struct member
 'need_check' not described in 'f2fs_issue_discard_timeout'
Message-ID: <202605271016.qKIriDQr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   7d38f5b0e4b0d06970e261174e220a997a0908e7
commit: fafade22860a53255061eb537f1ca3b3469d18d9 [2/2] f2fs: fix to do sanity check on dcc->discard_cmd_cnt conditionally
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260527/202605271016.qKIriDQr-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260527/202605271016.qKIriDQr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605271016.qKIriDQr-lkp@intel.com/

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

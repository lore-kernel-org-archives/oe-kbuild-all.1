Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A533B1BC5C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 04:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727409957; cv=none; b=PP7bAXW4vZcAwpj1i/7eHrbV7sZJNx8CALfbubebszoajkZvhax40yB8lN0SUX/pZ2l4WuFGXayeIMOo7Vj3S61FwibWL4ax3FKCAtT0x2//NWJyOAD0jAr3lumO5k+aYTFsXI66foBbscgMmyfIrl6A+/ZRjtcDYQXNvHxbIfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727409957; c=relaxed/simple;
	bh=HKB4dEupyWBKTHPz++3ta6i2Gjtzpb8XZyiHiIwRPfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rd3b4TAkF1vx5M0YMZOwaM23golSWzSY5YJC+tgwiKFEXnE6UEXPpdZroLeBPp0iDxwD5zU51XETOp16n4lt4bnndwSCiyjtEmktlzDYJCEXxOW2yRL/3upHRV5wUd6DyEKpskkfT1fiY6ie6B0cDjc1ylQp7Y/PkZKutT2spoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QjYeubQL; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QjYeubQL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727409956; x=1758945956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HKB4dEupyWBKTHPz++3ta6i2Gjtzpb8XZyiHiIwRPfQ=;
  b=QjYeubQL1Lj3W+9/HNOlW+WiZezDocnpZjP7Gj+wHfRAYvR1MBTJG5N+
   xAavFwIG60tcDw8xJ9OS73Y159rC4Hk9Zeqr2Ltj/822NuANo87nTEF2a
   W9PmM5HM1tw7kfcm4ISr2gPzJ48WdRvaUvuwwB1KsnOoi30N3hwD590xq
   DNthV8cBmClXB6VaTT5ZlTDYg6hzav3Rc+C8l67TQM4ow53DOrLWuD6N3
   46NJheXxejErDesPGjB7jpXZWkHEDnVDYdb9RsafMHzgLHRTWxyV+xffo
   3QPLC/TPNbB6ToFyy+A/PsVbF8d1NzUa5cTzQ3ysD1AGvtDuczjCS+5Ax
   w==;
X-CSE-ConnectionGUID: TO2Ei7gdQaKwzlzdAsubXA==
X-CSE-MsgGUID: wMNRXwgTQ8WzWxVKwwUpIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26674458"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="26674458"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 21:05:56 -0700
X-CSE-ConnectionGUID: i/Q8i+YOTySp9clZwQOzOw==
X-CSE-MsgGUID: WL2SzfuBSsCh707fCUJ32Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="72287375"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Sep 2024 21:05:54 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su2Ep-000LRf-2Z;
	Fri, 27 Sep 2024 04:05:51 +0000
Date: Fri, 27 Sep 2024 12:05:28 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jian Zhang <zhangjian210@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 11316/30000] arch/arm64/mm/init.c:730:6: sparse:
 sparse: symbol 'ascend_enable_all_features' was not declared. Should it be
 static?
Message-ID: <202409271256.FaGlmrJY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   6be8d57e8dd89fb93f6a1801c246e70ae85fbfaf
commit: 66ae8ddda388386daea0623a65ea2ac85c24ca00 [11316/30000] ascend/arm64: Add ascend_enable_all kernel parameter
config: arm64-randconfig-r131-20240925 (https://download.01.org/0day-ci/archive/20240927/202409271256.FaGlmrJY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240927/202409271256.FaGlmrJY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409271256.FaGlmrJY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/mm/init.c:746:9: sparse: sparse: mixing declarations and code
>> arch/arm64/mm/init.c:730:6: sparse: sparse: symbol 'ascend_enable_all_features' was not declared. Should it be static?

vim +/ascend_enable_all_features +730 arch/arm64/mm/init.c

   729	
 > 730	void ascend_enable_all_features(void)
   731	{
   732		if (IS_ENABLED(CONFIG_ASCEND_DVPP_MMAP))
   733			enable_mmap_dvpp = 1;
   734	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

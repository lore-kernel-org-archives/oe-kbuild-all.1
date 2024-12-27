Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AA713C807
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 21:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735336012; cv=none; b=qGoIhjkgUl3Lp6KwPqxcj2y2vdgCHyuUN6Fs38VvmyoK+HhpuKupO6CcIJtk/Hb7IC5NOo3UyfY0X8nwGnMlUuM7dRBBvUyI5Hi4xnI5gkxNelWajxxzxzfc7U8wH5rjJrRJtfl8klQyeJsLTlvwwWn/D7iaq/6lPR3TsP76OA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735336012; c=relaxed/simple;
	bh=GCGf3fwOiTQBpyrhnRRPMbTLJIgaW+bccpWvm9SUX64=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nr39Y4RfAHwtqssxfKyaY1FvoKZgaUEa+tLg4LiXu0B7slvzMJphahLz+G1YbYDY8a4CWeQsTkZ6m/ikJ8pNzJitSH2fJUa6X+uVtHbYSawn/bZiGd3rOGsHEe7JNAElhQhdnZP7CFbv6W5dcMxYFQeHwfW63tQpUClGcDQTpl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HpudsJx5; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HpudsJx5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735336011; x=1766872011;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GCGf3fwOiTQBpyrhnRRPMbTLJIgaW+bccpWvm9SUX64=;
  b=HpudsJx5+nH3YpMTZtvaowCb64PtofitsDGpPMPr2RHfH/GQN42wX1jd
   b/g+c1uLrtzDuYN5FHbql7Z/hxspq+1fTjnzm/Nnw0vLAn3YwVhScvV61
   SVX/EYeD+XmnBWdiNc0H19jkBHHOtdzEGFxlPCBgm/k2sRSuOYLhmJnnN
   BU4OQAoR5V+w8GsXw3HzhwUO4TTFYKID7OoJ5R3JTmNG9LxADr03/nHgt
   B051CNsJji1jVna+IrY0tfpcqrKUqQM93gAJcgKQJaYp4H30rZIYQGx9M
   TkRFxpIuoS7M84Y4bCsDoEGD44IL7sUo0ZE2JnDEgNUgy6e5MkBKwN3UX
   w==;
X-CSE-ConnectionGUID: nwfSqaqAQ0SpZCfxTHjfYA==
X-CSE-MsgGUID: Hj5Fn5xIQQetnROCu0g6zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="58195462"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="58195462"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 13:46:50 -0800
X-CSE-ConnectionGUID: BZEts3Z1RkWVB21TdRTgvA==
X-CSE-MsgGUID: f6E0agmuTS2E37yIGWXlYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="137586620"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Dec 2024 13:46:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRIAP-0003eY-08;
	Fri, 27 Dec 2024 21:46:45 +0000
Date: Sat, 28 Dec 2024 05:46:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jian Zhang <zhangjian210@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2600/2600] arch/arm64/mm/init.c:730:6: sparse:
 sparse: symbol 'ascend_enable_all_features' was not declared. Should it be
 static?
Message-ID: <202412280553.3KEHilDu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   053a6b6f8e4c86200cdb20bc80c063c3bb119859
commit: 66ae8ddda388386daea0623a65ea2ac85c24ca00 [2600/2600] ascend/arm64: Add ascend_enable_all kernel parameter
config: arm64-randconfig-r133-20241227 (https://download.01.org/0day-ci/archive/20241228/202412280553.3KEHilDu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241228/202412280553.3KEHilDu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280553.3KEHilDu-lkp@intel.com/

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

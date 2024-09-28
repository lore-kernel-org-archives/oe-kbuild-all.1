Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C4D14D2B1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 11:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727523865; cv=none; b=Nf+wZFxokO64st+2KKCY/nqaiIFMU2lAvEDPY6p2Rpd8Qj7cI7oO4bKq6KA3EtS5Y2OK+ARCnvkIDZait8CTdmWp743VdNXZMd4G/3KujGcgvBgNICZIYFX5kG/PEQzB7zfxMPkDSykAkSy2tGIWFlfMR1FyDIo0uLVaDTuJqBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727523865; c=relaxed/simple;
	bh=Ht1wYZ7phHSpKmKOu2YZ0YhLRTaM+QCkjoP9V6w4AEA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YBzvymiJW7++7YXtxyY+YigNp0BOmTw+O/bEh2T3OseinzUJrawvxidtgMDWh6kNXXHQOG6Xr/N+v+DXTSbCwmlUBOd54C0lgDIAaDUz8/j3U4X4PXddrKQe4kAHN1mp4na2YVLKV3ULFZWfgk2eSiw97uA631acKTODT3te4JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BU3zc1P3; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BU3zc1P3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727523864; x=1759059864;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ht1wYZ7phHSpKmKOu2YZ0YhLRTaM+QCkjoP9V6w4AEA=;
  b=BU3zc1P3F7zDezcmS5QxNa6v25+oHNZC5bzOBZ5UDZr69pG2vJeuCaIA
   tXUD+8NDknxMHEzPrjepQ5U3VBklhbfthPFRy9TRE99mLRGr15pcoWbkU
   4tagCZ4OC4iOk/IzNolWoVBcF4q8N/uUBRykKw2AIXZtou+BPS3SaS+jl
   jvXJHo5FR93bbjwXNO65++G2O0qszyPBhxoIWLxBDa3+hMBgbp8pt2G5Y
   Cn31NrygmJJjvfmxS4U+AqhXY/Iy04h1ROTG7BrGgCuz3+cDGONK2C7HH
   13OVJJCF+gJT9Uq1HRx3xim20XNmdK28sChmhy5J/a4urzPWC0FRZi7Vi
   Q==;
X-CSE-ConnectionGUID: fDp3ueprRrWeQMH/M6hj+w==
X-CSE-MsgGUID: OUyWJDSTSPee79vipDmLng==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26759566"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26759566"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 04:44:15 -0700
X-CSE-ConnectionGUID: uhABDDnmQxWdG4sH53+s0Q==
X-CSE-MsgGUID: jiEAyAZiSUueS4G5SiBNBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="73093935"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Sep 2024 04:44:14 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suVrv-000NDz-0r;
	Sat, 28 Sep 2024 11:44:11 +0000
Date: Sat, 28 Sep 2024 19:43:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 19033/23799] mm/mem_reliable.c:41:22:
 warning: 'zero' defined but not used
Message-ID: <202409281933.6SgL6bDf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3841d75a6dcd12d108aaf56560b99431d18169e4
commit: 6943b93b464351cbc35aa002e86bac48e08b1c3f [19033/23799] mm: add support for limiting the usage of reliable memory in pagecache
config: arm64-randconfig-003-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281933.6SgL6bDf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281933.6SgL6bDf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281933.6SgL6bDf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/mem_reliable.c:42:22: warning: 'reliable_pagecache_max_bytes' defined but not used [-Wunused-variable]
      42 | static unsigned long reliable_pagecache_max_bytes = ULONG_MAX;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/mem_reliable.c:41:22: warning: 'zero' defined but not used [-Wunused-variable]
      41 | static unsigned long zero;
         |                      ^~~~


vim +/zero +41 mm/mem_reliable.c

    40	
  > 41	static unsigned long zero;
    42	static unsigned long reliable_pagecache_max_bytes = ULONG_MAX;
    43	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

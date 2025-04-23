Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573B026B96A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Apr 2025 20:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745441930; cv=none; b=ey7C83NlEVCfTYWOoBkgqjOzIo1buoDgYSZFUWjafoJfBWx6ZvgUZeFz42UDfKEz9b1gJnotHvJoYpeAmr4iVRLtE5iPX299GE71DzFq7yCnqPMu/6ghn4ESQRVo2oQgHOZby5ezX4TWaGB2At6rBhy48GDIv3OPW5k7XSeVB68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745441930; c=relaxed/simple;
	bh=CaPkhXPbL/GsGc3pdbP8in8TkOUiytuhg6fqLOQCKAw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sEs7WO+S5eWF+XbKH587z6AndqMP9GW0Kn5Ink08G1+4FifTYPOGoGjDtSPuRyzBzZuXwvApEh72BUfyTBtwq5mps8bCYiZ4AawfafEQVGbtwW42rveaBKyifuYp2DdmddJ1A9/t3q4o7EN8Q4OsI3aSrFzmo3KHvPGVxOBe5z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tsx58j6f; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tsx58j6f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745441928; x=1776977928;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CaPkhXPbL/GsGc3pdbP8in8TkOUiytuhg6fqLOQCKAw=;
  b=Tsx58j6f3DX4Q8yBd2eHZin7dAoL/tU6jSqUEq5DZPsJCWgXgzpE5/QP
   c5gTbcsD27NKm8wep5pNJJYeHBykk9xeM2Ilu7mIwuiVg7ulbzTa/sFWk
   HjIokikM3chMCwLainACOugkix5CQ2iksX+awMLBAhiFIXwTsZe1UaWnl
   j33Yia6aPhi3Ib1CVMeOoh7oJYsOujsl1CA+xdXQppO8FbS+BtlGVFNVb
   up8TJIhOaEMw3M0CpDvA1kUX0/GMQsO5DajtEolHju8FG9k3BaHSXFx6G
   USYEJU95kTj3Veg0YCcvyUIo9jlcrvuPgV5OZTixzE0bZqiAQFcvKmCfI
   g==;
X-CSE-ConnectionGUID: uMAXzAV4Q+y8EcMR1ug4WA==
X-CSE-MsgGUID: 4R+ydacSRl6bYaOc8SZ9zA==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="57704242"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="57704242"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 13:58:48 -0700
X-CSE-ConnectionGUID: 34feCUI0TCWXjYfZBKuEkg==
X-CSE-MsgGUID: pkmKtUj+T0WqI5snpGhKNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="133310255"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Apr 2025 13:58:47 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7hB6-0003cr-22;
	Wed, 23 Apr 2025 20:58:44 +0000
Date: Thu, 24 Apr 2025 04:58:34 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:rdpmc_cleanup 1/6]
 drivers/platform/x86/intel/pmc/cnp.c:230:2: error: call to undeclared
 function 'rdmsrq'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202504240413.9AOl1om5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git rdpmc_cleanup
head:   b470e22cbd59bb336b297a86f81f02f70717c4b0
commit: 85842d5ba6f8cda2e4a1c757ce9e100ad0cd1306 [1/6] x86/msr: Move rdtsc{,_ordered}() to <asm/tsc.h>
config: i386-buildonly-randconfig-003-20250424 (https://download.01.org/0day-ci/archive/20250424/202504240413.9AOl1om5-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250424/202504240413.9AOl1om5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504240413.9AOl1om5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/x86/intel/pmc/cnp.c:230:2: error: call to undeclared function 'rdmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     230 |         rdmsrq(MSR_PKG_CST_CONFIG_CONTROL, val);
         |         ^
>> drivers/platform/x86/intel/pmc/cnp.c:233:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     233 |         wrmsrq(MSR_PKG_CST_CONFIG_CONTROL, val);
         |         ^
   drivers/platform/x86/intel/pmc/cnp.c:242:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     242 |         wrmsrq(MSR_PKG_CST_CONFIG_CONTROL, per_cpu(pkg_cst_config, cpunum));
         |         ^
   3 errors generated.


vim +/rdmsrq +230 drivers/platform/x86/intel/pmc/cnp.c

7a797cc9f80915 David E. Box 2024-10-17  224  
7a797cc9f80915 David E. Box 2024-10-17  225  static void disable_c1_auto_demote(void *unused)
7a797cc9f80915 David E. Box 2024-10-17  226  {
7a797cc9f80915 David E. Box 2024-10-17  227  	int cpunum = smp_processor_id();
7a797cc9f80915 David E. Box 2024-10-17  228  	u64 val;
7a797cc9f80915 David E. Box 2024-10-17  229  
c435e608cf59ff Ingo Molnar  2025-04-09 @230  	rdmsrq(MSR_PKG_CST_CONFIG_CONTROL, val);
7a797cc9f80915 David E. Box 2024-10-17  231  	per_cpu(pkg_cst_config, cpunum) = val;
7a797cc9f80915 David E. Box 2024-10-17  232  	val &= ~NHM_C1_AUTO_DEMOTE;
78255eb2397332 Ingo Molnar  2025-04-09 @233  	wrmsrq(MSR_PKG_CST_CONFIG_CONTROL, val);
7a797cc9f80915 David E. Box 2024-10-17  234  
7a797cc9f80915 David E. Box 2024-10-17  235  	pr_debug("%s: cpu:%d cst %llx\n", __func__, cpunum, val);
7a797cc9f80915 David E. Box 2024-10-17  236  }
7a797cc9f80915 David E. Box 2024-10-17  237  

:::::: The code at line 230 was first introduced by commit
:::::: c435e608cf59ffab815aa2571182dc8c50fe4112 x86/msr: Rename 'rdmsrl()' to 'rdmsrq()'

:::::: TO: Ingo Molnar <mingo@kernel.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

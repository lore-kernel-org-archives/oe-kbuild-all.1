Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8694A2222C4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 15:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766246244; cv=none; b=KkgYkJovSDT/VJMhrSdsalNvgquJK4MT676HBJ53GxWEn4YBykcmbGTb+wySLpzqsOguvyc7adL7Gb3VOh0R7nGMcn6ZrS7qk+NWg40JobGJNLNlcOIrKRnBi4GdZ2Nui3LlDsrYM0boNk1SMxVx1Qx3Q5SytSM54koXSROyi5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766246244; c=relaxed/simple;
	bh=omb8aI6wKga/G/zA6JK4uiX66ncJ32nFc7DQH8j4tXc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ILjcUW+77ocEzb6IEjEzrP3cqP85qFO4+t+laPfFlyBznmbMqAZVewdj4zT95B9oOwYZDAFtK/nkoAMMSYr5ljMCk9KcO74ECr7rTTTB24oR85PVC4z3exBYYsN0TzgkcAPwH9dPKEGjEcYjT1RcJgviGbeoDoU2ODz/gVcz2TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A1Z5LiOz; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A1Z5LiOz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766246242; x=1797782242;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=omb8aI6wKga/G/zA6JK4uiX66ncJ32nFc7DQH8j4tXc=;
  b=A1Z5LiOzgBk4cTn8DThser6bO5XeWoPTvFe2gjTxStYj0cavNu9ARvV2
   YPOJ25ZqOb7UR2R9PexbVswRYaWNNVmfNdAdFVyLy17n04Y2X+QPkFKKD
   qV4zHPkFMOG9e+CEPvhy0SwCS0aBAGAOZ16wbEZEC7FmQC120avfJnyYP
   M4ezD8fnOkdDZQyK+Nt2XDm48Jtn8WeQ/mocm5yLl/kREXbYzTtgGZh73
   sPs3yfTZ5H4H+y9mTvzP2G/cSR8BGEj9woVSbkz42eWMg1DoDFpGqq/n0
   2qJbQV8z+zYG83rhkWR0JtudDRJXD5HK6pnurIJaGq17haM3XKQB4sX0w
   w==;
X-CSE-ConnectionGUID: PbzARl2USZCtaYngvZ9MTA==
X-CSE-MsgGUID: JtGBQjPGTc6kbrPCt7wAFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="70748091"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="70748091"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 07:57:22 -0800
X-CSE-ConnectionGUID: khUkmQb/T6yFNLxdOyu/ZQ==
X-CSE-MsgGUID: jqJ4ouu/Th6EhCZZbpXwAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199642893"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Dec 2025 07:57:21 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWzKZ-000000004oF-0FiO;
	Sat, 20 Dec 2025 15:57:19 +0000
Date: Sat, 20 Dec 2025 23:57:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3544/3544]
 arch/arm64/kernel/cpufeature.c:2129:13: warning: 'enable_pseudo_nmi' defined
 but not used
Message-ID: <202512202332.cPVupLsK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi caijian,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: c6ce2becb89528f83c1ad3c0607ad05baecebc0a [3544/3544] arm64/cpufeature: Fix pseudo nmi identifier undeclaration complilation error
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20251220/202512202332.cPVupLsK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202332.cPVupLsK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202332.cPVupLsK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/cpufeature.c:2129:13: warning: 'enable_pseudo_nmi' defined but not used [-Wunused-variable]
    2129 | static bool enable_pseudo_nmi;
         |             ^~~~~~~~~~~~~~~~~


vim +/enable_pseudo_nmi +2129 arch/arm64/kernel/cpufeature.c

3e6c69a058deaa Mark Brown     2019-12-09  2127  
f72387e1f8bc99 Mark Brown     2022-11-03  2128  #if IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI) || IS_ENABLED(CONFIG_ARM64_NMI)
bc3c03ccb4641f Julien Thierry 2019-01-31 @2129  static bool enable_pseudo_nmi;
f72387e1f8bc99 Mark Brown     2022-11-03  2130  #endif
bc3c03ccb4641f Julien Thierry 2019-01-31  2131  

:::::: The code at line 2129 was first introduced by commit
:::::: bc3c03ccb4641fb940b27a0d369431876923a8fe arm64: Enable the support of pseudo-NMIs

:::::: TO: Julien Thierry <julien.thierry@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AD03CA4AD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 10:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781172480; cv=none; b=Kiy040N2r6xF63RGPceSiBj/qxNaNYGWvJJ2Ti3h1v/FrzGLVGj0Pf9lii/vGTK3PCOhCUrxHbNixlDLDJu7q2VYD/3HXRDSw/5DIj+VaSf3G8D4BlFTzyQw2JP1q2fd/OIVCeLrNo8ZqNB9qQwX2zi4Dd+UMiyHefW6fOvPC3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781172480; c=relaxed/simple;
	bh=/wwjO4q9tWLS4eVK5eXn+mBKHzRemg4Mbm4bOBICbGk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s4le368ePcTxm21KniRyP0L5ixSKDEAc1yrI4yubiQTaV6OHKkm3KgutbFGCM+Oa8wxRv9uG6Yzbhlu9iNVe4U8PhfmAdi9B9Pr9RJ5dE/R18frnbd+V9U/Ogf6vZQFH1YCPKKwlNghqYSr6NznvclObSIabs9Di2JdNg58SZiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UafvUtkv; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UafvUtkv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781172480; x=1812708480;
  h=date:from:to:cc:subject:message-id;
  bh=/wwjO4q9tWLS4eVK5eXn+mBKHzRemg4Mbm4bOBICbGk=;
  b=UafvUtkvOFJzA58+skD3eb0pLnPJ31YxpgFIS85AhOziTF99T3L4rAt9
   ENx5jKDdvYt/3pztDqOz0g3+6vYaiiGdUu+tC9BUhrVvQ2lmRWtin2Ciu
   m76GmxlyDlA5335p73nBDBSqogDMjTQg/WMQ75mgIODJ4QJL3qQgQbtDk
   U2ug2iNo2CmDukg3iKu6z/L+ly79/2FECju2ZN7I9R70SkvoUmv2W6wnh
   CZJ8yQyCvmltEaU407RlnRNa95pjiXzzYsq0KcicO3OMvBDx60kT2YNhK
   0PPahyCFKr0P93YMh76JzrOrRlyTjribPFRaMyMz+qUli9pzCzT3SDYbz
   w==;
X-CSE-ConnectionGUID: n54+bvy8TaWNEWPw8R26ZQ==
X-CSE-MsgGUID: dyIcZMKgT2ujEwQ+UFvrlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81961792"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="81961792"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 03:08:00 -0700
X-CSE-ConnectionGUID: oCImdu7zRUScV1NXRUBU2A==
X-CSE-MsgGUID: s9KqaKDmR86S+8wQUMf0FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="246459578"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Jun 2026 03:07:58 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXcKJ-00000000Mkc-1eF2;
	Thu, 11 Jun 2026 10:07:55 +0000
Date: Thu, 11 Jun 2026 18:07:23 +0800
From: kernel test robot <lkp@intel.com>
To: Johan Hovold <johan@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Ulf Hansson <ulfh@kernel.org>
Subject: [ulfh-pm:next 12/12] drivers/pmdomain/core.c:36:23: warning:
 unused variable 'genpd_provider_bus'
Message-ID: <202606111737.obDDO7J9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git next
head:   ea1ca762328194de780a8e92df0b2e41bf6eeed2
commit: ea1ca762328194de780a8e92df0b2e41bf6eeed2 [12/12] pmdomain: fix early domain registration
config: x86_64-randconfig-161-20260611 (https://download.01.org/0day-ci/archive/20260611/202606111737.obDDO7J9-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606111737.obDDO7J9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606111737.obDDO7J9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pmdomain/core.c:36:23: warning: unused variable 'genpd_provider_bus' [-Wunused-variable]
      36 | static struct device *genpd_provider_bus;
         |                       ^~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/genpd_provider_bus +36 drivers/pmdomain/core.c

31cb75077003ac Ulf Hansson  2025-07-01  34  
31cb75077003ac Ulf Hansson  2025-07-01  35  /* The parent for genpd_provider devices. */
a96e40f4afdcb5 Johan Hovold 2026-04-24 @36  static struct device *genpd_provider_bus;
31cb75077003ac Ulf Hansson  2025-07-01  37  

:::::: The code at line 36 was first introduced by commit
:::::: a96e40f4afdcb52a9c97a5465c964e010734d105 pmdomain: core: switch to dynamic root device

:::::: TO: Johan Hovold <johan@kernel.org>
:::::: CC: Ulf Hansson <ulfh@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

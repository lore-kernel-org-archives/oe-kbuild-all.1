Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1CF7C081
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 May 2024 07:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716364216; cv=none; b=jiu286XXDQG1RKbV6WuWj5OYV2zRdrghhjP1NSQuwlhuKAjmb601HzASQ3awOVrhCxzU3cqJc6jOulUNij7A2/+7QxVheIECN0/2sRSJG4XK+HScyQwIvaSAQAaAFYmXLUcMwixtkGIbb5+hdrLiM9bepclTpd369LY53IbxeEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716364216; c=relaxed/simple;
	bh=IQxpI2JuYuRkIb+CWIq7rAdQ+f+MLZXjiA5JICE1Qto=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YVuDxRVVY6THP1QhjDA0S3LZOpmcxbaJ8YSetLJ94fJmnFX2NmXYhuVUOXrNvi+V28XizBX/MBXAi1dQ3G6y3Mu+xNL7QJBcF9lQhfS+04/5/7QgwAl2t0OznC3VGEC2WvQUAKMU+1OpKj1yQtjvVQqx8aVyxAQy53ONLnVCJXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BDfvHJCn; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BDfvHJCn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716364215; x=1747900215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IQxpI2JuYuRkIb+CWIq7rAdQ+f+MLZXjiA5JICE1Qto=;
  b=BDfvHJCnDxtQZtAs+MtSKp6FWBqTubJMZ8NPN5jzooDQaoKQGOISguU7
   w+XUlTdhPjg5A0KafXFQbIQ5WI4SSu8Z7c30QN1yN1NZ/Y9noVaTcABse
   kU3tlyLAQWTQCcca/v6fRysUaqVd18DKX3tiyGKiXmS2m6YHRd68j+Jm1
   DFK2uNHkTvx8miAzHk+Fmgo3DxhLPWaBVN8g7kTAvhGvpU3xCYJo62K9c
   DU7WVBhBJ0ClOshlCQz/jNBG6uz1oAnHrrGEB985doLxNAJcIq07XkI3h
   rBUZzEQYznGHev2Nx5pNFt+01gDsA1DObs/f2H7hfSkuBjsws36nRT5hl
   A==;
X-CSE-ConnectionGUID: FqL+FHV+RC6lGpjTvNUxlw==
X-CSE-MsgGUID: 2zR3LFocRE+l0u1iGdu1ZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="12711924"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="12711924"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 00:50:14 -0700
X-CSE-ConnectionGUID: 0E3nBkO+Qv2dKThGcvj8fw==
X-CSE-MsgGUID: aNPt7MSuTmqLI3fWTMPZvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="33209758"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 22 May 2024 00:50:12 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9gjV-00019H-0X;
	Wed, 22 May 2024 07:50:00 +0000
Date: Wed, 22 May 2024 15:49:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hao Chen <970353908@qq.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 9677/9701]
 arch/arm64/kernel/cpufeature.c:2129:13: warning: 'enable_pseudo_nmi' defined
 but not used
Message-ID: <202405221540.3vBxARIZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a06dd08e9351e0389df4f63a9b400e134ed0c168
commit: c6ce2becb89528f83c1ad3c0607ad05baecebc0a [9677/9701] arm64/cpufeature: Fix pseudo nmi identifier undeclaration complilation error
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240522/202405221540.3vBxARIZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240522/202405221540.3vBxARIZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405221540.3vBxARIZ-lkp@intel.com/

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

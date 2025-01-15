Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4491C1EEA38
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Jan 2025 10:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736936151; cv=none; b=bM9z3J0V54vrXpI+3rTMpAl+aqF3Hz+GBHHyddXotYYoW4oXO+SOUcJlrs3COp1azsOXmCpNBseet9WQTRaX6zMR1vKaz0y+8Uj6XW/0WwKDqfNNuHoL6X3EbWMnWXJOxrsKF3x2Q0xPhb+M51LQjPaJ9y+113YZw9J8sJPlNME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736936151; c=relaxed/simple;
	bh=xaRTfp+AZ3gJ6rEbt+v+MMqSkt2s1LFuEGLRYMl5RTo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rUW3s8XJXbsbAFeNib3g5eQ3kb4NJE9G8vT+NdCwxcRbevxrm5BCdtq3/onr+Noj7a4iP7xYyJV6dweXoucQnpj1QMOD31ybYBH8A8DhVHetJKVZZE3Q1P3Dr6PvCY6v8KOJR3xkE8Ru/uyCxG/wx4GpEjj1fE/bgkaLSgKpAV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S0YaqZ73; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S0YaqZ73"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736936149; x=1768472149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xaRTfp+AZ3gJ6rEbt+v+MMqSkt2s1LFuEGLRYMl5RTo=;
  b=S0YaqZ733f/3Irq9eQDANQDpMaWs7KlWA70p9md7uoUy3iZQZ72HjyUW
   fLHIMDpYKBtolGlpdu9s1jFTaDi47x9E69zooXybJRmhXh1uGAuHRHzIj
   3L/atRsCHqigsYwQ1Dej0DRSFUfCGhnj8jJ5rs3zEg5UI9nAqlCP3SJ8V
   N+sI8egv/5jx2wdv20sM82syJ5a3L1orqyAS+3ROPFK8wYdwSuRGU5ums
   R7HwM0prThh1SxqP95Z6vhAzHjcvrtbLqUk8Q0aer484rCgAN9dplUv8U
   ZBdoLRV7KWetOeYazl5tJd1UcGDnOsaGZPDa6tDIYxpkYdBysCjOnjk3Z
   w==;
X-CSE-ConnectionGUID: TnNJ8cAkRdmKiz4slRpbtw==
X-CSE-MsgGUID: wa88lOh6Sh+/VGPXry6L2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="48648359"
X-IronPort-AV: E=Sophos;i="6.12,317,1728975600"; 
   d="scan'208";a="48648359"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 02:15:49 -0800
X-CSE-ConnectionGUID: OJUWZueqRxm/b0sGwSlQZA==
X-CSE-MsgGUID: 6q3nL+gjTl6L1jFxW66JHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110229741"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Jan 2025 02:15:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tY0R7-000Pm7-2Y;
	Wed, 15 Jan 2025 10:15:45 +0000
Date: Wed, 15 Jan 2025 18:15:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 258/258] drivers/memory/mtk-smi.c:856:41:
 warning: 'mtk_smi_common_mt8196' defined but not used
Message-ID: <202501151806.TiUUKm9F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   68c161ca42a79e2be7efa175b36a54f66c647862
commit: fb50c7382cab5ae14ad2a9f6aa465230af1b252c [258/258] CHROMIUM: memory: mtk-smi: Add mt8196 support
config: i386-buildonly-randconfig-002-20250115 (https://download.01.org/0day-ci/archive/20250115/202501151806.TiUUKm9F-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250115/202501151806.TiUUKm9F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501151806.TiUUKm9F-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/memory/mtk-smi.c:856:41: warning: 'mtk_smi_common_mt8196' defined but not used [-Wunused-const-variable=]
     856 | static const struct mtk_smi_common_plat mtk_smi_common_mt8196 = {
         |                                         ^~~~~~~~~~~~~~~~~~~~~


vim +/mtk_smi_common_mt8196 +856 drivers/memory/mtk-smi.c

   855	
 > 856	static const struct mtk_smi_common_plat mtk_smi_common_mt8196 = {
   857		.type     = MTK_SMI_GEN2,
   858	};
   859	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

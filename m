Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956A73C1412
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 11:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778758543; cv=none; b=Jru5Amd61zHj4dEaBTF0uT0+qyX+eNm275jBDCFV1J3tJ+7aWeEsFdzExof0u5q3UfwKKfG1pu4JQ1Mc+4qvvBRdctrLP+z0eTS8w6snXCvtd7Vn2RgaLxJNiO0Mq8Z0m22Cn0a06i0m3AQi8Xfy4v6eVphssRXugC5ms1xMN9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778758543; c=relaxed/simple;
	bh=eBGmvDv7fBatj0NQ9JAHG1KHMaKyi4Orw2cZ81jPPrs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BrPS5EvgHyjUipJV3Jcv3Cd+Eg+6wX/GeqjrDCeO9j/zNJCvDtAxn9FPBhkhVyAutzMvbcXG0J9fckCQaCLJ93Oxma9QmlnCBKe5TxNMxYvOJ9mclMITuxI5B4BTvBZlJEluwhqAGOusghhkaQ4Lr7qJTUYa2JkbcqePCBNtuhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GmTpJ2vI; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GmTpJ2vI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778758542; x=1810294542;
  h=date:from:to:cc:subject:message-id;
  bh=eBGmvDv7fBatj0NQ9JAHG1KHMaKyi4Orw2cZ81jPPrs=;
  b=GmTpJ2vIRzAbsIxaHqPE7ZDYPyX1l1QpK5jH3TWGRH5SMCeubr+cpF+H
   dHcSYTIXrLrIx1ycydHNydzVstB0SrHFqDGvUDIAWPvSSQFZTf+hO6oEU
   owVqCiNU7/WbVlcYmikaja1pLhQfQUDMoR6pH8igKKL6/l0TuyNHVaMxR
   NBavfN3EvogIPmoyjMIIRwYDtp7KKaBZxLxd6Of8N/ULjaqfiJ/Th7hiC
   CRo58R6RP8fzoJ57M7sWPhU2SGs+khtio2HcqjrMUiDuUGLIXt8m5Uqo4
   ysdYQ4/rDNoGoSo20LvsAXmEtTNJkbtmrc6eeGyA266td7+ZJh047y49y
   A==;
X-CSE-ConnectionGUID: IiGwloKhRxWUpqBUGLWn9A==
X-CSE-MsgGUID: tYFOPNAFQuSHPbadHZ4Kag==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="105157374"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="105157374"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 04:35:39 -0700
X-CSE-ConnectionGUID: XE0jITotTVyggquJhMOC7Q==
X-CSE-MsgGUID: KLGLd/hLQqqCsmxckgkRvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="235720663"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 May 2026 04:35:37 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNULn-000000006RJ-0WPi;
	Thu, 14 May 2026 11:35:35 +0000
Date: Thu, 14 May 2026 19:35:31 +0800
From: kernel test robot <lkp@intel.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [linux-next:master 325/4394]
 drivers/gpu/drm/bridge/of-display-mode-bridge.c:54:25: sparse: sparse: symbol
 'of_display_mode_bridge_funcs' was not declared. Should it be static?
Message-ID: <202605141933.yeT5SiTT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e98d21c170b01ddef366f023bbfcf6b31509fa83
commit: ba2db93cf3d569a4525a02cd0ed5ec5f979e3afd [325/4394] drm/bridge: Move legacy bridge driver out of imx directory for multi-platform use
config: openrisc-randconfig-r122-20260514 (https://download.01.org/0day-ci/archive/20260514/202605141933.yeT5SiTT-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141933.yeT5SiTT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605141933.yeT5SiTT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/bridge/of-display-mode-bridge.c:54:25: sparse: sparse: symbol 'of_display_mode_bridge_funcs' was not declared. Should it be static?

vim +/of_display_mode_bridge_funcs +54 drivers/gpu/drm/bridge/of-display-mode-bridge.c

    53	
  > 54	struct drm_bridge_funcs of_display_mode_bridge_funcs = {
    55		.attach = of_display_mode_bridge_attach,
    56		.get_modes = of_display_mode_bridge_get_modes,
    57	};
    58	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

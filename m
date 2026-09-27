Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3767C81724
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 03:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790479161; cv=none; b=JtvLa+PBb6InYTDWzGrc3x5LwVfrGz4KIYYs8LWl1vmdHE89tceyPj4ihHy0m/PJ3CJ2ZqXkLG66wR5fNWaEr6xLNMzPmQdmaV4B3R2i4KhPgi+PEaqL2CoH2h/d/eyDoz+lVQJapN/1ngHIJQz1Be1rT+zLOlNjwwiPVCdbud0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790479161; c=relaxed/simple;
	bh=aY86caGFW7LVyDoY23A0aBo5JcYrOWMendcpZB/WVpQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ONUIItJP3s20Une3keJcj1Cvt1yPbbpPmHW2G/gvWE1xBFVBiHfsMEPH2emD2UV3FQeXrRxogL5vy7Nu2O5lS+bXRz88JXDi2+ctMwOa2y9f19Y5lo1Mc/BbsxFUK5uEBSfpdA/jpTzBGWFyBuvq3+eapULyMDgRDlKlnfN+aOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CwnT3+W8; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CwnT3+W8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790479160; x=1822015160;
  h=date:from:to:cc:subject:message-id;
  bh=aY86caGFW7LVyDoY23A0aBo5JcYrOWMendcpZB/WVpQ=;
  b=CwnT3+W8Jugpx3XRsOx3PmVX5vHf5JOToTKlh/N2zrhfpQgAVeN/RaxV
   59fKNnqkebRzieqg1Wrafs4MxrkOIYnlQj0T3fTbpgOQmef+mmXTBYl/D
   d0ELs0spoTaSn9hs5oLlljmg0bvCD6mX32AFgs0raTXJgC9jkIjQr6c/9
   4U3zuYXCKc6qHcR+CG0//P8iLQO18PF0T8XRLG012QsBFjPXBqRxIEBuJ
   WIJ3xf4tmxd9zKq+X/NjeJ50CxMMmebj/UNRmU5pcr/xG2kM6ardmYqy+
   +cylU5r2N0vcYqWbHbhRMlaslPrHSyS8CnUcFJLpPY0DmIXOwWQXNKrey
   g==;
X-CSE-ConnectionGUID: aWT/DRSxRimAQLIvZXTWnQ==
X-CSE-MsgGUID: gidwup7pRvCT/Xbm4RX2hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="90272441"
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="90272441"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 20:19:19 -0700
X-CSE-ConnectionGUID: ca3fSGKqTC+8buULXfmoWQ==
X-CSE-MsgGUID: pqdxmu7cTWKVwIBNf8os8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="278521486"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 Sep 2026 20:19:17 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAfQ2-00000000MN7-2hJI;
	Sun, 27 Sep 2026 03:19:14 +0000
Date: Sun, 27 Sep 2026 11:18:31 +0800
From: kernel test robot <lkp@intel.com>
To: Ravikanth Tuniki <ravikanth.tuniki@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>,
 Srinivas Neeli <srinivas.neeli@amd.com>,
 Harini Katakam <harini.katakam@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.18_LTS 29/1212] Warning: 710
Message-ID: <202609271134.95I4M8qu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ravikanth,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.18_LTS
head:   7e498a7051b6b67bed11b347e6b66e802a20d280
commit: e4a46b3732db2752cde2ba957c5d0f3e571add3f [29/1212] net: axienet: added multichannel DMA support
config: um-randconfig-1000-20260926 (https://download.01.org/0day-ci/archive/20260927/202609271134.95I4M8qu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260927/202609271134.95I4M8qu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609271134.95I4M8qu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: 710

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

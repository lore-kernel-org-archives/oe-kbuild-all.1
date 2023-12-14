Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D329F35EE8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 10:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kk/PnZix"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702549717; x=1734085717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CJ9kcWA//sYHL1BXwVgRlpFbobBmbNyxPZSG9ZIqt70=;
  b=kk/PnZixY27sv8w4r8eSVxetoLcqFzM03/9F9uSE4IQsh08RADlYdgqU
   XOHsxCzwP2HXbuG+aJqM0Qj7Cf3p9Lt45HzjDBJUumzN7B/Zpqar5dmLL
   cpJC5EwU5I9a3N4bJIT6rO9H+E2OPtaL/AvFok6IvsBX3OcoIdpvP0cUT
   TrDx/RnC/+xru3NRlsJnEK9yatJv3yFJTpNH+HiwQYAAf7HnPcmPY7DAQ
   rPy0cGNgze+svAPZyN9L9ZfxXuSq4WcrFCdunHaTNUmwfgwUpbzDG2moP
   unN07R7a3jhUsLNfHTcZYOQ3rrj4v9VtrOvaMPftBn7BHjeTQDH85l48l
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="461565952"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="461565952"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 02:28:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="1105653391"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="1105653391"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 14 Dec 2023 02:28:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDixE-000Lv5-3C;
	Thu, 14 Dec 2023 10:28:32 +0000
Date: Thu, 14 Dec 2023 18:27:56 +0800
From: kernel test robot <lkp@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Matt Roper <matthew.d.roper@intel.com>
Subject: [drm-xe:drm-xe-next 2/10] xe_device.c:undefined reference to
 `__aeabi_uldivmod'
Message-ID: <202312141859.Qn7S2Ieo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   5cd1893366708380854f4694ae57417192458a6b
commit: a97c51fffc4b750eebfb784842d58de04da96be7 [2/10] drm/xe/xe2: Modify main memory to ccs memory ratio.
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20231214/202312141859.Qn7S2Ieo-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312141859.Qn7S2Ieo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312141859.Qn7S2Ieo-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/gpu/drm/xe/xe_device.o: in function `xe_device_ccs_bytes':
>> xe_device.c:(.text+0x1e28): undefined reference to `__aeabi_uldivmod'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [y]:
   - INTEL_MEI_HDCP [=y] && (DRM_I915 [=n] || DRM_XE [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

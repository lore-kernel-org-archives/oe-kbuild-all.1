Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7F71876
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 03:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714275190; cv=none; b=CIAy88ZMczyRGvBpuHNyMzcTNiPOQwMhg0RC5Edg1K24DX4N1q91vLmcugVSbtFxiLpR+FjdJombUtTdbqbLa/AyluKlgvbFqSarMfe7H4OE+cE5Ezu5myCieHloWP6V940PwUftIK6qAwnG5hcBEIsN6gh8vVljR2MAuyTo178=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714275190; c=relaxed/simple;
	bh=6ioau78Ew4BRnfh/n8jN88FTyJmVsJbhLzZpT/Inkxo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T9Mu7i43q9bpuaGcKht6NSrkjiXvphPFRCVxiFTd2DCZSjnMZRu1Q+AAVxYrtB66qlT/A0Qo4Tnilb8BYZPCXvpWQOEndMgABna2dGwI6AbGPVjMp10xVGPBsyNCbLT4zXCh/S4RnsTWR+aQ4fl6qWIs26ne5hVBRRMia8VMKxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xd4CRvva; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xd4CRvva"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714275189; x=1745811189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6ioau78Ew4BRnfh/n8jN88FTyJmVsJbhLzZpT/Inkxo=;
  b=Xd4CRvvaFAcNo0Dq8ZqvcS0ebEXC2oORKfcgxLF9k70OvOKFHQKcEahE
   VR2nv+ffw6xtz9IZRrCrYBFrFjuLsuNHtD8Htjtr8IK8c1ZQ5Vwq2Maqs
   gIF+KnlMRTjT9hHw11RNSnVBWS7lqtf+WRjb4iYOhN7y8Q1KaBa9aC9y9
   k0LXZnlf6GGyRrQUskP9mF/89/hwUb4xn8IRiMAH+h3830rC/VhjQ8j76
   mzL9UrtXG3B9lkOX0yN0jbskXVmrWVoCPaIfh3xTHZJANl8wHyW0yRBJE
   P+wS3Sr8G8Ib9yGcPcdEZBXz6vKY2Yar3vy4jYG9TG3NRtsZnplvs0Qrc
   w==;
X-CSE-ConnectionGUID: VaXkntmcQQmOXQBbOcvptA==
X-CSE-MsgGUID: N8Z4Vkj7TeaLp4fyYZxacw==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10090667"
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="10090667"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 20:33:08 -0700
X-CSE-ConnectionGUID: o6t2jac1QIu7K//+0wrK4Q==
X-CSE-MsgGUID: K62fEWf+T6iJQX4tidf3fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="25759542"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 Apr 2024 20:33:07 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0vHk-0005o2-1k;
	Sun, 28 Apr 2024 03:33:04 +0000
Date: Sun, 28 Apr 2024 11:32:42 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 5708/11728]
 drivers/media/platform/nxp/dwc-mipi-csi2.c:117:57: error: implicit
 declaration of function 'FIELD_PREP'
Message-ID: <202404281115.sCxkwMuW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: 082dd12f8b589393f5227c2d64e358da78bd6f35 [5708/11728] LF-10587-05: media: nxp: add DesignWare MIPI CSI controller driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240428/202404281115.sCxkwMuW-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404281115.sCxkwMuW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404281115.sCxkwMuW-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/media/platform/nxp/dwc-mipi-csi2.c: In function 'dwc_csi_device_pg_enable':
>> drivers/media/platform/nxp/dwc-mipi-csi2.c:117:57: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     117 | #define CSI2RX_PPI_PG_PATTERN_HRES_HRES(x)              FIELD_PREP(GENMASK(15, 0), (x))
         |                                                         ^~~~~~~~~~
   drivers/media/platform/nxp/dwc-mipi-csi2.c:550:15: note: in expansion of macro 'CSI2RX_PPI_PG_PATTERN_HRES_HRES'
     550 |         val = CSI2RX_PPI_PG_PATTERN_HRES_HRES(format->width);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/dwc-mipi-csi2.c: At top level:
>> drivers/media/platform/nxp/dwc-mipi-csi2.c:1395:12: warning: 'dwc_csi_runtime_resume' defined but not used [-Wunused-function]
    1395 | static int dwc_csi_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/nxp/dwc-mipi-csi2.c:1385:12: warning: 'dwc_csi_runtime_suspend' defined but not used [-Wunused-function]
    1385 | static int dwc_csi_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/nxp/dwc-mipi-csi2.c:1372:12: warning: 'dwc_csi_system_resume' defined but not used [-Wunused-function]
    1372 | static int dwc_csi_system_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/nxp/dwc-mipi-csi2.c:1367:12: warning: 'dwc_csi_system_suspend' defined but not used [-Wunused-function]
    1367 | static int dwc_csi_system_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +117 drivers/media/platform/nxp/dwc-mipi-csi2.c

   114	
   115	/* Pattern Generator horizontal Resolution */
   116	#define CSI2RX_PPI_PG_PATTERN_HRES			0x64
 > 117	#define CSI2RX_PPI_PG_PATTERN_HRES_HRES(x)		FIELD_PREP(GENMASK(15, 0), (x))
   118	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
